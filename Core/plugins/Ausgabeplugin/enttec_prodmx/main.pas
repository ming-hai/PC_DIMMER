unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, D2XXUnit, CHHighResTimer, StdCtrls, Mask, JvExMask, JvSpin,
  jpeg, ExtCtrls, Registry;

const
	// Enttec Pro definitions
	GET_WIDGET_PARAMS = 3;
	GET_WIDGET_SN = 10;
	GET_WIDGET_PARAMS_REPLY = 3;
	SET_WIDGET_PARAMS = 4;
	SET_DMX_RX_MODE = 5;
	SET_DMX_TX_MODE = 6;
	SEND_DMX_RDM_TX = 7;
	RECEIVE_DMX_ON_CHANGE = 8;
	RECEIVED_DMX_COS_TYPE = 9;
	ONE_BYTE = 1;
	DMX_START_CODE = 126;
	DMX_END_CODE = 231;
	OFFSET = 255;
	DMX_HEADER_LENGTH = 4;
	BYTE_LENGTH = 8;
	HEADER_RDM_LABEL = 5;
	NO_RESPONSE = 0;
	DMX_PACKET_SIZE = 512;

	MAX_PROS = 20;
	SEND_NOW = 0;
	HEAD = 0;
	IO_ERROR = 9;
	
type
	DMXUSBPROParamsType = record
		FirmwareLSB:byte;
		FirmwareMSB:byte;
		BreakTime:byte;
		MaBTime:byte;
		RefreshRate:byte;
	end;

	DMXUSBPROSetParamsType = record
		UserSizeLSB:byte;
		UserSizeMSB:byte;
		BreakTime:byte;
		MaBTime:byte;
		RefreshRate:byte;
	end;

	ReceivedDmxCosStruct = record
		start_changed_byte_number:byte;
		changed_byte_array:array[0..4] of byte;
		changed_byte_data:array[0..39] of byte;
	end;

  TCallback = procedure(address,startvalue,endvalue,fadetime:integer);stdcall;
  TCallbackEvent = procedure(address,endvalue:integer);stdcall;

  Tmainform = class(TForm)
    DMXTimer: TCHHighResTimer;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    deviceselectionlist: TComboBox;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    Label1: TLabel;
    JvSpinEdit1: TJvSpinEdit;
    dmxinenabled: TCheckBox;
    sendalwayscheck: TCheckBox;
    Label15: TLabel;
    disconnectedlbl: TLabel;
    connectedlbl: TLabel;
    Button1: TButton;
    Button2: TButton;
    autoconnectcheckbox: TCheckBox;
    SlowTimer: TTimer;
    breaktimeedit: TJvSpinEdit;
    mabtimeedit: TJvSpinEdit;
    refreshrateedit: TJvSpinEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Button5: TButton;
    DMXInput: TTimer;
    Button3: TButton;
    Button4: TButton;
    LastErrorLbl: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    JvSpinEdit2: TJvSpinEdit;
    Label18: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DMXTimerTimer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure JvSpinEdit1Change(Sender: TObject);
    procedure deviceselectionlistChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SlowTimerTimer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DMXInputTimer(Sender: TObject);
    procedure JvSpinEdit2Change(Sender: TObject);
  private
    { Private-Deklarationen }
    num_devices:byte;
    device_connected:Word;
    device_num:integer;
    AutoConnectRetrys:byte;
    DMXinOK, DMXoutOK:boolean;
  public
    { Public-Deklarationen }
	  PRO_Params: DMXUSBPROParamsType;
  	device_handle:THANDLE;//DWORD;
    issending:boolean;
    NewDataForOutput:boolean;

    LastErrorString, DMXInMessage:string;

    DMXOutputBuffer:array[0..512] of byte; // DMX-Startbyte, 512 Datenbytes
    DMXInputBuffer, DMXOldInputBuffer:array[0..513] of byte; // Receive-Status, DMX-Startbyte, 512 Datenbytes

    RefreshDLLValues:TCallback;
    RefreshDLLEvent:TCallbackEvent;

	  function FTDI_SendData(Lbl:integer; Data: Pointer; laenge: integer):integer;
  	function FTDI_ReceiveData(Lbl: integer; Data:Pointer; expected_length:Cardinal):integer;
