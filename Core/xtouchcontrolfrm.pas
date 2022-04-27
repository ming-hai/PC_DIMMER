unit xtouchcontrolfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, gnugettext, Registry, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPServer, StdCtrls, IdGlobal, IdSocketHandle, ExtCtrls,
  Buttons, PngBitBtn, Mask, JvExMask, JvSpin;

const
  {$I GlobaleKonstanten.inc}
  XTouchMaxRes=16383;

type
  TXCtlScribblePad = record
    ScribbleNeedsUpdate:boolean;
    TopText: string[8];
    BotText: string[8];
    Color: byte; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
    Inverted: boolean;
  end;
  // Buttons can be of type OFF, FLASHING, ON
  TXCtlChannel = record
    CorrespondingID: TGUID;
    CorrespondingChannel: integer;
    CorrespondingChannelName: string;

    ChannelNeedsUpdate:boolean;
    FaderEnabled:boolean;
    Faderposition:Word; // 0...16383
    LastFaderposition:Word; // 0...16383
    Meterlevel:byte; // 0...8
    DialLevel:byte; // 0...13

    Rec: byte; // 0=OFF, 1=ON, 2=FLASHING
    Solo: byte; // 0=OFF, 1=ON, 2=FLASHING
    Mute:byte; // 0=OFF, 1=ON, 2=FLASHING
    Select:byte; // 0=OFF, 1=ON, 2=FLASHING
  end;
  TXTouch = record
    IPAddress:string;
    ChannelOffset:Word;
    ScribblePad:array[0..7] of TXCtlScribblePad;
    Channel:array[0..7] of TXCtlChannel;
    FaderNeedsUpdate:boolean;
    Masterfader:Word; // 0...16383
    JogDialValue:Byte;
    SegmentDisplay:array[0..11] of char;
    ButtonLightOn:array[0..102] of Byte;
    DisplaySelectedDevices:boolean;
    DisplayGlobalView:boolean;
  end;

  Txtouchcontrolform = class(TForm)
    xtouchserver: TIdUDPServer;
    WatchDogTimer: TTimer;
    UpdateTimer: TTimer;
    UpdateFaderTimer: TTimer;
    Panel1: TPanel;
    Button1: TButton;
    addbtn: TPngBitBtn;
    upbtn: TPngBitBtn;
    downbtn: TPngBitBtn;
    deletebtn: TPngBitBtn;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    Panel4: TPanel;
    ListBox1: TListBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    GroupBox2: TGroupBox;
    Panel8: TPanel;
    Panel9: TPanel;
    Label1: TLabel;
    resetbtn: TButton;
    ListBox2: TListBox;
    CheckBox1: TCheckBox;
    datainstartedit: TJvSpinEdit;
    Label2: TLabel;
    activebtn: TButton;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure activebtnClick(Sender: TObject);
    procedure xtouchserverUDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
    procedure WatchDogTimerTimer(Sender: TObject);
    procedure UpdateTimerTimer(Sender: TObject);
    procedure UpdateFaderTimerTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure addbtnClick(Sender: TObject);
    procedure upbtnClick(Sender: TObject);
    procedure downbtnClick(Sender: TObject);
    procedure deletebtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure resetbtnClick(Sender: TObject);
    procedure datainstarteditChange(Sender: TObject);
    procedure CheckBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure xtouchserverUDPException(AThread: TIdUDPListenerThread;
      ABinding: TIdSocketHandle; const AMessage: String;
      const AExceptionClass: TClass);
  private
    { Private-Deklarationen }
    UseDataIn:boolean;
    DataInOffset:Word;

    XTouchDevices:array of TXTouch;
    TotalChannelsToDisplay:Word;
    XCtl_Probe:TIdBytes;
    XCtl_ProbeResponse:TIdBytes;
    XCtl_ProbeB, XCtl_ProbeC:TIdBytes;
    XCtl_IdlePacket:TIdBytes;
    //RefreshXTouch:integer;
    function GetSegmentBitmap(Character: char):Word;
    procedure UpdateXTouchData;
    procedure SendDataToXTouchDevices;
    procedure SendDataToXTouchDevices_Faders;
    procedure SaveSettings;
    procedure LoadSettings;
    procedure RefreshList;
  public
    { Public-Deklarationen }
    procedure MSGNew;
    procedure MSGOpen;
  end;

var
  xtouchcontrolform: Txtouchcontrolform;

implementation

uses PCDIMMER, geraetesteuerungfrm, adddevicetogroupfrm;

{$R *.dfm}

procedure Txtouchcontrolform.FormCreate(Sender: TObject);
begin
  TranslateComponent(self);
  LoadSettings;

  setlength(XTouchDevices, 0);

  setlength(XCtl_Probe, 8);
  XCtl_Probe[0]:=$F0;
  XCtl_Probe[1]:=$00;
  XCtl_Probe[2]:=$20;
  XCtl_Probe[3]:=$32;
  XCtl_Probe[4]:=$58;
  XCtl_Probe[5]:=$54;
  XCtl_Probe[6]:=$00;
  XCtl_Probe[7]:=$F7;

  setlength(XCtl_ProbeResponse, 8);
  XCtl_ProbeResponse[0]:=$F0;
  XCtl_ProbeResponse[1]:=$00;
  XCtl_ProbeResponse[2]:=$20;
  XCtl_ProbeResponse[3]:=$32;
  XCtl_ProbeResponse[4]:=$58;
  XCtl_ProbeResponse[5]:=$54;
  XCtl_ProbeResponse[6]:=$01;
  XCtl_ProbeResponse[7]:=$F7;

  setlength(XCtl_ProbeB, 18);
  XCtl_ProbeB[0]:=$F0;
  XCtl_ProbeB[1]:=$00;
  XCtl_ProbeB[2]:=$00;
  XCtl_ProbeB[3]:=$66;
  XCtl_ProbeB[4]:=$58;
  XCtl_ProbeB[5]:=$01;
  XCtl_ProbeB[6]:=$30;
  XCtl_ProbeB[7]:=$31;
  XCtl_ProbeB[8]:=$35;
  XCtl_ProbeB[9]:=$36;
  XCtl_ProbeB[10]:=$34;
  XCtl_ProbeB[11]:=$30;
  XCtl_ProbeB[12]:=$36;
  XCtl_ProbeB[13]:=$36;
  XCtl_ProbeB[14]:=$37;
  XCtl_ProbeB[15]:=$34;
  XCtl_ProbeB[16]:=$30;
  XCtl_ProbeB[17]:=$F7;

  setlength(XCtl_ProbeC, 18);
  XCtl_ProbeC[0]:=$F0;
  XCtl_ProbeC[1]:=$00;
  XCtl_ProbeC[2]:=$00;
  XCtl_ProbeC[3]:=$66;
  XCtl_ProbeC[4]:=$58;
  XCtl_ProbeC[5]:=$01;
  XCtl_ProbeC[6]:=$30;
  XCtl_ProbeC[7]:=$31;
  XCtl_ProbeC[8]:=$35;
  XCtl_ProbeC[9]:=$36;
  XCtl_ProbeC[10]:=$34;
  XCtl_ProbeC[11]:=$30;
  XCtl_ProbeC[12]:=$36;
  XCtl_ProbeC[13]:=$33;
  XCtl_ProbeC[14]:=$44;
  XCtl_ProbeC[15]:=$35;
  XCtl_ProbeC[16]:=$36;
  XCtl_ProbeC[17]:=$F7;

  setlength(XCtl_IdlePacket, 7);
  XCtl_IdlePacket[0]:=$F0;
  XCtl_IdlePacket[1]:=$00;
  XCtl_IdlePacket[2]:=$00;
  XCtl_IdlePacket[3]:=$66;
  XCtl_IdlePacket[4]:=$14;
  XCtl_IdlePacket[5]:=$00;
  XCtl_IdlePacket[6]:=$F7;
end;

procedure Txtouchcontrolform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveSettings;
end;

procedure Txtouchcontrolform.SaveSettings;
var
  LReg:TRegistry;
begin
  LReg:=TRegistry.Create;
  LReg.RootKey:=HKEY_CURRENT_USER;

  if LReg.OpenKey('Software', True) then
  begin
    if not LReg.KeyExists('PHOENIXstudios') then
      LReg.CreateKey('PHOENIXstudios');
    if LReg.OpenKey('PHOENIXstudios',true) then
    begin
      if not LReg.KeyExists('PC_DIMMER') then
        LReg.CreateKey('PC_DIMMER');
      if LReg.OpenKey('PC_DIMMER',true) then
      begin
        if not LReg.KeyExists('XTouchControl') then
          LReg.CreateKey('XTouchControl');
        if LReg.OpenKey('XTouchControl',true) then
        begin
          LReg.WriteBool('UseDataIn', Checkbox1.checked);
          LReg.WriteInteger('DataInOffset', round(datainstartedit.Value));
        end;
      end;
    end;
  end;

  LReg.CloseKey;
  LReg.Free;
end;

procedure Txtouchcontrolform.LoadSettings;
var
  LReg:TRegistry;
begin
  LReg:=TRegistry.Create;
  LReg.RootKey:=HKEY_CURRENT_USER;

  if LReg.OpenKey('Software', True) then
  begin
    if not LReg.KeyExists('PHOENIXstudios') then
      LReg.CreateKey('PHOENIXstudios');
    if LReg.OpenKey('PHOENIXstudios',true) then
    begin
      if not LReg.KeyExists('PC_DIMMER') then
        LReg.CreateKey('PC_DIMMER');
      if LReg.OpenKey('PC_DIMMER',true) then
      begin
        if not LReg.KeyExists('XTouchControl') then
          LReg.CreateKey('XTouchControl');
        if LReg.OpenKey('XTouchControl',true) then
        begin
          if LReg.ValueExists('UseDataIn') then
          begin
            Checkbox1.Checked:=LReg.ReadBool('UseDataIn');
            UseDataIn:=Checkbox1.Checked;
          end;
          if LReg.ValueExists('DataInOffset') then
          begin
            datainstartedit.value:=LReg.ReadInteger('DataInOffset');
            DataInOffset:=round(datainstartedit.Value);
          end;
        end;
      end;
    end;
  end;

  LReg.CloseKey;
  LReg.Free;
