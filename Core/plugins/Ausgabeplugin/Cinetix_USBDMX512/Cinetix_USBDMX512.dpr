library Cinetix_USBDMX512;

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
  aboutfrm in 'aboutfrm.pas' {About},
  messagesystem in '..\..\..\messagesystem.pas';

{$R *.res}

procedure DLLCreate(CallbackSetDLLValues,CallbackSetDLLValueEvent,CallbackSetDLLNames,CallbackGetDLLValue,CallbackSendMessage:Pointer);stdcall;
begin
//  config:=TConfig.Create(nil);
  Application.CreateForm(TConfig, Config);
  @Config.RefreshDLLValues:=CallbackSetDLLValues;
  @Config.RefreshDLLEvent:=CallbackSetDLLValueEvent;
end;

procedure DLLStart;stdcall;
begin
  config.Startup;
end;

function DLLDestroy:boolean;stdcall;
begin
  try
	  config.shutdown:=true;

	  try
	    if config.comport2.Connected then
		  	Config.comport2.close;
	  except
	  end;
	  @config.RefreshDLLValues:=nil;
	  @config.RefreshDLLEvent:=nil;
	  Config.Release;
  except
  end;
  Result:=True;
end;

function DLLIdentify:PChar;stdcall;
begin
  Result:=PChar('Output');
end;

function DLLGetName:PChar;stdcall;
begin
  Result := PChar('Cinetix USB DMX512');
end;

function DLLGetVersion:PChar;stdcall;
begin
  Result := PChar('v2.0');
end;

procedure DLLConfigure;stdcall;
begin
  Config.ShowModal;
end;

procedure DLLAbout;stdcall;
var
  dllForm: TForm;
begin
  dllForm :=TAbout.Create(Application);
  try
    dllForm.ShowModal;
  finally
    dllForm.Release;
  end;
end;

procedure DLLSendData(address, startvalue, endvalue, fadetime:integer;name:PChar);stdcall;
begin
end;

function DLLIsSending:boolean;stdcall;
begin
	result:=config.issending;
  config.issending:=false;
end;

procedure DLLSendMessage(MSG:Byte; Data1, Data2:Variant);stdcall;
begin
  case MSG of
    MSG_ACTUALCHANNELVALUE:
    begin
      if Data1>512 then exit;
      if (config.shutdown=false) then
      begin
        config.rs232frame_new[Integer(Data1)-1]:=Byte(Data2);
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
  DLLAbout,
  DLLConfigure,
  DLLSendData,
  DLLIsSending,
  DLLSendMessage;

begin
end.