//	  function FTDI_SendDataToPro(Lbl: byte; Data:Pointer; laenge: Cardinal):byte;
  	function FTDI_RxDMX(Lbl: byte; Data:Pointer; var expected_length:Cardinal):byte;
//	  function Get_Pro_Handle:Pointer;
//  	function FTDI_ReceiveDataFromPro(Lbl: byte; Data:Pointer; expected_length: Cardinal):integer;
//	  function FTDI_OpenDevice(device_num: integer; VersionMSB: Pointer; VersionLSB: Pointer; full_mode:boolean=true):Word;
    function FTDI_OpenDevice(device_num:integer):word;
  	function FTDI_ListDevices:integer;
	  procedure FTDI_ClosePort;
  	procedure FTDI_PurgeBuffer;

    procedure ReadAdvancedInfos;
    procedure ConnectToInterface;
    procedure ReconnectInterface;
    procedure DisconnectInterface;

    procedure CheckFTDIStatus(ftStatus:integer);
  end;

var
  mainform: Tmainform;

implementation

{$R *.dfm}

function GetModulePath : String;
var
  QueryRes: TMemoryBasicInformation;
  LBuffer: String;
begin
  VirtualQuery(@GetModulePath, QueryRes, SizeOf(QueryRes));
  SetLength(LBuffer, MAX_PATH);
  SetLength(LBuffer, GetModuleFileName(Cardinal(QueryRes.AllocationBase),
  PChar(LBuffer), Length(LBuffer)));
  result:=LBuffer;
end;

// Function : FTDI_ClosePort
// Author	: ENTTEC
// Purpose  : Closes the Open DMX USB PRO Device Handle
// Parameters: none
//
procedure Tmainform.FTDI_ClosePort;
begin
//  FT_ResetDevice(device_handle);

	if (device_handle <> 0) then
  	FT_Close(device_handle);
end;

// Function : FTDI_ListDevices
// Author	: ENTTEC
// Purpose  : Returns the no. of PRO's conneced to the PC
// Parameters: none
//
function Tmainform.FTDI_ListDevices:integer;
var
	ftStatus:FT_RESULT;
	numDevs:Dword;
begin
	numDevs:=0;
	ftStatus := FT_GetNumDevices(@numDevs,nil,FT_LIST_NUMBER_ONLY);

  CheckFTDIStatus(ftStatus);

	if (ftStatus = FT_OK) then
		result:=numDevs
	else
		result:=NO_RESPONSE;
end;


// Function : FTDI_SendData
// Author	: ENTTEC
// Purpose  : Send Data (DMX or other packets) to the PRO
// Parameters: Label, Pointer to Data Structure, laenge of Data
//
function Tmainform.FTDI_SendData(Lbl:integer; Data: Pointer; laenge: integer):integer;
var
	end_code:byte;
	res:FT_RESULT;
	bytes_written:DWORD;
	header:array[0..DMX_HEADER_LENGTH-1] of byte;
