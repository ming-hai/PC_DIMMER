unit deviceformprototypfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExExtCtrls, JvComponent, JvOfficeColorPanel,
  ComCtrls, StdCtrls, JvInterpreter;

type
  Teditproperties = record
    name:string;
    channel:Integer;
    actionname:string;
  end;

  Tcheckboxproperties = record
    name:string;
    channel:Integer;
    actionname:string;
    itemvalue:array of byte;
  end;

  Tdropdownproperties = record
    name:string;
    channel:Integer;
    actionname:string;
    itemvalue:array of byte;
  end;

  Tsliderproperties = record
    name:string;
    channel:Integer;
    actionname:string;
  end;

  Tbuttonproperties = record
    name:string;
    channel:Integer;
    onvalue:Integer;
    offvalue:Integer;
    actionname:string;
  end;

  Tradiobuttonproperties = record
    name:string;
    channel:Integer;
    actionname:string;
    itemvalue:array of byte;
  end;

  Taction = record
    name:string;
    funktion:string;
  end;

  Tdeviceformprototyp = class(TForm)
    position: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Shape1: TShape;
    Colorpicker: TJvOfficeColorPanel;
    devicename: TLabel;
    deviceimage: TImage;
    deviceadress: TLabel;
    procedure FormShow(Sender: TObject);
    procedure positionMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure positionMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Edits: array of TEdit;
    CheckBoxs: array of TCheckBox;
    ComboBoxs: array of TComboBox;
    Labels: array of TLabel;
    Sliders: array of TTrackBar;
    Shapes: array of TShape;
    Buttons: array of TButton;
    Radiobuttons: array of TRadioGroup;

    checkboxproperties:array of Tcheckboxproperties;
    dropdownproperties:array of Tdropdownproperties;
    sliderproperties:array of Tsliderproperties;
    buttonproperties:array of Tbuttonproperties;
    radiobuttonproperties:array of Tradiobuttonproperties;
    editproperties:array of Teditproperties;
    funktionen:string;
    Colorpickerchannel:array[0..2] of integer;
    procedure startscript(Sender: TObject);
  end;

implementation

uses PCDIMMER;

{$R *.dfm}

procedure Tdeviceformprototyp.FormShow(Sender: TObject);
begin
  bevel1.Left:=position.Width div 2;
  bevel2.Top:=position.Height div 2;
  shape1.Left:=position.Width div 2;
  shape1.Top:=position.Height div 2;
end;

procedure Tdeviceformprototyp.positionMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
  begin
    Shape1.Top:=Y-Shape1.Height div 2;
    Shape1.Left:=X-Shape1.Width div 2;
  end else
  begin
    Shape1.Top:=103;
    Shape1.Left:=103;
  end;
end;

procedure Tdeviceformprototyp.positionMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Shift=[ssLeft] then
  begin
    if ((x-(Shape1.Width div 2))>=0-(Shape1.Width div 2)) and ((x-(Shape1.Width div 2))<=position.Width-(Shape1.Width div 2)) then Shape1.Left:=x-(Shape1.Width div 2);
    if ((y-(Shape1.Height div 2))>=0-(Shape1.Height div 2)) and ((y-(Shape1.Height div 2))<=position.Height-(Shape1.Height div 2)) then Shape1.Top:=y-(Shape1.Height div 2);
    Shape1.Refresh;
  end;
end;

procedure Tdeviceformprototyp.startscript(Sender: TObject);
var
  i:integer;
begin
  mainform.ScriptInterpreter.Pas.Text:=funktionen;

  for i:=0 to length(Edits)-1 do
  begin
    if Sender=Edits[i] then
    begin
      mainform.ScriptInterpreter.CallFunction(editproperties[i].actionname,nil,[edits[i].text]);
    end;
  end;

  for i:=0 to length(CheckBoxs)-1 do
  begin
    if Sender=CheckBoxs[i] then
    begin
      mainform.ScriptInterpreter.CallFunction(checkboxproperties[i].actionname,nil,[Checkboxs[i].checked]);
    end;
  end;

  for i:=0 to length(ComboBoxs)-1 do
  begin
    if Sender=ComboBoxs[i] then
    begin
      mainform.ScriptInterpreter.CallFunction(dropdownproperties[i].actionname,nil,[Comboboxs[i].Itemindex]);
    end;
  end;

  for i:=0 to length(Sliders)-1 do
  begin
    if Sender=Sliders[i] then
    begin
      mainform.ScriptInterpreter.CallFunction(sliderproperties[i].actionname,nil,[Sliders[i].Position]);
    end;
  end;

  for i:=0 to length(Buttons)-1 do
  begin
    if Sender=Buttons[i] then
    begin
      mainform.ScriptInterpreter.CallFunction(buttonproperties[i].actionname,nil,[]);
    end;
  end;

  for i:=0 to length(Radiobuttons)-1 do
  begin
    if Sender=Radiobuttons[i] then
    begin
      mainform.ScriptInterpreter.CallFunction(radiobuttonproperties[i].actionname,nil,[radiobuttons[i].ItemIndex]);
    end;
  end;
end;

end.