end;

procedure Txtouchcontrolform.MSGNew;
begin
  setlength(mainform.XTouchDevices, 0);
  RefreshList;
end;

procedure Txtouchcontrolform.MSGOpen;
begin
  RefreshList;
end;

procedure Txtouchcontrolform.RefreshList;
var
  i, itemindex, listboxitemindex:integer;
begin
  listboxitemindex:=listbox1.ItemIndex;
  listbox1.Items.Clear;
  TotalChannelsToDisplay:=0;
  for i:=0 to length(mainform.XTouchDevices)-1 do
  begin
    itemindex:=geraetesteuerung.GetDevicePositionInDeviceArray(@mainform.XTouchDevices[i].ID);
    if itemindex>=0 then
    begin
      // is device
      mainform.XTouchDevices[i].IsDevice:=true;

      // detect channels to display
      mainform.XTouchDevices[i].ChannelsToDisplay:=0;
      if mainform.devices[itemindex].hasDimmer then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.devices[itemindex].hasShutter then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
{
      if mainform.devices[itemindex].hasVirtualRGBAWDimmer then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
}
      if mainform.devices[itemindex].hasRGB then
        mainform.XTouchDevices[i].ChannelsToDisplay:=mainform.XTouchDevices[i].ChannelsToDisplay+3;
      if mainform.devices[itemindex].hasAmber then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.devices[itemindex].hasWhite then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.devices[itemindex].hasUV then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.devices[itemindex].hasFog then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.devices[itemindex].hasPANTILT then
        mainform.XTouchDevices[i].ChannelsToDisplay:=mainform.XTouchDevices[i].ChannelsToDisplay+2;

      TotalChannelsToDisplay:=TotalChannelsToDisplay+mainform.XTouchDevices[i].ChannelsToDisplay;

      // display item in listbox
      if mainform.devices[itemindex].MaxChan>1 then
        listbox1.items.add(mainform.devices[itemindex].Name+' ['+_('Adresse:')+' '+inttostr(mainform.devices[itemindex].Startaddress)+'..'+inttostr(mainform.devices[itemindex].Startaddress+mainform.devices[itemindex].MaxChan-1)+', '+mainform.devices[itemindex].DeviceName+']')
      else
        listbox1.items.add(mainform.devices[itemindex].Name+' ['+_('Adresse:')+' '+inttostr(mainform.devices[itemindex].Startaddress)+', '+mainform.devices[itemindex].DeviceName+']');
    end else
    begin
      // is group
      mainform.XTouchDevices[i].IsDevice:=false;
      itemindex:=geraetesteuerung.GetGroupPositionInGroupArray(mainform.XTouchDevices[i].ID);

      // detect channels to display
      mainform.XTouchDevices[i].ChannelsToDisplay:=0;
      if mainform.DeviceGroups[itemindex].HasChanType[0] then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.DeviceGroups[itemindex].HasChanType[1] then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.DeviceGroups[itemindex].HasChanType[14] then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.DeviceGroups[itemindex].HasChanType[15] then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.DeviceGroups[itemindex].HasChanType[16] then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.DeviceGroups[itemindex].HasChanType[18] then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.DeviceGroups[itemindex].HasChanType[19] then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.DeviceGroups[itemindex].HasChanType[40] then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.DeviceGroups[itemindex].HasChanType[41] then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.DeviceGroups[itemindex].HasChanType[45] then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);
      if mainform.DeviceGroups[itemindex].HasChanType[46] then
        inc(mainform.XTouchDevices[i].ChannelsToDisplay);

      TotalChannelsToDisplay:=TotalChannelsToDisplay+mainform.XTouchDevices[i].ChannelsToDisplay;
      
      // display item in listbox
      if itemindex>=0 then
      begin
        listbox1.items.add(mainform.DeviceGroups[itemindex].Name+' ['+inttostr(length(mainform.DeviceGroups[itemindex].IDs))+' '+_('Ger�te')+', '+mainform.DeviceGroups[itemindex].Beschreibung+']');
      end else
      begin
        listbox1.Items.add(_('Fehlerhafter Eintrag!'));
      end;
    end;
  end;
  listbox1.itemindex:=listboxitemindex;

  Checkbox1.Checked:=UseDataIn;
  datainstartedit.Value:=DataInOffset;
end;

function Txtouchcontrolform.GetSegmentBitmap(Character: char):Word;
begin
  if Character='1' then result:=$06 else
  if Character='2' then result:=$5b else
  if Character='3' then result:=$4f else
  if Character='4' then result:=$66 else
  if Character='5' then result:=$6d else
  if Character='6' then result:=$7d else
  if Character='7' then result:=$07 else
  if Character='8' then result:=$7f else
  if Character='9' then result:=$6f else
  if Character='0' then result:=$3f else
  if Character='-' then result:=$40 else
  if Character='a' then result:=$77 else
  result:=0;
end;

procedure Txtouchcontrolform.UpdateXTouchData;
var
  i, i_dev, i_ch, i_subch, i_id, j:integer;
  NewValue:Word;
  NewText,NewText2:string;
  NewColor:byte;
  ChannelIsUsed:boolean;

  DeviceIndex, GroupIndex, Value:integer;
  ClockString, ValueString:string;
  SpreadText:boolean;
  DisplayText:string;
  ChannelTypeIsDone:array[0..10] of boolean;

  XTouchChannelOffsetCounter:integer;
  XTouchChannelCounter:integer;

  max_devices:integer;
  ChannelsToDisplay:integer;
  CurrentDeviceID:TGUID;

  function ReplaceGermanUmlaut(s: string):string;
  var
    s2:string;
  begin
    s2:=stringreplace(s, '�', 'ae', [rfReplaceAll]);
    s2:=stringreplace(s2, '�', 'oe', [rfReplaceAll]);
    s2:=stringreplace(s2, '�', 'ue', [rfReplaceAll]);
    s2:=stringreplace(s2, '�', 'Ae', [rfReplaceAll]);
    s2:=stringreplace(s2, '�', 'Oe', [rfReplaceAll]);
    s2:=stringreplace(s2, '�', 'Ue', [rfReplaceAll]);
    s2:=stringreplace(s2, '�', 'ss', [rfReplaceAll]);
    result:=s2;
  end;