begin
	end_code := DMX_END_CODE;
	bytes_written := 0;

	// Form Packet Header
	header[0] := DMX_START_CODE;
	header[1] := Lbl;
	header[2] := laenge AND OFFSET;
	header[3] := laenge shr BYTE_LENGTH;
	// Write The Header
	FT_Write(device_handle,@header,DMX_HEADER_LENGTH,@bytes_written);
	if (bytes_written <> DMX_HEADER_LENGTH) then
  begin
    LastErrorString:='Error writing DMX-Header';
    result:=NO_RESPONSE;
    exit;
  end;
	// Write The Data
	FT_Write(device_handle,data,laenge,@bytes_written);
	if (bytes_written <> Cardinal(laenge)) then
  begin
    LastErrorString:='Error writing DMX-Data';
    result:=NO_RESPONSE;
    exit;
  end;
	// Write End Code
	res := FT_Write(device_handle,@end_code,ONE_BYTE,@bytes_written);
	if (bytes_written <> ONE_BYTE) then
  begin
    LastErrorString:='Error writing DMX-EndCode';
    result:=NO_RESPONSE;
    exit;
  end;
	if (res = FT_OK) then
		result:=1
	else
		result:=0;
end;

// Function : FTDI_ReceiveData
// Author	: ENTTEC
// Purpose  : Receive Data (DMX or other packets) from the PRO
// Parameters: Label, Pointer to Data Structure, laenge of Data
//
function Tmainform.FTDI_ReceiveData(Lbl: integer; Data:Pointer; expected_length:Cardinal):integer;
var
	res:FT_RESULT;
	laenge:DWORD;
	bytes_read:DWORD;
	bytes:byte;
	buffer:array[0..599] of char;
begin
	bytes_read :=0;
	bytes := 0;

	// Check for Start Code and matching Label
	while (bytes <> lbl) do
	begin
		while (bytes <> DMX_START_CODE) do
		begin
			FT_Read(device_handle,@bytes,ONE_BYTE,@bytes_read);
			if (bytes_read = NO_RESPONSE) then
      begin
        LastErrorString:='Error reading data from interface';
        result:=NO_RESPONSE;
        exit;
      end;
		end;
		FT_Read(device_handle,@bytes,ONE_BYTE,@bytes_read);
		if (bytes_read = NO_RESPONSE) then
    begin
      LastErrorString:='Error reading data from interface';
      result:=NO_RESPONSE;
      exit;
    end;
	end;

	// Read the rest of the Header Byte by Byte -- Get laenge
	FT_Read(device_handle,@bytes,ONE_BYTE,@bytes_read);
	if (bytes_read = NO_RESPONSE) then
  begin
    LastErrorString:='Error reading Headerbyte 1';
    result:=NO_RESPONSE;
    exit;
  end;
	laenge := bytes;
	res := FT_Read(device_handle,@bytes,ONE_BYTE,@bytes_read);
	if (res <> FT_OK) then
  begin
    LastErrorString:='Error reading Headerbyte 2';
    result:=NO_RESPONSE;
    exit;
  end;
	laenge := laenge + (bytes shl BYTE_LENGTH);
	// Check laenge is not greater than allowed
	if (laenge > 513+1) then
  begin
    LastErrorString:='Error: received packet-length is larger than allowed';
    result:=NO_RESPONSE;
    exit;
  end;
	// Read the actual Response Data
  if expected_length=sizeof(Pro_Params) then
	begin
    FT_Read(device_handle,@Pro_Params,laenge,@bytes_read);
    result:=1;
    exit;
  end else
  	FT_Read(device_handle,@buffer,laenge,@bytes_read);

	if(bytes_read <> laenge) then
  begin
    LastErrorString:='Error reading response Data';
    result:=NO_RESPONSE;
    exit;
  end;
	// Check The End Code
	FT_Read(device_handle,@bytes,ONE_BYTE,@bytes_read);
	if (bytes_read = NO_RESPONSE) then
  begin
    LastErrorString:='Error reading endcode';
    result:=NO_RESPONSE;
    exit;
  end;
	if (bytes <> DMX_END_CODE) then
  begin
    LastErrorString:='Error: received data not as expected';
    result:=NO_RESPONSE;
    exit;
  end;
	// Copy The Data read to the buffer passed
	move(buffer, data^, expected_length);
	result:=1;
end;

