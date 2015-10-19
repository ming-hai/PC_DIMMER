library temperaturregler;

{ Wichtiger Hinweis zur DLL-Speicherverwaltung: ShareMem muss sich in der
  ersten Unit der unit-Klausel der Bibliothek und des Projekts befinden (Projekt-
  Quelltext anzeigen), falls die DLL Prozeduren oder Funktionen exportiert, die
  Strings als Parameter oder Funktionsergebnisse �bergeben. Das gilt f�r alle
  Strings, die von oder an die DLL �bergeben werden -- sogar f�r diejenigen, die
  sich in Records und Klassen befinden. Sharemem ist die Schnittstellen-Unit zur
  Verwaltungs-DLL f�r gemeinsame Speicherzugriffe, BORLNDMM.DLL.
  Um die Verwendung von BORLNDMM.DLL zu vermeiden, k�nnen Sie String-
  Informationen als PChar- oder ShortString-Parameter �bergeben. }


uses
  Forms,
  Dialogs,
  SysUtils,
  Classes,
  Windows,
  configfrm in 'configfrm.pas' {Config},
  setup in 'setup.pas' {setupform},
  messagesystem in 'messagesystem.pas';

{$R *.res}

procedure DLLCreate(CallbackSetDLLValues,CallbackSetDLLValueEvent,CallbackSetDLLNames,CallbackGetDLLValue,CallbackSendMessage:Pointer);stdcall;
begin
  Application.CreateForm(TConfig, Config);
  @Config.SetDLLEvent:=CallbackSetDLLValueEvent;
  @Config.SendMSG:=CallbackSendMessage;
end;

procedure DLLStart;stdcall;
begin
  // DLL wird bei FormShow() gestartet
end;

function DLLDestroy:boolean;stdcall;
begin

  // Letzte Temperaturwerte eintragen
  Config.Memo1.Lines.Add(DateToStr(now)+';'+TimeToStr(now)+';'+
    floattostrf(Config.CurrentTemp, ffFixed, 5, 1)+';'+
    floattostrf(config.CurrentTemp2, ffFixed, 5, 1)+';'+
    floattostrf(config.CurrentTemp3, ffFixed, 5, 1)+';'+
    floattostrf((Config.CurrentTemp-Config.TempVor15Minuten), ffFixed, 5, 1)+';'+
    floattostrf(Config.Kilowattstunden+(7.5*(1/3600)), ffFixed, 5, 6)+';'+
    floattostrf(Config.Kilowattstunden+(7.5*(1/3600))*0.24, ffFixed, 5, 6));
  // Datei abspeichern
  if setupform.savefilestoedit.Text<>'' then
  begin
    if not DirectoryExists(setupform.savefilestoedit.Text) then
      CreateDir(setupform.savefilestoedit.Text);
    Config.Memo1.Lines.SaveToFile(setupform.savefilestoedit.Text+'\'+stringreplace(DateToStr(now), '.', '', [rfReplaceAll, rfIgnoreCase])+'_'+
      stringreplace(TimeToStr(now), ':', '', [rfReplaceAll, rfIgnoreCase])+'_Temperatur.csv');
  end;

  Config.Shutdown:=true;
  if config.comport.Connected then
		Config.comport.Disconnect;
  Config.SekundenTimer.Enabled:=false;

	@config.SetDLLEvent:=nil;
	Config.free;

  Result:=True;
end;

function DLLIdentify:PChar;stdcall;
begin
  Result:=PChar('Input');
end;

function DLLGetName:PChar;stdcall;
begin
  Result := PChar('Temperaturregler');
end;

function DLLGetVersion:PChar;stdcall;
begin
  Result := PChar('v1.6');
end;

procedure DLLShow;stdcall;
begin
  Config.Show;
end;

procedure DLLSendData(address, startvalue, endvalue, fadetime:integer;name:PChar);stdcall;
begin
end;

procedure DLLSendMessage(MSG:Byte; Data1, Data2:Variant);stdcall;
begin
  case MSG of
    14:
    begin
      if Integer(Data1)=round(setupform.temp2_msb.value) then
      begin
        config.temp2msb:=Integer(Data2);
        config.CurrentTemp2:=(((config.temp2msb shl 8)+config.temp2lsb)-550)/10;
        config.temp2lbl.caption:=floattostrf(config.CurrentTemp2, ffFixed, 5, 1)+'�C';
      end;
      if Integer(Data1)=round(setupform.temp2_lsb.value) then
      begin
        config.temp2lsb:=Integer(Data2);
        config.CurrentTemp2:=(((config.temp2msb shl 8)+config.temp2lsb)-550)/10;
        config.temp2lbl.caption:=floattostrf(config.CurrentTemp2, ffFixed, 5, 1)+'�C';
      end;

      if Integer(Data1)=round(setupform.temp3_msb.value) then
      begin
        config.temp3msb:=Integer(Data2);
        config.CurrentTemp3:=(((config.temp3msb shl 8)+config.temp3lsb)-550)/10;
        config.temp3lbl.caption:=floattostrf(config.CurrentTemp3, ffFixed, 5, 1)+'�C';
      end;
      if Integer(Data1)=round(setupform.temp3_lsb.value) then
      begin
        config.temp3lsb:=Integer(Data2);
        config.CurrentTemp3:=(((config.temp3msb shl 8)+config.temp3lsb)-550)/10;
        config.temp3lbl.caption:=floattostrf(config.CurrentTemp3, ffFixed, 5, 1)+'�C';
      end;
    end;
    MSG_EDITPLUGINSCENE:
    begin
      Config.Show;
    end;
    MSG_STARTPLUGINSCENE:
    begin
      if string(Data1)='{EB86EDF4-F750-420C-81D9-3023741988E8}' then
      begin
        //Temperaturregler: Ein
        if Config.FirstShow then
        begin
          Config.FirstShow:=false;
          Config.StartUp;
        end;
        Config.tempon.StateOn:=true;
        Config.tempon.OnOn(nil);
      end;
      if string(Data1)='{4950EE57-ACAC-4BB3-ACA6-9CBD4D9F1B56}' then
      begin
        //Temperaturregler: Aus
        Config.tempon.StateOn:=false;
        Config.tempon.OnOff(nil);
      end;
    end;
  end;
end;

exports
  DLLCreate,
  DLLStart,
  DLLDestroy,
  DLLIdentify,
  DLLGetVersion,
  DLLGetName,
  DLLShow,
  DLLSendData,
  DLLSendMessage;

begin
end.