begin
  for i_dev:=0 to length(XTouchDevices)-1 do
  begin
    // Update Segment Display
    XTouchDevices[i_dev].SegmentDisplay[0]:=char(49+i_dev);
    ClockString:=TimeToStr(now);
    XTouchDevices[i_dev].SegmentDisplay[1]:=' ';
    XTouchDevices[i_dev].SegmentDisplay[2]:=' ';
    XTouchDevices[i_dev].SegmentDisplay[3]:=ClockString[1]; //11:22:33
    XTouchDevices[i_dev].SegmentDisplay[4]:=ClockString[2]; //11:22:33
    XTouchDevices[i_dev].SegmentDisplay[5]:=ClockString[4]; //11:22:33
    XTouchDevices[i_dev].SegmentDisplay[6]:=ClockString[5]; //11:22:33
    XTouchDevices[i_dev].SegmentDisplay[7]:=ClockString[7]; //11:22:33
    XTouchDevices[i_dev].SegmentDisplay[8]:=ClockString[8]; //11:22:33

    ValueString:=inttostr(XTouchDevices[i_dev].JogDialValue);
    if length(ValueString)=3 then
      XTouchDevices[i_dev].SegmentDisplay[9]:=ValueString[1]
    else
      XTouchDevices[i_dev].SegmentDisplay[9]:='0';
    if length(ValueString)=3 then
      XTouchDevices[i_dev].SegmentDisplay[10]:=ValueString[2]
    else if length(ValueString)=2 then
      XTouchDevices[i_dev].SegmentDisplay[10]:=ValueString[1]
    else
      XTouchDevices[i_dev].SegmentDisplay[10]:='0';
    if length(ValueString)=3 then
      XTouchDevices[i_dev].SegmentDisplay[11]:=ValueString[3]
    else if length(ValueString)=2 then
      XTouchDevices[i_dev].SegmentDisplay[11]:=ValueString[2]
    else
      XTouchDevices[i_dev].SegmentDisplay[11]:=ValueString[1];

    XTouchChannelOffsetCounter:=-2;
    XTouchChannelCounter:=0;

    if XTouchDevices[i_dev].DisplayGlobalView then
    begin
      // display all channels without devices
      for i_ch:=1 to chan do // 1...8192
      begin
        inc(XTouchChannelOffsetCounter);
        if XTouchChannelOffsetCounter<XTouchDevices[i_dev].ChannelOffset then
          XTouchChannelCounter:=0;

        if XTouchChannelCounter>7 then
          break;

        // search channelname for this channel
        ChannelIsUsed:=false;
        for i:=0 to length(mainform.devices)-1 do
        begin
          if (i_ch>=mainform.devices[i].Startaddress) and (i_ch<mainform.devices[i].Startaddress+mainform.devices[i].MaxChan) then
          begin
            // we've found the corresponding device, not get the Channelname
            NewText:=copy(ReplaceGermanUmlaut(mainform.devices[i].kanalname[i_ch-mainform.devices[i].Startaddress]), 1, 7);
            setlength(NewText, 7);
            ChannelIsUsed:=true;
            break;
          end;
        end;
        if not ChannelIsUsed then
        begin
          if XTouchDevices[i_dev].DisplaySelectedDevices then
            continue; // we want to show only used channels -> go to next channel
          NewText:='-------';
        end;

        Value:=mainform.channel_value[i_ch];
        ValueString:=inttostr(Value);
        NewText2:=inttostr(i_ch)+':     ';
        setlength(NewText2, 7);
        if length(ValueString)=3 then
        begin
          NewText2[5]:=ValueString[1];
          NewText2[6]:=ValueString[2];
          NewText2[7]:=ValueString[3];
        end else if length(ValueString)=2 then
        begin
          NewText2[6]:=ValueString[1];
          NewText2[7]:=ValueString[2];
        end else
        begin
          NewText2[7]:=ValueString[1];
        end;
        NewColor:=7;
        NewValue:=round((Value/maxres)*XTouchMaxRes);

        XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].TopText) OR (NewText2<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
        XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].TopText:=NewText;
        XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText2;
        XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
        XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannel:=i_ch;
        XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
        XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
        XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
        XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
        inc(XTouchChannelCounter);
      end;
    end else
    begin
      // display specific device channels
      // prepare number of devices to display and prepare ID-list
      if XTouchDevices[i_dev].DisplaySelectedDevices then
      begin
        max_devices:=length(mainform.devices);
      end else
      begin
        max_devices:=length(mainform.XTouchDevices);
      end;

      for i_id:=0 to max_devices-1 do
      begin
        if XTouchChannelCounter>7 then
          break;

        if XTouchDevices[i_dev].DisplaySelectedDevices or mainform.XTouchDevices[i_id].IsDevice then
        begin
          // is device or show selected devices
          if XTouchDevices[i_dev].DisplaySelectedDevices then
          begin
            if not mainform.DeviceSelected[i_id] then
              continue;

            DeviceIndex:=i_id;
            CurrentDeviceID:=mainform.devices[DeviceIndex].ID;

            ChannelsToDisplay:=0;
            if mainform.devices[DeviceIndex].hasDimmer then
              inc(ChannelsToDisplay);
            if mainform.devices[DeviceIndex].hasShutter then
              inc(ChannelsToDisplay);
            if mainform.devices[DeviceIndex].hasRGB then
              ChannelsToDisplay:=ChannelsToDisplay+3;
            if mainform.devices[DeviceIndex].hasAmber then
              inc(ChannelsToDisplay);
            if mainform.devices[DeviceIndex].hasWhite then
              inc(ChannelsToDisplay);
            if mainform.devices[DeviceIndex].hasUV then
              inc(ChannelsToDisplay);
            if mainform.devices[DeviceIndex].hasFog then
              inc(ChannelsToDisplay);
            if mainform.devices[DeviceIndex].hasPANTILT then
              ChannelsToDisplay:=ChannelsToDisplay+2;
          end else
          begin
            CurrentDeviceID:=mainform.XTouchDevices[i_id].ID;
            DeviceIndex:=geraetesteuerung.GetDevicePositionInDeviceArray(@CurrentDeviceID);
            ChannelsToDisplay:=mainform.XTouchDevices[i_id].ChannelsToDisplay;
          end;

          // get number of max displayed channels to spread device name over these displays
          if ChannelsToDisplay=1 then
          begin
            // only one display - dont spread
            SpreadText:=false;
            XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].TopText:='       ';
            XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].TopText:=copy(ReplaceGermanUmlaut(mainform.devices[DeviceIndex].Name), 1, 7);
          end else
          begin
            // more than one display - spread text
            SpreadText:=true;
          end;

          for i:=0 to length(ChannelTypeIsDone)-1 do
            ChannelTypeIsDone[i]:=false;
          for i_subch:=0 to ChannelsToDisplay-1 do
          begin
            inc(XTouchChannelOffsetCounter);
            if XTouchChannelOffsetCounter<XTouchDevices[i_dev].ChannelOffset then
              XTouchChannelCounter:=0;

            if XTouchChannelCounter>7 then
              break;

            if SpreadText then
            begin
              DisplayText:=copy(ReplaceGermanUmlaut(mainform.devices[DeviceIndex].Name), 1+(i_subch*7), 7+(i_subch*7));
              // fill display with '-'
              if (i_subch<ChannelsToDisplay-1) then
              begin
                for j:=0 to 7-length(DisplayText) do
                  DisplayText:=DisplayText+'-';
              end else
              begin
                for j:=0 to 5-length(DisplayText) do
                  DisplayText:=DisplayText+'-';
                if (length(DisplayText)<7) then
                  DisplayText:=DisplayText+'|';
              end;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].TopText:=DisplayText;
            end;

            // Reihenfolge: Dimmer, R, G, B, W, A, UV, SHUTTER, PAN, TILT, FOG
            if mainform.devices[DeviceIndex].hasDimmer and not ChannelTypeIsDone[0] then
            begin
              ChannelTypeIsDone[0]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=CurrentDeviceID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='DIMMER';
              Value:=geraetesteuerung.get_channel(CurrentDeviceID, 'DIMMER');
              if length(inttostr(Value))=1 then
                NewText:='DIM   '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='DIM  '+inttostr(Value)
              else
                NewText:='DIM '+inttostr(Value);
              NewColor:=7;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.devices[DeviceIndex].hasRGB and not ChannelTypeIsDone[1] then
            begin
              ChannelTypeIsDone[1]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=CurrentDeviceID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='R';
              Value:=geraetesteuerung.get_channel(CurrentDeviceID, 'R');
              if length(inttostr(Value))=1 then
                NewText:='R     '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='R    '+inttostr(Value)
              else
                NewText:='R   '+inttostr(Value);
              NewColor:=1;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.devices[DeviceIndex].hasRGB and not ChannelTypeIsDone[2] then
            begin
              ChannelTypeIsDone[2]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=CurrentDeviceID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='G';
              Value:=geraetesteuerung.get_channel(CurrentDeviceID, 'G');
              if length(inttostr(Value))=1 then
                NewText:='G     '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='G    '+inttostr(Value)
              else
                NewText:='G   '+inttostr(Value);
              NewColor:=2;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.devices[DeviceIndex].hasRGB and not ChannelTypeIsDone[3] then
            begin
              ChannelTypeIsDone[3]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=CurrentDeviceID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='B';
              Value:=geraetesteuerung.get_channel(CurrentDeviceID, 'B');
              if length(inttostr(Value))=1 then
                NewText:='B     '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='B    '+inttostr(Value)
              else
                NewText:='B   '+inttostr(Value);
              NewColor:=4;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.devices[DeviceIndex].hasWhite and not ChannelTypeIsDone[4] then
            begin
              ChannelTypeIsDone[4]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=CurrentDeviceID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='W';
              Value:=geraetesteuerung.get_channel(CurrentDeviceID, 'W');
              if length(inttostr(Value))=1 then
                NewText:='W     '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='W    '+inttostr(Value)
              else
                NewText:='W   '+inttostr(Value);
              NewColor:=7;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.devices[DeviceIndex].hasAmber and not ChannelTypeIsDone[5] then
            begin
              ChannelTypeIsDone[5]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=CurrentDeviceID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='A';
              Value:=geraetesteuerung.get_channel(CurrentDeviceID, 'A');
              if length(inttostr(Value))=1 then
                NewText:='A     '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='A    '+inttostr(Value)
              else
                NewText:='A   '+inttostr(Value);
              NewColor:=3;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.devices[DeviceIndex].hasUV and not ChannelTypeIsDone[6] then
            begin
              ChannelTypeIsDone[6]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=CurrentDeviceID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='UV';
              Value:=geraetesteuerung.get_channel(CurrentDeviceID, 'UV');
              if length(inttostr(Value))=1 then
                NewText:='UV    '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='UV   '+inttostr(Value)
              else
                NewText:='UV  '+inttostr(Value);
              NewColor:=5;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.devices[DeviceIndex].hasShutter and not ChannelTypeIsDone[7] then
            begin
              ChannelTypeIsDone[7]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=CurrentDeviceID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='SHUTTER';
              Value:=geraetesteuerung.get_channel(CurrentDeviceID, 'SHUTTER');
              if length(inttostr(Value))=1 then
                NewText:='SHUTR '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='SHTR '+inttostr(Value)
              else
                NewText:='SHT '+inttostr(Value);
              NewColor:=7;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.devices[DeviceIndex].hasFog and not ChannelTypeIsDone[8] then
            begin
              ChannelTypeIsDone[8]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=CurrentDeviceID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='FOG';
              Value:=geraetesteuerung.get_channel(CurrentDeviceID, 'FOG');
              if length(inttostr(Value))=1 then
                NewText:='FOG   '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='FOG  '+inttostr(Value)
              else
                NewText:='FOG '+inttostr(Value);
              NewColor:=6;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.devices[DeviceIndex].hasPANTILT and not ChannelTypeIsDone[9] then
            begin
              ChannelTypeIsDone[9]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=CurrentDeviceID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='PAN';
              Value:=geraetesteuerung.get_channel(CurrentDeviceID, 'PAN');
              if length(inttostr(Value))=1 then
                NewText:='PAN   '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='PAN  '+inttostr(Value)
              else
                NewText:='PAN '+inttostr(Value);
              NewColor:=7;
              NewValue:=(Value shl 8)+geraetesteuerung.get_channel(CurrentDeviceID, 'PANFINE');
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.devices[DeviceIndex].hasPANTILT and not ChannelTypeIsDone[10] then
            begin
              ChannelTypeIsDone[10]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=CurrentDeviceID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='TILT';
              Value:=geraetesteuerung.get_channel(CurrentDeviceID, 'TILT');
              if length(inttostr(Value))=1 then
                NewText:='TILT  '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='TILT '+inttostr(Value)
              else
                NewText:='TLT '+inttostr(Value);
              NewColor:=7;
              NewValue:=(Value shl 8)+geraetesteuerung.get_channel(CurrentDeviceID, 'TILTFINE');
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
          end;
        end else
        begin
          // is group
          GroupIndex:=geraetesteuerung.GetGroupPositionInGroupArray(mainform.XTouchDevices[i_id].ID);
          ChannelsToDisplay:=mainform.XTouchDevices[i_id].ChannelsToDisplay;

          // get number of max displayed channels to spread device name over these displays
          if ChannelsToDisplay=1 then
          begin
            // only one display - dont spread
            SpreadText:=false;
            XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].TopText:='       ';
            XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].TopText:=copy(ReplaceGermanUmlaut(mainform.DeviceGroups[GroupIndex].Name), 1, 7);
          end else
          begin
            // more than one display - spread text
            SpreadText:=true;
          end;

          for i:=0 to length(ChannelTypeIsDone)-1 do
            ChannelTypeIsDone[i]:=false;
          for i_subch:=0 to ChannelsToDisplay-1 do
          begin
            inc(XTouchChannelOffsetCounter);
            if XTouchChannelOffsetCounter<XTouchDevices[i_dev].ChannelOffset then
              XTouchChannelCounter:=0;

            if XTouchChannelCounter>7 then
              break;

            if SpreadText then
            begin
              DisplayText:=copy(ReplaceGermanUmlaut(mainform.DeviceGroups[GroupIndex].Name), 1+(i_subch*7), 7+(i_subch*7));
              // fill display with '-'
              if (i_subch<ChannelsToDisplay-1) then
              begin
                for j:=0 to 7-length(DisplayText) do
                  DisplayText:=DisplayText+'-';
              end else
              begin
                for j:=0 to 5-length(DisplayText) do
                  DisplayText:=DisplayText+'-';
                if (length(DisplayText)<7) then
                  DisplayText:=DisplayText+'|';
              end;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].TopText:=DisplayText;
            end;

            // Reihenfolge: Dimmer, R, G, B, W, A, UV, SHUTTER, PAN, TILT, FOG
            if mainform.DeviceGroups[GroupIndex].HasChanType[19] and not ChannelTypeIsDone[0] then
            begin
              ChannelTypeIsDone[0]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=mainform.XTouchDevices[i_id].ID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='DIMMER';
              Value:=geraetesteuerung.get_group(mainform.DeviceGroups[GroupIndex].ID, 'DIMMER');
              if length(inttostr(Value))=1 then
                NewText:='G:DIM '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='G:D  '+inttostr(Value)
              else
                NewText:='G:D '+inttostr(Value);
              NewColor:=7;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.DeviceGroups[GroupIndex].HasChanType[14] and not ChannelTypeIsDone[1] then
            begin
              ChannelTypeIsDone[1]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=mainform.XTouchDevices[i_id].ID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='R';
              Value:=geraetesteuerung.get_group(mainform.DeviceGroups[GroupIndex].ID, 'R');
              if length(inttostr(Value))=1 then
                NewText:='G:R   '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='G:R  '+inttostr(Value)
              else
                NewText:='G:R '+inttostr(Value);
              NewColor:=1;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.DeviceGroups[GroupIndex].HasChanType[15] and not ChannelTypeIsDone[2] then
            begin
              ChannelTypeIsDone[2]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=mainform.XTouchDevices[i_id].ID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='G';
              Value:=geraetesteuerung.get_group(mainform.DeviceGroups[GroupIndex].ID, 'G');
              if length(inttostr(Value))=1 then
                NewText:='G:G   '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='G:G  '+inttostr(Value)
              else
                NewText:='G:G '+inttostr(Value);
              NewColor:=2;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.DeviceGroups[GroupIndex].HasChanType[16] and not ChannelTypeIsDone[3] then
            begin
              ChannelTypeIsDone[3]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=mainform.XTouchDevices[i_id].ID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='B';
              Value:=geraetesteuerung.get_group(mainform.DeviceGroups[GroupIndex].ID, 'B');
              if length(inttostr(Value))=1 then
                NewText:='G:B   '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='G:B  '+inttostr(Value)
              else
                NewText:='G:B '+inttostr(Value);
              NewColor:=4;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.DeviceGroups[GroupIndex].HasChanType[40] and not ChannelTypeIsDone[4] then
            begin
              ChannelTypeIsDone[4]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=mainform.XTouchDevices[i_id].ID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='W';
              Value:=geraetesteuerung.get_group(mainform.DeviceGroups[GroupIndex].ID, 'W');
              if length(inttostr(Value))=1 then
                NewText:='G:W   '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='G:W  '+inttostr(Value)
              else
                NewText:='G:W '+inttostr(Value);
              NewColor:=7;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.DeviceGroups[GroupIndex].HasChanType[41] and not ChannelTypeIsDone[5] then
            begin
              ChannelTypeIsDone[5]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=mainform.XTouchDevices[i_id].ID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='A';
              Value:=geraetesteuerung.get_group(mainform.DeviceGroups[GroupIndex].ID, 'A');
              if length(inttostr(Value))=1 then
                NewText:='G:A   '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='G:A  '+inttostr(Value)
              else
                NewText:='G:A '+inttostr(Value);
              NewColor:=3;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.DeviceGroups[GroupIndex].HasChanType[45] and not ChannelTypeIsDone[6] then
            begin
              ChannelTypeIsDone[6]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=mainform.XTouchDevices[i_id].ID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='UV';
              Value:=geraetesteuerung.get_group(mainform.DeviceGroups[GroupIndex].ID, 'UV');
              if length(inttostr(Value))=1 then
                NewText:='G:UV  '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='G:UV '+inttostr(Value)
              else
                NewText:='G:UV'+inttostr(Value);
              NewColor:=5;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.DeviceGroups[GroupIndex].HasChanType[18] and not ChannelTypeIsDone[7] then
            begin
              ChannelTypeIsDone[7]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=mainform.XTouchDevices[i_id].ID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='SHUTTER';
              Value:=geraetesteuerung.get_group(mainform.DeviceGroups[GroupIndex].ID, 'SHUTTER');
              if length(inttostr(Value))=1 then
                NewText:='G:SHT '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='G:SH '+inttostr(Value)
              else
                NewText:='G:S '+inttostr(Value);
              NewColor:=7;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.DeviceGroups[GroupIndex].HasChanType[46] and not ChannelTypeIsDone[8] then
            begin
              ChannelTypeIsDone[8]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=mainform.XTouchDevices[i_id].ID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='FOG';
              Value:=geraetesteuerung.get_group(mainform.DeviceGroups[GroupIndex].ID, 'FOG');
              if length(inttostr(Value))=1 then
                NewText:='G:FOG '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='G:FG '+inttostr(Value)
              else
                NewText:='G:F '+inttostr(Value);
              NewColor:=6;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.DeviceGroups[GroupIndex].HasChanType[0] and not ChannelTypeIsDone[9] then
            begin
              ChannelTypeIsDone[9]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=mainform.XTouchDevices[i_id].ID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='PAN';
              Value:=geraetesteuerung.get_group(mainform.DeviceGroups[GroupIndex].ID, 'PAN');
              if length(inttostr(Value))=1 then
                NewText:='G:PAN '+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='G:PN '+inttostr(Value)
              else
                NewText:='G:P '+inttostr(Value);
              NewColor:=7;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
            if mainform.DeviceGroups[GroupIndex].HasChanType[1] and not ChannelTypeIsDone[10] then
            begin
              ChannelTypeIsDone[10]:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingID:=mainform.XTouchDevices[i_id].ID;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].CorrespondingChannelName:='TILT';
              Value:=geraetesteuerung.get_group(mainform.DeviceGroups[GroupIndex].ID, 'TILT');
              if length(inttostr(Value))=1 then
                NewText:='G:TILT'+inttostr(Value)
              else if length(inttostr(Value))=2 then
                NewText:='G:TL '+inttostr(Value)
              else
                NewText:='G:T '+inttostr(Value);
              NewColor:=7;
              NewValue:=round((Value/maxres)*XTouchMaxRes);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color);
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].BotText:=NewText;
              XTouchDevices[i_dev].ScribblePad[XTouchChannelCounter].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].FaderEnabled:=true;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition);
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition:=NewValue;
              XTouchDevices[i_dev].Channel[XTouchChannelCounter].Meterlevel:=round((XTouchDevices[i_dev].Channel[XTouchChannelCounter].Faderposition/XTouchMaxRes)*8);
              inc(XTouchChannelCounter);
              continue;
            end;
          end;
        end;
      end;
    end;

    // blackout all unused channels
    if (XTouchChannelCounter=0) and (not XTouchDevices[i_dev].DisplaySelectedDevices) then
    begin
      // no channel is used. So display Welcome-Message
      XTouchDevices[i_dev].ScribblePad[0].BotText:='Welcome';
      XTouchDevices[i_dev].ScribblePad[1].BotText:='  to   ';
      XTouchDevices[i_dev].ScribblePad[2].BotText:='XTouch-';
      XTouchDevices[i_dev].ScribblePad[3].BotText:='Control';
      XTouchDevices[i_dev].ScribblePad[4].BotText:='  for  ';
      XTouchDevices[i_dev].ScribblePad[5].BotText:='  PC   ';
      XTouchDevices[i_dev].ScribblePad[6].BotText:='DIMMER ';
      XTouchDevices[i_dev].ScribblePad[7].BotText:='  :)   ';
      for i_ch:=0 to 7 do
      begin
        XTouchDevices[i_dev].ScribblePad[i_ch].TopText:='Ch '+inttostr(i_ch+1);
        XTouchDevices[i_dev].ScribblePad[i_ch].Color:=7;
        XTouchDevices[i_dev].ScribblePad[i_ch].ScribbleNeedsUpdate:=true;
        XTouchDevices[i_dev].Channel[i_ch].FaderEnabled:=false;
        XTouchDevices[i_dev].Channel[i_ch].ChannelNeedsUpdate:=(0<>XTouchDevices[i_dev].Channel[i_ch].Faderposition);
        XTouchDevices[i_dev].Channel[i_ch].Faderposition:=0;
        XTouchDevices[i_dev].Channel[i_ch].Meterlevel:=0;
      end;
    end else
    begin
      for i:=XTouchChannelCounter to 7 do
      begin
        NewText:='       ';
        NewColor:=0;
        NewValue:=0;
        XTouchDevices[i_dev].ScribblePad[i].ScribbleNeedsUpdate:=(NewText<>XTouchDevices[i_dev].ScribblePad[i].BotText) OR (NewColor<>XTouchDevices[i_dev].ScribblePad[i].Color);
        XTouchDevices[i_dev].ScribblePad[i].TopText:=NewText;
        XTouchDevices[i_dev].ScribblePad[i].BotText:=NewText;
        XTouchDevices[i_dev].ScribblePad[i].Color:=NewColor; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
        XTouchDevices[i_dev].Channel[i].FaderEnabled:=false;
        XTouchDevices[i_dev].Channel[i].ChannelNeedsUpdate:=(NewValue<>XTouchDevices[i_dev].Channel[i].Faderposition);
        XTouchDevices[i_dev].Channel[i].Faderposition:=NewValue;
        XTouchDevices[i_dev].Channel[i].Meterlevel:=round((XTouchDevices[i_dev].Channel[i].Faderposition/XTouchMaxRes)*8);
      end;
    end;
  end;