// Function : FTDI_PurgeBuffer
// Author	: ENTTEC
// Purpose  : Clears the buffer used internally by the PRO
// Parameters: none
//
procedure Tmainform.FTDI_PurgeBuffer;
begin
	FT_Purge(device_handle, FT_PURGE_TX);
	FT_Purge(device_handle, FT_PURGE_RX);
end;


// Function : FTDI_OpenDevice
// Author	: ENTTEC
// Purpose  : Opens the PRO; Tests various parameters; outputs info
// Parameters: device num (returned by the List Device fuc), Fw Version MSB, Fw Version LSB
//
//function Tmainform.FTDI_OpenDevice(device_num: integer; VersionMSB: Pointer; VersionLSB: Pointer; full_mode:boolean=true):Word;
function Tmainform.FTDI_OpenDevice(device_num:integer):word;
var
	RTimeout:integer;
	WTimeout:integer;
	version:longint;
	major_ver, minor_ver, build_ver:byte;
	tries:integer;
	latencyTimer:byte;
	ftStatus:FT_RESULT;
begin
	RTimeout := 120;
	WTimeout := 100;
	tries := 0;

	// Try at least 3 times
	repeat
		memo1.lines.add('Try to connect to interface '+inttostr(device_num)+' - '+inttostr(tries)+' of 3 tries');
		// Open the PRO
		ftStatus := FT_Open(device_num,@device_handle);
    CheckFTDIStatus(ftStatus);
		// delay for next try
		Sleep(750);
		inc(tries);
	until ((ftStatus = FT_OK) or (tries < 3));

	// PRO Opened succesfully
	if (ftStatus = FT_OK) then
	begin
		// GET D2XX Driver Version
		ftStatus := FT_GetDriverVersion(device_handle,@version);
    CheckFTDIStatus(ftStatus);
		if (ftStatus = FT_OK) then
		begin
			major_ver := version shr 16;
			minor_ver := version shr 8;
			build_ver := version AND 255;
			memo1.lines.add('D2XX Driver Version: '+inttostr(major_ver)+'.'+inttostr(minor_ver)+'.'+inttostr(build_ver));
		end else
		begin
			memo1.lines.add('Unable to Get D2XX Driver Version') ;
		end;

		// GET Latency Timer
		ftStatus := FT_GetLatencyTimer(device_handle, @latencyTimer);
    CheckFTDIStatus(ftStatus);
		if (ftStatus = FT_OK)  then
			memo1.lines.add('Latency Timer: '+inttostr(latencyTimer))
		else
			memo1.lines.add('Unable to Get Latency Timer') ;

		// SET Default Read & Write Timeouts (in micro sec ~ 100)
		FT_SetTimeouts(device_handle,RTimeout,WTimeout);

		// Clear (purges) the buffer
		FT_Purge(device_handle,FT_PURGE_RX);

    // Erweiterte Infos abrufen
    ReadAdvancedInfos;

		// Clear (purges) the buffer again
		FT_Purge(device_handle,FT_PURGE_RX);

		// return success
		result:=1;
	end	else // Can't open Device
	begin
    memo1.lines.add('Error: can''t open connection to interface');
		result:=0;
	end;
end;


// Read a DMX packet
function Tmainform.FTDI_RxDMX(Lbl: byte; Data:Pointer; var expected_length:Cardinal):byte;
var
	laenge:DWORD;
	bytes_read:DWORD;
	bytes:byte;
	header:array[0..2] of byte;
	buffer:array[0..599] of byte;
