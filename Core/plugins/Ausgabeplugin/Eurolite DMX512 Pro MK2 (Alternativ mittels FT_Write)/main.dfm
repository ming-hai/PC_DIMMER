object mainform: Tmainform
  Left = 726
  Top = 146
  Width = 360
  Height = 328
  Caption = 'Main'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 177
    Height = 13
    Caption = 'Eurolite USB-DMX512 Pro MK2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 144
    Width = 329
    Height = 105
    Caption = ' Gefundenes Interface '
    TabOrder = 0
    object Label15: TLabel
      Left = 8
      Top = 23
      Width = 45
      Height = 13
      Caption = 'Interface:'
    end
    object disconnectedlbl: TLabel
      Left = 64
      Top = 21
      Width = 81
      Height = 16
      AutoSize = False
      Caption = 'Getrennt'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object connectedlbl: TLabel
      Left = 56
      Top = 21
      Width = 81
      Height = 16
      AutoSize = False
      Caption = 'Verbunden'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object LastErrorLbl: TLabel
      Left = 8
      Top = 40
      Width = 313
      Height = 25
      AutoSize = False
      Color = clWhite
      ParentColor = False
      WordWrap = True
    end
    object Button3: TButton
      Left = 8
      Top = 72
      Width = 145
      Height = 25
      Caption = 'Neu verbinden'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 160
      Top = 72
      Width = 161
      Height = 25
      Caption = 'Trennen'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 32
    Width = 329
    Height = 105
    Caption = ' Einstellungen '
    TabOrder = 1
    object Label14: TLabel
      Left = 8
      Top = 19
      Width = 106
      Height = 13
      Caption = 'Verbinde mit Interface:'
    end
    object Label1: TLabel
      Left = 168
      Top = 19
      Width = 69
      Height = 13
      Caption = 'DMX-Out [ms]:'
    end
    object deviceselectionlist: TComboBox
      Left = 7
      Top = 34
      Width = 154
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = deviceselectionlistChange
    end
    object JvSpinEdit1: TJvSpinEdit
      Left = 168
      Top = 34
      Width = 73
      Height = 21
      MaxValue = 5000.000000000000000000
      MinValue = 1.000000000000000000
      Value = 50.000000000000000000
      TabOrder = 1
      OnChange = JvSpinEdit1Change
    end
    object sendalwayscheck: TCheckBox
      Left = 8
      Top = 81
      Width = 169
      Height = 17
      Caption = 'DMX-Out kontinuierlich senden'
      TabOrder = 2
    end
    object autoconnectcheckbox: TCheckBox
      Left = 8
      Top = 64
      Width = 137
      Height = 17
      Caption = 'Automatisch Verbinden'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object GroupBox3: TGroupBox
    Left = 352
    Top = 8
    Width = 361
    Height = 273
    Caption = ' Log-Fenster '
    TabOrder = 2
    Visible = False
    object Memo1: TMemo
      Left = 8
      Top = 16
      Width = 345
      Height = 249
      Lines.Strings = (
        'Eurolite USB-DMX512 Pro MK2 Driver'
        'v1.0, 28.12.2016'
        'Dr.-Ing. Christian N'#246'ding')
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 16
    Top = 256
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 256
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Debuginfos'
    TabOrder = 4
    OnClick = Button2Click
  end
  object DMXTimer: TCHHighResTimer
    OnTimer = DMXTimerTimer
    Interval = 50
    Accuracy = 0
    Enabled = False
    Left = 280
  end
  object SlowTimer: TTimer
    OnTimer = SlowTimerTimer
    Left = 312
  end
end