end;

procedure Txtouchcontrolform.SendDataToXTouchDevices;
var
  XCtl_TxMessage:TIdBytes;
  i, i_dev, i_ch:integer;
  DialLevelRaw:Word;
begin
  try
    // put content to XTouchDevices
    for i_dev:=0 to length(XTouchDevices)-1 do
    begin
      // Update ScribbleScripts
      setlength(XCtl_TxMessage, 22);
      for i_ch:=0 to 7 do
      begin
        //if XTouchDevices[i_dev].ScribblePad[i_ch].ScribbleNeedsUpdate then
        begin
          //XTouchDevices[i_dev].ScribblePad[i_ch].ScribbleNeedsUpdate:=false;

          XCtl_TxMessage[0]:=$F0;
          XCtl_TxMessage[1]:=$00;
          XCtl_TxMessage[2]:=$00;
          XCtl_TxMessage[3]:=$66;
          XCtl_TxMessage[4]:=$58;
          XCtl_TxMessage[5]:=$20+i_ch;

          // prepare color
          if XTouchDevices[i_dev].ScribblePad[i_ch].Inverted then
            XCtl_TxMessage[6]:=$40+XTouchDevices[i_dev].ScribblePad[i_ch].Color
          else
            XCtl_TxMessage[6]:=XTouchDevices[i_dev].ScribblePad[i_ch].Color;

          // prepare text
          for i:=0 to 6 do
          begin
            XCtl_TxMessage[7+i]:=byte(XTouchDevices[i_dev].ScribblePad[i_ch].TopText[i+1]);
            XCtl_TxMessage[14+i]:=byte(XTouchDevices[i_dev].ScribblePad[i_ch].BotText[i+1]);
          end;
          XCtl_TxMessage[21]:=$F7;
          xtouchserver.SendBuffer(XTouchDevices[i_dev].IPAddress, 10111, XCtl_TxMessage);
        end;
      end;

      // Update all buttons
      // Sets the state of a button light (OFF, FLASHING, ON)
      // 0 to 7 - Rec buttons
      // 8 to 15 - Solo buttons
      // 16 to 23 - Mute buttons
      // 24 to 31 - Select buttons
      // 40 to 45 - encoder assign buttons (track, send, pan,  plugin, eq, inst)
      // 46 to 47 - Fader bank left / right
      // 48 to 49 - Channel left / right
      // 50 Flip
      // 51 Global view
      // 52 Display NAME/VALUE
      // 53 Button SMPTE/BEATS
      // 54 to 61 - Function buttons F1 to F8
      // 62 to 69 - Buttons under 7-seg displays
      // 70 to 73 - Modify buttons (shift, option, control, alt)
      // 74 to 79 - Automation buttons (read, write, trim, touch, latch, group)
      // 80 to 83 - Utility buttons (save, undo, cacel, enter)
      // 84 to 90 - Transport buttons (marker, nudge, cycle, drop, replace, click, solo)
      // 91 to 95 - Playback control (rewind, fast-forward, stop, play, record)
      // 96 to 100 - Cursor keys (up, down, left, right, middle)
      // 101 Scrub
      // 113 Smpte
      // 114 Beats
      // 115 Solo - on 7-seg display
      setlength(XCtl_TxMessage, 69);
      XCtl_TxMessage[0]:=$90;

      for i_ch:=0 to 7 do
      begin
        XCtl_TxMessage[1+i_ch*2]:=i_ch; // rec buttons 0...7
        XCtl_TxMessage[2+i_ch*2]:=XTouchDevices[i_dev].Channel[i_ch].Rec;

        XCtl_TxMessage[8*2+1+i_ch*2]:=8+i_ch; // solo buttons 8...15
        XCtl_TxMessage[8*2+2+i_ch*2]:=XTouchDevices[i_dev].Channel[i_ch].Solo;

        XCtl_TxMessage[16*2+1+i_ch*2]:=16+i_ch; // mute buttons 16..23
        XCtl_TxMessage[16*2+2+i_ch*2]:=XTouchDevices[i_dev].Channel[i_ch].Mute;

        XCtl_TxMessage[24*2+1+i_ch*2]:=24+i_ch; // select buttons 24..31
        XCtl_TxMessage[24*2+2+i_ch*2]:=XTouchDevices[i_dev].Channel[i_ch].Select;
      end;
      if XTouchDevices[i_dev].DisplaySelectedDevices then
      begin
        XCtl_TxMessage[length(XCtl_TxMessage)-4]:=115;
        XCtl_TxMessage[length(XCtl_TxMessage)-3]:=2;
      end else
      begin
        XCtl_TxMessage[length(XCtl_TxMessage)-4]:=115;
        XCtl_TxMessage[length(XCtl_TxMessage)-3]:=0;
      end;
      if XTouchDevices[i_dev].DisplayGlobalView then
      begin
        XCtl_TxMessage[length(XCtl_TxMessage)-2]:=51;
        XCtl_TxMessage[length(XCtl_TxMessage)-1]:=2;
      end else
      begin
        XCtl_TxMessage[length(XCtl_TxMessage)-2]:=51;
        XCtl_TxMessage[length(XCtl_TxMessage)-1]:=0;
      end;

      for i:=0 to length(XTouchDevices[i_dev].ButtonLightOn)-1 do
      begin
        if XTouchDevices[i_dev].ButtonLightOn[i]=255 then
        begin
          // Turn Button on
          XTouchDevices[i_dev].ButtonLightOn[i]:=0;
          setlength(XCtl_TxMessage, length(XCtl_TxMessage)+2);
          XCtl_TxMessage[length(XCtl_TxMessage)-2]:=i;
          XCtl_TxMessage[length(XCtl_TxMessage)-1]:=2;
        end else if XTouchDevices[i_dev].ButtonLightOn[i]=254 then
        begin
          // Turn Button on with automatic turnoff
          XTouchDevices[i_dev].ButtonLightOn[i]:=400 div UpdateTimer.interval;
          setlength(XCtl_TxMessage, length(XCtl_TxMessage)+2);
          XCtl_TxMessage[length(XCtl_TxMessage)-2]:=i;
          XCtl_TxMessage[length(XCtl_TxMessage)-1]:=2;
        end else if XTouchDevices[i_dev].ButtonLightOn[i]=1 then
        begin
          // Turn Button off
          XTouchDevices[i_dev].ButtonLightOn[i]:=0;
          setlength(XCtl_TxMessage, length(XCtl_TxMessage)+2);
          XCtl_TxMessage[length(XCtl_TxMessage)-2]:=i;
          XCtl_TxMessage[length(XCtl_TxMessage)-1]:=0;
        end;
      end;

      xtouchserver.SendBuffer(XTouchDevices[i_dev].IPAddress, 10111, XCtl_TxMessage);

      // Update DialLevels around PanKnob
      setlength(XCtl_TxMessage, 34);
      XCtl_TxMessage[0]:=$B0;
      for i_ch:=0 to 7 do
      begin
        DialLevelRaw:=0;
        for i:=0 to round(XTouchDevices[i_dev].Channel[i_ch].DialLevel/21.25) do
          DialLevelRaw:=DialLevelRaw+(1 shl i);

        XCtl_TxMessage[1+i_ch*4]:=$30+i_ch;
        XCtl_TxMessage[2+i_ch*4]:=DialLevelRaw AND $7F;
        XCtl_TxMessage[3+i_ch*4]:=$38+i_ch;
        XCtl_TxMessage[4+i_ch*4]:=(DialLevelRaw shr 7) AND $7F;
      end;
      xtouchserver.SendBuffer(XTouchDevices[i_dev].IPAddress, 10111, XCtl_TxMessage);

      // Set 7-Segment-Displays
      setlength(XCtl_TxMessage, 25);
      XCtl_TxMessage[0]:=$B0;
      for i:=0 to 11 do
      begin
        XCtl_TxMessage[1+i*2]:=i+$60;

        // 0x30 to 0x37 - Left hand sides of knobs
        // 0x38 to 0x3F - Right hand sides of knobs
        // 0x60 - Left hand assignment digit
        // 0x61 - Right hand assignment digit
        // 0x62-0x64 - Bars digits
        // 0x65-0x66 - Beats digits
        // 0x67-0x68 - Sub division digits
        // 0x69-0x6B - Ticks digits
        // 0x70-0x7B - same as above but with . also lit
        // Value: 7-bit bitmap of segments to illuminate
        XCtl_TxMessage[2+i*2]:=GetSegmentBitmap(XTouchDevices[i_dev].SegmentDisplay[i]);
      end;
      xtouchserver.SendBuffer(XTouchDevices[i_dev].IPAddress, 10111, XCtl_TxMessage);
    end;
  except
  end;