begin
	bytes_read :=0;
	bytes := 0;

	// Check for Start Code and matching Label
	while (bytes <> DMX_START_CODE) do
	begin
		FT_Read(device_handle,@bytes,ONE_BYTE,@bytes_read);
		if (bytes_read = NO_RESPONSE) then
    begin
      LastErrorString:='Error reading DMX-StartCode';
      result:=NO_RESPONSE;
      exit;
    end;
	end;
	FT_Read(device_handle,@header,3,@bytes_read);
	if (bytes_read = NO_RESPONSE) then
  begin
    LastErrorString:='Error reading Header';
    result:=NO_RESPONSE;
    exit;
  end;
	if (header[0] <> Lbl) then
  begin
    LastErrorString:='Error: header not as expected';
    result:=NO_RESPONSE;
    exit;
  end;
	laenge := header[1];
	laenge := laenge + (header[2] shl BYTE_LENGTH);
	laenge := laenge + 1;
	// Check laenge is not greater than allowed
	if (laenge > DMX_PACKET_SIZE +3) then
  begin
    LastErrorString:='Error: DMX-Packet size too large';
    result:=NO_RESPONSE;
    exit;
  end;
	// Read the actual Response Data
	FT_Read(device_handle,@buffer,laenge,@bytes_read);
	if (bytes_read <> laenge) then
  begin
    LastErrorString:='Error reading the response data';
    result:=NO_RESPONSE;
    exit;
  end;
	// Check The End Code
	if (buffer[laenge-1] <> DMX_END_CODE) then
  begin
    LastErrorString:='Error: DMX-EndCode not as expected';
    result:=NO_RESPONSE;
    exit;
  end;
	expected_length := laenge;

	// Copy The Data read to the buffer passed
	move(buffer, data^, expected_length);

	result:=1;
end;

procedure Tmainform.CheckFTDIStatus(ftStatus:integer);
begin
  case ftStatus of
    0: memo1.lines.Add('FTDI Driver-MSG: OK');
    1: memo1.lines.Add('FTDI Driver-MSG: Invalid Handle');
    2: memo1.lines.Add('FTDI Driver-MSG: Device not found');
    3: memo1.lines.Add('FTDI Driver-MSG: Device not opened');
    4: memo1.lines.Add('FTDI Driver-MSG: IO-Error');
    5: memo1.lines.Add('FTDI Driver-MSG: Insufficient resources');
    6: memo1.lines.Add('FTDI Driver-MSG: Invalid parameter');
    7: memo1.lines.Add('FTDI Driver-MSG: Invalid baudrate');
    8: memo1.lines.Add('FTDI Driver-MSG: Device not opened for erase');
    9: memo1.lines.Add('FTDI Driver-MSG: Device not opened for write');
    10: memo1.lines.Add('FTDI Driver-MSG: Failed to write device');
    11: memo1.lines.Add('FTDI Driver-MSG: Eeprom read failed');
    12: memo1.lines.Add('FTDI Driver-MSG: Eeprom write failed');
    13: memo1.lines.Add('FTDI Driver-MSG: Eeprom erase faild');
    14: memo1.lines.Add('FTDI Driver-MSG: Eeprom not present');
    15: memo1.lines.Add('FTDI Driver-MSG: Eeprom not programmed');
    16: memo1.lines.Add('FTDI Driver-MSG: Invalid Args');
    17: memo1.lines.Add('FTDI Driver-MSG: Other error');
  end;
end;

procedure Tmainform.FormCreate(Sender: TObject);
var
  LReg:TRegistry;
begin
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
        if not LReg.KeyExists(ExtractFileName(GetModulePath)) then
	        LReg.CreateKey(ExtractFileName(GetModulePath));
	      if LReg.OpenKey(ExtractFileName(GetModulePath),true) then
	      begin
	        if not LReg.ValueExists('Refreshrate') then
	          LReg.WriteInteger('Refreshrate',1);
	        JvSpinEdit1.value:=LReg.ReadInteger('Refreshrate');
          DMXTimer.Interval:=round(JvSpinEdit1.value);

	        if not LReg.ValueExists('RefreshrateIn') then
	          LReg.WriteInteger('RefreshrateIn',200);
	        JvSpinEdit2.value:=LReg.ReadInteger('RefreshrateIn');
          DMXInput.Interval:=round(JvSpinEdit2.value);

	        if not LReg.ValueExists('Use DMX-IN') then
	          LReg.WriteBool('Use DMX-IN',false);
          dmxinenabled.checked:=LReg.ReadBool('Use DMX-IN');

	        if not LReg.ValueExists('Send continuously') then
	          LReg.WriteBool('Send continuously',false);
          sendalwayscheck.checked:=LReg.ReadBool('Send continuously');

	        if not LReg.ValueExists('Autoconnect') then
	          LReg.WriteBool('Autoconnect',true);
          autoconnectcheckbox.checked:=LReg.ReadBool('Autoconnect');
	      end;
 			end;
    end;
  end;
  LReg.CloseKey;
  LReg.Free;

  issending:=false;

  NewDataForOutput:=true;