end;

procedure Txtouchcontrolform.SendDataToXTouchDevices_Faders;
var
  XCtl_TxMessage:TIdBytes;
  i_dev, i_ch:integer;
begin
  try
    for i_dev:=0 to length(XTouchDevices)-1 do
    begin
      for i_ch:=0 to 7 do
      begin
        if XTouchDevices[i_dev].Channel[i_ch].ChannelNeedsUpdate then
        begin
          XTouchDevices[i_dev].Channel[i_ch].ChannelNeedsUpdate:=false;
          // update faders
          setlength(XCtl_TxMessage, 3);
          XCtl_TxMessage[0]:=$E0+i_ch; // E0...E7 Fader 1-8, E8=Masterfader
          XCtl_TxMessage[1]:=XTouchDevices[i_dev].Channel[i_ch].Faderposition AND $7F; // MIDI-Values between 0 and 127
          XCtl_TxMessage[2]:=(XTouchDevices[i_dev].Channel[i_ch].Faderposition shr 7) AND $7F;
          xtouchserver.SendBuffer(XTouchDevices[i_dev].IPAddress, 10111, XCtl_TxMessage);
        end;
      end;

      // Update Meterlevels
      setlength(XCtl_TxMessage, 9);
      XCtl_TxMessage[0]:=$D0;
      for i_ch:=0 to 7 do
        XCtl_TxMessage[1+i_ch]:=(i_ch shl 4)+XTouchDevices[i_dev].Channel[i_ch].Meterlevel;
      xtouchserver.SendBuffer(XTouchDevices[i_dev].IPAddress, 10111, XCtl_TxMessage);

      if XTouchDevices[i_dev].FaderNeedsUpdate then
      begin
        XTouchDevices[i_dev].FaderNeedsUpdate:=false;

        // update Masterfader
        setlength(XCtl_TxMessage, 3);
        XCtl_TxMessage[0]:=$E8; // E8=Masterfader
        XCtl_TxMessage[1]:=XTouchDevices[i_dev].Masterfader AND $7F; // MIDI-Values between 0 and 127
        XCtl_TxMessage[2]:=(XTouchDevices[i_dev].Masterfader shr 7) AND $7F;
        xtouchserver.SendBuffer(XTouchDevices[i_dev].IPAddress, 10111, XCtl_TxMessage);
      end;
    end;
  except
  end;
end;

procedure Txtouchcontrolform.activebtnClick(Sender: TObject);
var
  LReg:TRegistry;
begin
  if xtouchserver.Active then
  begin
    xtouchserver.Active:=false;
    activebtn.Caption:=_('Einschalten');
  end else
  begin
    xtouchserver.Active:=true;
    activebtn.Caption:=_('Ausschalten');
  end;

  LReg := TRegistry.Create;
  LReg.RootKey:=HKEY_CURRENT_USER;
  if LReg.OpenKey('Software', True) then
  begin
    if not LReg.KeyExists('PHOENIXstudios') then
      LReg.CreateKey('PHOENIXstudios');
    if LReg.OpenKey('PHOENIXstudios',true) then
    begin
      if not LReg.KeyExists('PC_DIMMER') then
        LReg.CreateKey('PC_DIMMER');
      if LReg.OpenKey('PC_DIMMER',true) then
      begin
        LReg.WriteBool('XTouchControl active', xtouchserver.Active);
      end;
    end;
  end;
  LReg.CloseKey;
  LReg.Free;
end;

procedure Txtouchcontrolform.xtouchserverUDPRead(
  AThread: TIdUDPListenerThread; const AData: TIdBytes;
  ABinding: TIdSocketHandle);
var
//  s:string;
//  i:integer;
  i_dev, i_ch:integer;
  CurrentDevice:integer;
  Button:integer;
  ButtonState:boolean;
  Channel, Value, TotalChannelsToDisplay_local:integer;