{
  // FTDI resetten
  FT_Reload(1027, 24577); // VID:0403, PID:6001
  FT_Rescan();
}
end;

procedure Tmainform.DMXTimerTimer(Sender: TObject);
var
	res:integer;
begin
  if not (dmxinenabled.Checked) then
  begin
    // Send DMX Data
    if ((device_connected>0) and (NewDataForOutput or sendalwayscheck.checked)) or sendalwayscheck.checked then
    begin
      DMXOutputBuffer[0] := 0; // Start Code = 0

      // actual send function called
      res := FTDI_SendData(SET_DMX_TX_MODE, @DMXOutputBuffer, sizeof(DMXOutputBuffer));

      // check response from Send function
      if (res <= 0) then
      begin
        LastErrorString:='Error Sending DMX-Data to Interface';
        DMXOutOK:=false;
      end else
      begin
        NewDataForOutput:=false;
        DMXOutOK:=true;
      end;
    end;
  end else
  begin
    DMXOutOK:=true;
  end;
end;

procedure Tmainform.DMXInputTimer(Sender: TObject);
var
	i:integer;
	res:integer;
  laenge:Cardinal;
begin
  // Receive DMX Data
  if (device_connected>0) and (dmxinenabled.Checked) then
  begin
    // actual receive function called
    laenge:=sizeof(DMXInputBuffer);
    res := FTDI_RxDMX(SET_DMX_RX_MODE, @DMXInputBuffer, laenge);
  	FT_Purge(device_handle, FT_PURGE_RX);
    // check response from Receive function
    if (res < 0) then
    begin
      DMXInMessage:='ERROR';
      DMXInOK:=false;
      LastErrorString:='Error Reading DMX-Data from Interface';
      if AutoConnectRetrys<3 then
      begin
        AutoConnectRetrys:=AutoConnectRetrys+1;
        ReconnectInterface;
      end;
    end else
    begin
      DMXInMessage:='Receiving...';
      DMXInOK:=true;

      // Neue DMX-Daten empfangen - nun verarbeiten
      for i:=2 to length(DMXInputBuffer)-1 do
      begin
        if DMXInputBuffer[i]<>DMXOldInputBuffer[i] then
        begin
          RefreshDLLEvent(i-1, DMXInputBuffer[i]);
//          DMXOldInputBuffer[i]:=DMXInputBuffer[i];
        end;
      end;
      move(DMXInputBuffer, DMXOldInputBuffer, sizeof(DMXInputBuffer));
    end;
  end else
  begin
    DMXInOK:=true;
  end;
end;

procedure Tmainform.ConnectToInterface;
var
  oldone,i:integer;