begin
  // message start: F0
  // message terminator: F7

  // every 2 seconds XTouch sends 00�20 32 58�54�00
  // server has to send 00 00 66 14 00

  // find corresponding device
  try
    CurrentDevice:=-1;
    if length(XTouchDevices)>0 then
    begin
      for i_dev:=0 to length(XTouchDevices)-1 do
      begin
        if ABinding.PeerIP=XTouchDevices[i_dev].IPAddress then
        begin
          CurrentDevice:=i_dev;
          break;
        end;
      end;
    end;

    if CurrentDevice<0 then
    begin
      // device is new, so create it
      setlength(XTouchDevices, length(XTouchDevices)+1);
      listbox2.Items.Add('XTouch #' + inttostr(length(XTouchDevices)) + ' @ ' + ABinding.PeerIP);
      CurrentDevice:=length(XTouchDevices)-1;
      XTouchDevices[CurrentDevice].IPAddress:=ABinding.PeerIP;

      XTouchDevices[CurrentDevice].ScribblePad[0].BotText:='Welcome';
      XTouchDevices[CurrentDevice].ScribblePad[1].BotText:='  to   ';
      XTouchDevices[CurrentDevice].ScribblePad[2].BotText:='XTouch-';
      XTouchDevices[CurrentDevice].ScribblePad[3].BotText:='Control';
      XTouchDevices[CurrentDevice].ScribblePad[4].BotText:='  for  ';
      XTouchDevices[CurrentDevice].ScribblePad[5].BotText:='  PC   ';
      XTouchDevices[CurrentDevice].ScribblePad[6].BotText:='DIMMER ';
      XTouchDevices[CurrentDevice].ScribblePad[7].BotText:='  :)   ';
      XTouchDevices[CurrentDevice].FaderNeedsUpdate:=true;
      XTouchDevices[CurrentDevice].Masterfader:=0;
      for i_ch:=0 to 7 do
      begin
        // Set to Standard Data
        XTouchDevices[CurrentDevice].ScribblePad[i_ch].Color:=7; // 0=BLACK, 1=RED, 2=GREEN, 3=YELLOW, 4=BLUE, 5=PINK, 6=CYAN, 7=WHITE
        XTouchDevices[CurrentDevice].ScribblePad[i_ch].TopText:='Ch '+inttostr(i_ch+1);
        XTouchDevices[CurrentDevice].ScribblePad[i_ch].ScribbleNeedsUpdate:=true;
        XTouchDevices[CurrentDevice].Channel[i_ch].ChannelNeedsUpdate:=true;
        XTouchDevices[CurrentDevice].Channel[i_ch].Faderposition:=0;
        XTouchDevices[CurrentDevice].Channel[i_ch].Meterlevel:=0;
        XTouchDevices[CurrentDevice].Channel[i_ch].DialLevel:=0;
        XTouchDevices[CurrentDevice].Channel[i_ch].Rec:=0;
        XTouchDevices[CurrentDevice].Channel[i_ch].Solo:=0;
        XTouchDevices[CurrentDevice].Channel[i_ch].Mute:=0;
        XTouchDevices[CurrentDevice].Channel[i_ch].Select:=0;
      end;
    end;

    if (CurrentDevice>=0) and (CurrentDevice<length(XTouchDevices)) then
    begin
      if (AData[0]=$F0) and (AData[length(AData)-1]=$F7) then
      begin
        // Message has expected start- and end-byte

        // check the received data
        if (length(AData)=length(XCtl_Probe)) and (CompareMem(AData, XCtl_Probe, length(XCtl_Probe))) then
        begin
          // we received a Probe-Message
          xtouchserver.SendBuffer(XTouchDevices[CurrentDevice].IPAddress, 10111, XCtl_ProbeResponse);

          // enable timer if not happened already
          WatchDogTimer.Enabled:=true;
          UpdateTimer.Enabled:=true;
          UpdateFaderTimer.Enabled:=true;
        end else if (length(AData)=length(XCtl_ProbeB)) and (CompareMem(AData, XCtl_ProbeB, length(XCtl_ProbeB))) then
        begin
          // Ignore ProbeB MSG
        end else if (length(AData)=length(XCtl_ProbeC)) and (CompareMem(AData, XCtl_ProbeC, length(XCtl_ProbeC))) then
        begin
          // Ignore ProbeC MSG
        end else
        begin
          // we received a unknown message between F0 and F7
          //s:='';
          //for i:=0 to length(AData)-1 do
          //begin
          //  s:=s+inttohex(Adata[i], 2);
          //end;
          //listbox1.items.Add('Rx unknown message '+s);
        end;
      end else
      begin
        // we received values to parse

        // check for correct length
        if (length(AData)=3) then
        begin
          // check for touched fader
          if ((AData[0]=$90) and (AData[1]>=$68) and (AData[1]<=$70)) then
          begin
            //Fader := (AData[1]-$68)
            //Touched := (AData[2]<>0);
          end;

          // read faderlevel
          if (((AData[0] AND $F0)=$E0)) then
          begin
            // Fader := (AData[0] AND $0F)
            // Level := AData[1]+(AData[2] shl 7)
            if (((AData[0] AND $0F))<=7) then
            begin
              if XTouchDevices[CurrentDevice].Channel[(AData[0] AND $0F)].FaderEnabled then
              begin
                Value:=round(((AData[1]+(AData[2] shl 7))/XTouchMaxRes)*maxres);
                if Value>maxres then
                  Value:=maxres
                else if Value<0 then
                  Value:=0;
                if XTouchDevices[CurrentDevice].DisplayGlobalView then
                  mainform.Senddata(XTouchDevices[CurrentDevice].Channel[(AData[0] AND $0F)].CorrespondingChannel, -1, maxres-Value, 0, 0)
                else
                  geraetesteuerung.set_channel(XTouchDevices[CurrentDevice].Channel[(AData[0] AND $0F)].CorrespondingID, XTouchDevices[CurrentDevice].Channel[(AData[0] AND $0F)].CorrespondingChannelName, -1, Value, 0, -1);
              end;
            end;

            // if desired, send faderlevel to DataInEvent
            if UseDataIn then
            begin
              Channel:=DataInOffset+(101*CurrentDevice)+(AData[0] AND $0F)+1;
              Value:=round(((AData[1]+(AData[2] shl 7))/XTouchMaxRes)*maxres);
              if Value>maxres then
                Value:=maxres
              else if Value<0 then
                Value:=0;
              mainform.ExecuteDataInEvent(Channel, Value);
            end;
          end;

          // read rotation
          if ((AData[0]=$B0)) then
          begin
            // Dial := AData[1]-16    44=Gro�es Dial
            // Value: -6...-1 links <-> 1...6 rechts
            if (AData[2] AND $40)=$40 then
              Value:=(0-(AData[2] AND $0F))
            else
              Value:=(AData[2] AND $0F);

            if (AData[1]>=16) and (AData[1]<=23) then
            begin
              // ChannelDials
              if (Value>0) then
              begin
                // Turn Right
                if (XTouchDevices[CurrentDevice].Channel[AData[1]-16].DialLevel+Value)>maxres then
                  XTouchDevices[CurrentDevice].Channel[AData[1]-16].DialLevel:=maxres
                else
                  XTouchDevices[CurrentDevice].Channel[AData[1]-16].DialLevel:=XTouchDevices[CurrentDevice].Channel[AData[1]-16].DialLevel+Value;
              end else
              begin
                // Turn Left
                if (XTouchDevices[CurrentDevice].Channel[AData[1]-16].DialLevel+Value)<0 then
                  XTouchDevices[CurrentDevice].Channel[AData[1]-16].DialLevel:=0
                else
                  XTouchDevices[CurrentDevice].Channel[AData[1]-16].DialLevel:=XTouchDevices[CurrentDevice].Channel[AData[1]-16].DialLevel+Value;
              end;

              // if desired, send all buttons to DataInEvent
              if UseDataIn then
              begin
                Channel:=DataInOffset+(101*CurrentDevice)+AData[1]+1;
                Value:=XTouchDevices[CurrentDevice].Channel[AData[1]-16].DialLevel;
                if Value>maxres then
                  Value:=maxres
                else if Value<0 then
                  Value:=0;
                mainform.ExecuteDataInEvent(Channel, Value);
              end;
            end else if (AData[1]=60) then
            begin
              // gro�es JogDial
              if (Value>0) then
              begin
                // Turn Right
                if (XTouchDevices[CurrentDevice].JogDialValue+Value)>maxres then
                  XTouchDevices[CurrentDevice].JogDialValue:=maxres
                else
                  XTouchDevices[CurrentDevice].JogDialValue:=XTouchDevices[CurrentDevice].JogDialValue+Value;
              end else
              begin
                // Turn Left
                if (XTouchDevices[CurrentDevice].JogDialValue+Value)<0 then
                  XTouchDevices[CurrentDevice].JogDialValue:=0
                else
                  XTouchDevices[CurrentDevice].JogDialValue:=XTouchDevices[CurrentDevice].JogDialValue+Value;
              end;

              // if desired, send all buttons to DataInEvent
              if UseDataIn then
              begin
                Channel:=DataInOffset+(101*CurrentDevice)+AData[1]+1;
                mainform.ExecuteDataInEvent(Channel, XTouchDevices[CurrentDevice].JogDialValue);
              end;
            end;
          end;

          // read button
          if (AData[0]=$90) then
          begin
            Button:=AData[1];
            ButtonState:=AData[2]<>0;

            // if desired, send all buttons to DataInEvent
            if UseDataIn then
            begin
              Channel:=DataInOffset+(101*CurrentDevice)+AData[1]+1;
              Value:=round(AData[2]*2);
              if Value>maxres then
                Value:=maxres
              else if Value<0 then
                Value:=0;
              mainform.ExecuteDataInEvent(Channel, Value);
            end;

            // 0 to 7 - Rec buttons
            // 8 to 15 - Solo buttons
            // 16 to 23 - Mute buttons
            // 24 to 31 - Select buttons
            // 40 to 45 - encoder assign buttons (track, send, pan,  plugin, eq, inst)
            // 46 to 47 - Fader bank left / right
            // 48 to 49 - Channel left / right
            // 50 Flip
            // 51 Global view
            // 52 Display Name/Value
            // 53 Button SMTPE/BEATS 
            // 54 to 61 - Function buttons F1 to F8
            // 62 to 69 - Buttons under 7-seg displays
            // 70 to 73 - Modify buttons (shift, option, control, alt)
            // 74 to 79 - Automation buttons (read, write, trim, touch, latch, group)
            // 80 to 83 - Utility buttons (save, undo, cacel, enter)
            // 84 to 90 - Transport buttons (marker, nudge, cycle, drop, replace, click, solo)
            // 91 to 95 - Playback control (rewind, fast-forward, stop, play, record)
            // 96 to 100 - Cursor keys (up, down, left, right, middle)
            // 101 Scrub
            // 113 Smpte
            // 114 Beats
            // 115 Solo - on 7-seg display

            //if (ButtonState and (Button>=32) and (Button<102)) then
            //  XTouchDevices[CurrentDevice].ButtonLightOn[Button]:=254; // 255=TurnOn, 254=enable with auto-TurnOff, 1=TurnOff
            if ((Button>=32) and (Button<102)) and not (Button=51) then // Button 51=DisplayGlobalView
            begin
              if ButtonState then
                XTouchDevices[CurrentDevice].ButtonLightOn[Button]:=255
              else
                XTouchDevices[CurrentDevice].ButtonLightOn[Button]:=1;
            end;

            if (Button>=0) and (Button<=7) then // Rec-Buttons
            begin
              if XTouchDevices[CurrentDevice].Channel[Button].FaderEnabled then
              begin
                if ButtonState then
                begin
                  XTouchDevices[CurrentDevice].Channel[Button].Rec:=2;
                  XTouchDevices[CurrentDevice].Channel[Button].LastFaderposition:=XTouchDevices[CurrentDevice].Channel[Button].Faderposition;
                  Value:=maxres;
                  geraetesteuerung.set_channel(XTouchDevices[CurrentDevice].Channel[Button].CorrespondingID, XTouchDevices[CurrentDevice].Channel[Button].CorrespondingChannelName, -1, Value, 0, -1);
                end else
                begin
                  XTouchDevices[CurrentDevice].Channel[Button].Rec:=0;
                  Value:=round((XTouchDevices[CurrentDevice].Channel[Button].LastFaderposition/XTouchMaxRes)*maxres);
                  geraetesteuerung.set_channel(XTouchDevices[CurrentDevice].Channel[Button].CorrespondingID, XTouchDevices[CurrentDevice].Channel[Button].CorrespondingChannelName, -1, Value, 0, -1);
                end;
              end;
            end;

            if (Button>=8) and (Button<=15) then // Solo-Buttons
            begin
              if XTouchDevices[CurrentDevice].Channel[Button-8].FaderEnabled then
              begin
                if ButtonState then
                begin
                  XTouchDevices[CurrentDevice].Channel[Button-8].Solo:=2;
                  XTouchDevices[CurrentDevice].Channel[Button-8].LastFaderposition:=XTouchDevices[CurrentDevice].Channel[Button-8].Faderposition;
                  Value:=169;
                  geraetesteuerung.set_channel(XTouchDevices[CurrentDevice].Channel[Button-8].CorrespondingID, XTouchDevices[CurrentDevice].Channel[Button-8].CorrespondingChannelName, -1, Value, 0, -1);
                end else
                begin
                  XTouchDevices[CurrentDevice].Channel[Button-8].Solo:=0;
                  Value:=round((XTouchDevices[CurrentDevice].Channel[Button-8].LastFaderposition/XTouchMaxRes)*maxres);
                  geraetesteuerung.set_channel(XTouchDevices[CurrentDevice].Channel[Button-8].CorrespondingID, XTouchDevices[CurrentDevice].Channel[Button-8].CorrespondingChannelName, -1, Value, 0, -1);
                end;
              end;
            end;

            if (Button>=16) and (Button<=23) then // Mute-Buttons
            begin
              if XTouchDevices[CurrentDevice].Channel[Button-16].FaderEnabled then
              begin
                if ButtonState then
                begin
                  XTouchDevices[CurrentDevice].Channel[Button-16].Mute:=2;
                  XTouchDevices[CurrentDevice].Channel[Button-16].LastFaderposition:=XTouchDevices[CurrentDevice].Channel[Button-16].Faderposition;
                  Value:=85;
                  geraetesteuerung.set_channel(XTouchDevices[CurrentDevice].Channel[Button-16].CorrespondingID, XTouchDevices[CurrentDevice].Channel[Button-16].CorrespondingChannelName, -1, Value, 0, -1);
                end else
                begin
                  XTouchDevices[CurrentDevice].Channel[Button-16].Mute:=0;
                  Value:=round((XTouchDevices[CurrentDevice].Channel[Button-16].LastFaderposition/XTouchMaxRes)*maxres);
                  geraetesteuerung.set_channel(XTouchDevices[CurrentDevice].Channel[Button-16].CorrespondingID, XTouchDevices[CurrentDevice].Channel[Button-16].CorrespondingChannelName, -1, Value, 0, -1);
                end;
              end;
            end;

            if (Button>=24) and (Button<=31) then // Select-Buttons
            begin
              if XTouchDevices[CurrentDevice].Channel[Button-24].FaderEnabled then
              begin
                if ButtonState then
                begin
                  XTouchDevices[CurrentDevice].Channel[Button-24].Select:=2;
                  XTouchDevices[CurrentDevice].Channel[Button-24].LastFaderposition:=XTouchDevices[CurrentDevice].Channel[Button-24].Faderposition;
                  Value:=0;
                  geraetesteuerung.set_channel(XTouchDevices[CurrentDevice].Channel[Button-24].CorrespondingID, XTouchDevices[CurrentDevice].Channel[Button-24].CorrespondingChannelName, -1, Value, 0, -1);
                end else
                begin
                  XTouchDevices[CurrentDevice].Channel[Button-24].Select:=0;
                  Value:=round((XTouchDevices[CurrentDevice].Channel[Button-24].LastFaderposition/XTouchMaxRes)*maxres);
                  geraetesteuerung.set_channel(XTouchDevices[CurrentDevice].Channel[Button-24].CorrespondingID, XTouchDevices[CurrentDevice].Channel[Button-24].CorrespondingChannelName, -1, Value, 0, -1);
                end;
              end;
            end;

            if (Button=46) and ButtonState then
            begin
              if XTouchDevices[CurrentDevice].ChannelOffset>=8 then
                XTouchDevices[CurrentDevice].ChannelOffset:=XTouchDevices[CurrentDevice].ChannelOffset-8
              else
                XTouchDevices[CurrentDevice].ChannelOffset:=0;
            end;

            if XTouchDevices[CurrentDevice].DisplayGlobalView then
            begin
              TotalChannelsToDisplay_local:=chan; //8192
            end else
            begin
              if XTouchDevices[CurrentDevice].DisplaySelectedDevices then
                TotalChannelsToDisplay_local:=64
              else
                TotalChannelsToDisplay_local:=TotalChannelsToDisplay;
            end;

            if (Button=47) and ButtonState then
            begin
              if XTouchDevices[CurrentDevice].ChannelOffset<=(TotalChannelsToDisplay_local-9) then
              begin
                XTouchDevices[CurrentDevice].ChannelOffset:=XTouchDevices[CurrentDevice].ChannelOffset+8;
              end else
              begin
                XTouchDevices[CurrentDevice].ChannelOffset:=(TotalChannelsToDisplay_local-1);
              end;
            end;
            if (Button=48) and ButtonState then
            begin
              if XTouchDevices[CurrentDevice].ChannelOffset>0 then
                XTouchDevices[CurrentDevice].ChannelOffset:=XTouchDevices[CurrentDevice].ChannelOffset-1;
            end;
            if (Button=49) and ButtonState then
            begin
              if XTouchDevices[CurrentDevice].ChannelOffset<(TotalChannelsToDisplay_local-1) then
              begin
                XTouchDevices[CurrentDevice].ChannelOffset:=XTouchDevices[CurrentDevice].ChannelOffset+1;
              end else
              begin
                XTouchDevices[CurrentDevice].ChannelOffset:=(TotalChannelsToDisplay_local-1);
              end;
            end;
            if (Button=51) and ButtonState then
            begin
              XTouchDevices[CurrentDevice].DisplayGlobalView:=not XTouchDevices[CurrentDevice].DisplayGlobalView;
              XTouchDevices[CurrentDevice].DisplaySelectedDevices:=false;
            end;
            if (Button=52) and ButtonState then
            begin
              XTouchDevices[CurrentDevice].DisplaySelectedDevices:=not XTouchDevices[CurrentDevice].DisplaySelectedDevices;
            end;
          end;
        end;
      end;
    end;
  except
  end;