begin
  LastErrorString:='';
  DMXInMessage:='';

  memo1.lines.add('Looking for Devices...');
	Num_Devices := FTDI_ListDevices;

  oldone:=deviceselectionlist.ItemIndex;
  deviceselectionlist.Items.Clear;
  for i:=1 to Num_Devices do
  begin
    deviceselectionlist.Items.Add(inttostr(i))
  end;
  if oldone=-1 then
    oldone:=0;
  if oldone<deviceselectionlist.Items.Count then
    deviceselectionlist.ItemIndex:=oldone;

	if (Num_Devices = 0) then
	begin
		memo1.lines.add('  -> 0 Enttec Pro found');
	end	else
	begin
		memo1.lines.add('  -> '+inttostr(Num_Devices)+' EnttecPro found');
		memo1.lines.add('Opening the first device...');

		device_num := deviceselectionlist.ItemIndex;
		device_connected := FTDI_OpenDevice(device_num);

    connectedlbl.Visible:=device_connected<>0;
    disconnectedlbl.Visible:=(device_connected=0);

		// If you want to open all; use for loop ; uncomment the folllowing
		{
		 for (i=0;i<Num_Devices;i++)
		 begin
			if (device_connected)
				break;
			device_num = i;
			device_connected = FTDI_OpenDevice(device_num);
		 end;
		}
  end;
  DMXTimer.Enabled:=true;
  DMXInput.Enabled:=true;
end;

procedure Tmainform.DisconnectInterface;
begin
  LastErrorString:='';
  DMXInMessage:='';
  DMXInput.Enabled:=false;
  DMXTimer.Enabled:=false;
  memo1.lines.add('Interface disconnected.');
  device_connected:=0;

  connectedlbl.Visible:=device_connected<>0;
  disconnectedlbl.Visible:=(device_connected=0);

  FTDI_ClosePort;
end;

procedure Tmainform.ReconnectInterface;
begin
  LastErrorString:='Rebooting...';
  memo1.Lines.Clear;
  DisconnectInterface;
  ConnectToInterface;
end;

procedure Tmainform.Button3Click(Sender: TObject);
begin
  ReconnectInterface;
  AutoConnectRetrys:=0;
end;

procedure Tmainform.JvSpinEdit1Change(Sender: TObject);
begin
  DMXTimer.Interval:=round(JvSpinEdit1.Value);
end;

procedure Tmainform.deviceselectionlistChange(Sender: TObject);
begin
  ReconnectInterface;
end;

procedure Tmainform.Button2Click(Sender: TObject);
begin
  if mainform.ClientWidth=721 then
    mainform.ClientWidth:=345
  else
    mainform.ClientWidth:=721;

  groupbox3.Visible:=mainform.ClientWidth=721;
end;

procedure Tmainform.Button4Click(Sender: TObject);
begin
  DisconnectInterface;
  AutoConnectRetrys:=0;
end;

procedure Tmainform.FormDestroy(Sender: TObject);
var
  LReg:TRegistry;
begin
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
        if not LReg.KeyExists(ExtractFileName(GetModulePath)) then
	        LReg.CreateKey(ExtractFileName(GetModulePath));
	      if LReg.OpenKey(ExtractFileName(GetModulePath),true) then
	      begin
          LReg.WriteInteger('Refreshrate',round(JvSpinEdit1.value));
          LReg.WriteInteger('RefreshrateIn',round(JvSpinEdit2.value));
          LReg.WriteBool('Use DMX-IN',dmxinenabled.checked);
          LReg.WriteBool('Send continuously',sendalwayscheck.checked);
          LReg.WriteBool('Autoconnect',autoconnectcheckbox.checked);
	      end;
 			end;
    end;
  end;
  LReg.CloseKey;
  LReg.Free;
end;

procedure Tmainform.SlowTimerTimer(Sender: TObject);
begin
  if LastErrorString='' then
    LastErrorLbl.Caption:='Meldung: ...'
  else
    LastErrorLbl.Caption:='Meldung: '+LastErrorString;

  if dmxinenabled.Checked then
  begin
    if DMXInMessage='' then
      label17.Caption:='...'
    else
      label17.Caption:=DMXInMessage;
  end else
  begin
    label17.Caption:='Offline'
  end;

  if DMXInOK and DMXOutOK then
    LastErrorString:='';
end;

procedure Tmainform.Button5Click(Sender: TObject);
var
	res:integer;
  data:array[0..4] of byte;
begin
  data[0]:=0; // LSB of UserData-Length
  data[1]:=0; // MSB of UserData-Length
  data[2]:=round(breaktimeedit.value/10.67); // Breaktime (9..127) - each digit is a 10.67�s
  data[3]:=round(mabtimeedit.Value/10.67); // Mark after Break Time (1..127) - each digit is a 10.67�s
  data[4]:=round(refreshrateedit.Value); // DMX Output Rate (0..40)
	res := FTDI_SendData(SET_WIDGET_PARAMS, @data, sizeof(data));

  if res=NO_RESPONSE then
    exit;

  ReadAdvancedInfos;
end;

procedure Tmainform.ReadAdvancedInfos;
var
	res:integer;
  size:integer;
	VersionMSB:integer;
	VersionLSB:integer;
	temp:array[0..3] of byte;
	BreakTime:integer;
	MABTime:integer;
begin
	size := 0;

  // Send Get Widget Parameters to get Device Info
  memo1.lines.add('Sending GET_WIDGET_PARAMS packet... ');
  res := FTDI_SendData(GET_WIDGET_PARAMS,@size,2);
  // Check Response
  if (res = NO_RESPONSE) then
  begin
    FT_Purge(device_handle,FT_PURGE_TX);
    res := FTDI_SendData(GET_WIDGET_PARAMS,@size,2);
    if (res = NO_RESPONSE) then
    begin
      memo1.lines.add('Error: no response from interface');
      FTDI_ClosePort;
      exit;
    end;
  end;
  // Receive Widget Response
  memo1.lines.add('Waiting for GET_WIDGET_PARAMS_REPLY packet... ');
  res:=FTDI_ReceiveData(GET_WIDGET_PARAMS_REPLY, @Pro_Params, sizeof(Pro_Params));
  // Check Response
  if (res = NO_RESPONSE) then
  begin
    // Receive Widget Response packet
    res:=FTDI_ReceiveData(GET_WIDGET_PARAMS_REPLY, @Pro_Params, sizeof(Pro_Params));
    if (res = NO_RESPONSE) then
    begin
      memo1.lines.add('Error: no response from interface');
      exit;
    end;
  end	else
  begin
    memo1.lines.add(' GET WIDGET REPLY Received ... ');
  end;
  // Firmware  Version
  VersionMSB := PRO_Params.FirmwareMSB;
  VersionLSB := PRO_Params.FirmwareLSB;

  // GET PRO's serial number
  FTDI_SendData(GET_WIDGET_SN,@size,2);
  FTDI_ReceiveData(GET_WIDGET_SN,@temp,4);

  // Display All PRO Parametrs & Info avialable
  memo1.lines.add('Interface information');
  memo1.lines.add('=====================');
  BreakTime := trunc(PRO_Params.BreakTime*10.67);
  memo1.lines.add('BREAK TIME: '+inttostr(BreakTime)+'�s');
  MABTime := trunc(PRO_Params.MaBTime*10.67);
  memo1.lines.add('MAB TIME: '+inttostr(MABTime)+'�s');
  memo1.lines.add('SEND REFRESH RATE: '+inttostr(PRO_Params.RefreshRate)+'packets/sec');

  // Firmwareversion und Seriennummer abrufen
  label5.caption:=IntToHex(temp[3],2)+IntToHex(temp[2],2)+IntToHex(temp[1],2)+IntToHex(temp[0],2);
  label7.caption:='v'+inttostr(VersionMSB)+'.'+inttostr(VersionLSB);

  // Erweiterte DMX512-Daten abrufen
  breaktimeedit.value:=BreakTime;
  mabtimeedit.value:=MABTime;
  refreshrateedit.value:=PRO_Params.RefreshRate;
end;

procedure Tmainform.JvSpinEdit2Change(Sender: TObject);
begin
  DMXInput.Interval:=round(JvSpinEdit2.Value);
end;

end.