end;

procedure Txtouchcontrolform.WatchDogTimerTimer(Sender: TObject);
var
  i_dev:integer;
begin
  try
    for i_dev:=0 to length(XTouchDevices)-1 do
      xtouchserver.SendBuffer(XTouchDevices[i_dev].IPAddress, 10111, XCtl_IdlePacket);
  except
  end;
end;

procedure Txtouchcontrolform.UpdateTimerTimer(Sender: TObject);
var
  i_dev, i:integer;
begin
  for i_dev:=0 to length(XTouchDevices)-1 do
  begin
    for i:=0 to length(XTouchDevices[i_dev].ButtonLightOn)-1 do
    begin
      if (XTouchDevices[i_dev].ButtonLightOn[i]<254) and (XTouchDevices[i_dev].ButtonLightOn[i]>1) then
        XTouchDevices[i_dev].ButtonLightOn[i]:=XTouchDevices[i_dev].ButtonLightOn[i]-1;
    end;
  end;

  SendDataToXTouchDevices;
end;

procedure Txtouchcontrolform.UpdateFaderTimerTimer(Sender: TObject);
begin
  // Update XTouch-Data-Array
  UpdateXTouchData;

  SendDataToXTouchDevices_Faders;
end;

procedure Txtouchcontrolform.Button1Click(Sender: TObject);
begin
  close;
end;

procedure Txtouchcontrolform.addbtnClick(Sender: TObject);
var
  i:integer;
begin
  if not mainform.UserAccessGranted(1) then exit;

  adddevicetogroupform.DeviceAndGroupMode:=true;
  adddevicetogroupform.showmodal;

  if adddevicetogroupform.modalresult=mrOK then
  begin
    for i:=0 to adddevicetogroupform.ListBox1.Count-1 do
    begin
      // check if selected
      if adddevicetogroupform.listbox1.Selected[i] then
      begin
        // get GUID of device and add it to list
        setlength(mainform.XTouchDevices, length(mainform.XTouchDevices)+1);
        mainform.XTouchDevices[length(mainform.XTouchDevices)-1].ID:=adddevicetogroupform.GUIDList[i];
      end;
    end;
    RefreshList;
  end;
end;

procedure Txtouchcontrolform.upbtnClick(Sender: TObject);
var
  XTouchDevice:TXTouchDevice;
  IsDevice:boolean;
begin
  if not mainform.UserAccessGranted(1) then exit;

  if listbox1.ItemIndex>0 then
  begin
    // move one step upwards
    XTouchDevice.ID:=mainform.XTouchDevices[listbox1.ItemIndex-1].ID;
    IsDevice:=mainform.XTouchDevices[listbox1.ItemIndex-1].IsDevice;
    XTouchDevice.ChannelsToDisplay:=mainform.XTouchDevices[listbox1.ItemIndex-1].ChannelsToDisplay;

    mainform.XTouchDevices[listbox1.ItemIndex-1].ID:=mainform.XTouchDevices[listbox1.ItemIndex].ID;
    mainform.XTouchDevices[listbox1.ItemIndex-1].IsDevice:=mainform.XTouchDevices[listbox1.ItemIndex].IsDevice;
    mainform.XTouchDevices[listbox1.ItemIndex-1].ChannelsToDisplay:=mainform.XTouchDevices[listbox1.ItemIndex].ChannelsToDisplay;

    mainform.XTouchDevices[listbox1.ItemIndex].ID:=XTouchDevice.ID;
    mainform.XTouchDevices[listbox1.ItemIndex].IsDevice:=IsDevice;
    mainform.XTouchDevices[listbox1.ItemIndex].ChannelsToDisplay:=XTouchDevice.ChannelsToDisplay;

    listbox1.ItemIndex:=listbox1.ItemIndex-1;

    RefreshList;
  end;
end;

procedure Txtouchcontrolform.downbtnClick(Sender: TObject);
var
  XTouchDevice:TXTouchDevice;
  IsDevice:boolean;
begin
  if not mainform.UserAccessGranted(1) then exit;

  if listbox1.ItemIndex<(listbox1.Items.Count-1) then
  begin
    // move one step downwards
    XTouchDevice.ID:=mainform.XTouchDevices[listbox1.ItemIndex+1].ID;
    IsDevice:=mainform.XTouchDevices[listbox1.ItemIndex+1].IsDevice;
    XTouchDevice.ChannelsToDisplay:=mainform.XTouchDevices[listbox1.ItemIndex+1].ChannelsToDisplay;

    mainform.XTouchDevices[listbox1.ItemIndex+1].ID:=mainform.XTouchDevices[listbox1.ItemIndex].ID;
    mainform.XTouchDevices[listbox1.ItemIndex+1].IsDevice:=mainform.XTouchDevices[listbox1.ItemIndex].IsDevice;
    mainform.XTouchDevices[listbox1.ItemIndex+1].ChannelsToDisplay:=mainform.XTouchDevices[listbox1.ItemIndex].ChannelsToDisplay;

    mainform.XTouchDevices[listbox1.ItemIndex].ID:=XTouchDevice.ID;
    mainform.XTouchDevices[listbox1.ItemIndex].IsDevice:=IsDevice;
    mainform.XTouchDevices[listbox1.ItemIndex].ChannelsToDisplay:=XTouchDevice.ChannelsToDisplay;

    listbox1.ItemIndex:=listbox1.ItemIndex+1;

    RefreshList;
  end;
end;

procedure Txtouchcontrolform.deletebtnClick(Sender: TObject);
var
  i:integer;
begin
  if not mainform.UserAccessGranted(1) then exit;

  if listbox1.ItemIndex>-1 then
  begin
    // move all devices one up and reduce by one element
    for i:=listbox1.itemindex to length(mainform.XTouchDevices)-2 do
    begin
      mainform.XTouchDevices[i].ID:=mainform.XTouchDevices[i+1].ID;
      mainform.XTouchDevices[i].IsDevice:=mainform.XTouchDevices[i+1].IsDevice;
      mainform.XTouchDevices[i].ChannelsToDisplay:=mainform.XTouchDevices[i+1].ChannelsToDisplay;
    end;
    setlength(mainform.XTouchDevices, length(mainform.XTouchDevices)-1);

    RefreshList;
  end;
end;

procedure Txtouchcontrolform.FormShow(Sender: TObject);
begin
  RefreshList;
end;

procedure Txtouchcontrolform.resetbtnClick(Sender: TObject);
begin
  setlength(XTouchDevices, 0);
  listbox2.items.Clear;
end;

procedure Txtouchcontrolform.datainstarteditChange(Sender: TObject);
begin
  DataInOffset:=round(datainstartedit.Value);
end;

procedure Txtouchcontrolform.CheckBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  UseDataIn:=Checkbox1.Checked;
end;

procedure Txtouchcontrolform.CheckBox1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UseDataIn:=Checkbox1.Checked;
end;

procedure Txtouchcontrolform.xtouchserverUDPException(
  AThread: TIdUDPListenerThread; ABinding: TIdSocketHandle;
  const AMessage: String; const AExceptionClass: TClass);
begin
  // no exception
end;

end.
