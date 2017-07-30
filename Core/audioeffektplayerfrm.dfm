object audioeffektplayerform: Taudioeffektplayerform
  Left = 284
  Top = 143
  Width = 1024
  Height = 614
  Caption = 'Audioeffektplayer'
  Color = clBtnFace
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000000000000130B0000130B000000000000000000000000
    0000000000050000003A00000047000000210000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000001008
    0810683838A79D5A5AF1885252ED291717C20000005300000001000000000000
    0000000000030000002700000032000000130000000000000000000000008744
    4498A55B5BFFB16666FFDC8383FFE08B8BFF362121D100000030000000000000
    001E292929A3515151E13E3E3EDD060606B00000004700000001000000009E52
    52EE914E4EFF8E4D4DFF7C4141FFCD7878FFB67070FF0301016E020202064949
    49CAAEAEAEFFC6C6C6FFC4C4C4FFA3A3A3FF1C1C1CD40000004800000000CD73
    73F2F3A3A3FFF29898FFB06565FF854848FFCE7979FF170B0B711B1C1C618B8B
    8BFFA4A6A6FFB4B7B7FFCBCCCCFFD7D7D7FFAEAEAEFF0A0A0ABB00000019DB7C
    7CA6FFEDEDFFFFC8C8FFE48686FF814545FFAB5F5FFF0E01005A3B3B3BB16F70
    70FF7A6666FF856C6CFFB2B0B0FFD0D1D1FFD9D9D9FF5A5A5AF600000055CA65
    651AE19696CFFAAFAFFFDA7F7FFF924F4FFF965756EF042A3FAF3E4D58F45450
    4FFF806969FF967373FF7D6262FFBDBEBEFFC4C4C4FF9C9C9CFF0505058C0000
    0000C9616110CC6A6A6AB65E5E84A35856C7745D68FA2988D6FF435971FF5754
    50FF898B8BFF7A7C7CFF796666FF898585FFBFBFBFFFAFAFAFFF111111A20000
    0000000000000000000000000000AA605DB54D5B72F55ACEFFFD4E6E76FF4843
    42FFBBBBBBFFA6A7A7FF6E6969FF747070FFB1B2B2FFB3B3B3FF1313139C0000
    000000000000000000004120200AC87674ED2D3B4DB365D6EBF676BAC0FF352F
    2FFF757474FF9B9B9BFF575858FF6D6D6DFF9F9F9FFF8E8E8EFF0A0A0A700000
    00000000000000000000BF626232D38281FF070A0D512C4B62AD72C1E0FF3C67
    79FF363331FF474747FF505050FF686868FF828282FF4A4A4AE60000001D0000
    00000000000000000000713F3F68C27B7BF9210D0C7A7B3532DD3A4050E9074B
    6D5A333637A93D3D3DFF4E4E4EFF595959FF4E4E4EF00E0E0E4D000000000000
    0000000000000000000085545496B87070FCB25656FCB15959FF3C1815A70000
    000000000000343333513636368C3131317D1818182800000000000000000000
    00000000000000000000A56F6FC79F5A5AFFC16060FFB85C5CF01D0F0F370000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000051292914BD8181FC7B4141FF8B4545D74D272741000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000CC676716BA6969B65B2E2E8E2D16161800000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    000087FF00000387000003030000030100000201000080000000E0000000F000
    0000F0010000F4010000F4830000E0EF0000E1FF0000E3FFFFFFE7FFFFFF}
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 322
    Width = 1008
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ResizeStyle = rsLine
  end
  object PanelAudioeffects: TPanel
    Left = 0
    Top = 370
    Width = 1008
    Height = 205
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object Bevel2: TBevel
      Left = 8
      Top = 16
      Width = 2000
      Height = 2
      Shape = bsTopLine
    end
    object Shape2: TShape
      Left = 8
      Top = 0
      Width = 2000
      Height = 17
      Brush.Color = clGradientActiveCaption
      Pen.Style = psClear
    end
    object Label15: TLabel
      Left = 40
      Top = 2
      Width = 73
      Height = 13
      Caption = 'Audioeffekte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object save_eq: TLabel
      Left = 200
      Top = 2
      Width = 90
      Height = 13
      Caption = '>Werte speichern<'
      Transparent = True
      OnClick = save_eqClick
      OnMouseDown = save_eqMouseDown
      OnMouseMove = save_eqMouseMove
      OnMouseLeave = save_eqMouseLeave
    end
    object reset_eq: TLabel
      Left = 328
      Top = 2
      Width = 40
      Height = 13
      Alignment = taCenter
      Caption = '>Reset<'
      Transparent = True
      OnClick = reset_eqClick
      OnMouseDown = reset_eqMouseDown
      OnMouseMove = reset_eqMouseMove
      OnMouseLeave = reset_eqMouseLeave
    end
    object Button1: TButton
      Left = 7
      Top = 1
      Width = 26
      Height = 16
      Hint = 'Blendet den Equalizer ein oder aus'
      Caption = '6'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Webdings'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object GroupBox3: TGroupBox
      Left = 408
      Top = 24
      Width = 193
      Height = 177
      Caption = ' Multiband-Equalizer '
      TabOrder = 1
      object Shape5: TShape
        Left = -616
        Top = -16
        Width = 817
        Height = 17
        Brush.Color = clGradientActiveCaption
        Pen.Style = psClear
      end
      object JvLabel1: TJvLabel
        Left = 8
        Top = 120
        Width = 16
        Height = 29
        Caption = '80 Hz'
        Angle = 90
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel2: TJvLabel
        Left = 24
        Top = 120
        Width = 16
        Height = 35
        Caption = '125 Hz'
        Angle = 90
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel3: TJvLabel
        Left = 40
        Top = 120
        Width = 16
        Height = 35
        Caption = '180 Hz'
        Angle = 90
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel4: TJvLabel
        Left = 56
        Top = 120
        Width = 16
        Height = 35
        Caption = '300 Hz'
        Angle = 90
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel5: TJvLabel
        Left = 120
        Top = 120
        Width = 16
        Height = 41
        Caption = '3000 Hz'
        Angle = 90
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel6: TJvLabel
        Left = 72
        Top = 120
        Width = 16
        Height = 35
        Caption = '600 Hz'
        Angle = 90
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel7: TJvLabel
        Left = 88
        Top = 120
        Width = 16
        Height = 41
        Caption = '1000 Hz'
        Angle = 90
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel8: TJvLabel
        Left = 104
        Top = 120
        Width = 16
        Height = 41
        Caption = '2000 Hz'
        Angle = 90
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel10: TJvLabel
        Left = 136
        Top = 120
        Width = 16
        Height = 41
        Caption = '5000 Hz'
        Angle = 90
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel11: TJvLabel
        Left = 152
        Top = 120
        Width = 16
        Height = 41
        Caption = '8000 Hz'
        Angle = 90
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel12: TJvLabel
        Left = 168
        Top = 120
        Width = 16
        Height = 47
        Caption = '16000 Hz'
        Angle = 90
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object equalizer_progressbar0: TProgressBar
        Left = 8
        Top = 18
        Width = 17
        Height = 100
        Hint = '80 Hz'
        Max = 30
        Orientation = pbVertical
        ParentShowHint = False
        Position = 15
        Smooth = True
        Step = 1
        ShowHint = True
        TabOrder = 0
        OnMouseDown = equalizer_progressbar0MouseDown
        OnMouseMove = equalizer_progressbar0MouseMove
      end
      object equalizer_progressbar1: TProgressBar
        Left = 24
        Top = 18
        Width = 17
        Height = 100
        Hint = '125 Hz'
        Max = 30
        Orientation = pbVertical
        ParentShowHint = False
        Position = 15
        Smooth = True
        Step = 1
        ShowHint = True
        TabOrder = 1
        OnMouseDown = equalizer_progressbar0MouseDown
        OnMouseMove = equalizer_progressbar0MouseMove
      end
      object equalizer_progressbar2: TProgressBar
        Left = 40
        Top = 18
        Width = 17
        Height = 100
        Hint = '180 Hz'
        Max = 30
        Orientation = pbVertical
        ParentShowHint = False
        Position = 15
        Smooth = True
        Step = 1
        ShowHint = True
        TabOrder = 2
        OnMouseDown = equalizer_progressbar0MouseDown
        OnMouseMove = equalizer_progressbar0MouseMove
      end
      object equalizer_progressbar5: TProgressBar
        Left = 88
        Top = 18
        Width = 17
        Height = 100
        Hint = '1000 Hz'
        Max = 30
        Orientation = pbVertical
        ParentShowHint = False
        Position = 15
        Smooth = True
        Step = 1
        ShowHint = True
        TabOrder = 3
        OnMouseDown = equalizer_progressbar0MouseDown
        OnMouseMove = equalizer_progressbar0MouseMove
      end
      object equalizer_progressbar4: TProgressBar
        Left = 72
        Top = 18
        Width = 17
        Height = 100
        Hint = '600 Hz'
        Max = 30
        Orientation = pbVertical
        ParentShowHint = False
        Position = 15
        Smooth = True
        Step = 1
        ShowHint = True
        TabOrder = 4
        OnMouseDown = equalizer_progressbar0MouseDown
        OnMouseMove = equalizer_progressbar0MouseMove
      end
      object equalizer_progressbar3: TProgressBar
        Left = 56
        Top = 18
        Width = 17
        Height = 100
        Hint = '300 Hz'
        Max = 30
        Orientation = pbVertical
        ParentShowHint = False
        Position = 15
        Smooth = True
        Step = 1
        ShowHint = True
        TabOrder = 5
        OnMouseDown = equalizer_progressbar0MouseDown
        OnMouseMove = equalizer_progressbar0MouseMove
      end
      object equalizer_progressbar8: TProgressBar
        Left = 136
        Top = 18
        Width = 17
        Height = 100
        Hint = '5000 Hz'
        Max = 30
        Orientation = pbVertical
        ParentShowHint = False
        Position = 15
        Smooth = True
        Step = 1
        ShowHint = True
        TabOrder = 6
        OnMouseDown = equalizer_progressbar0MouseDown
        OnMouseMove = equalizer_progressbar0MouseMove
      end
      object equalizer_progressbar7: TProgressBar
        Left = 120
        Top = 18
        Width = 17
        Height = 100
        Hint = '3000 Hz'
        Max = 30
        Orientation = pbVertical
        ParentShowHint = False
        Position = 15
        Smooth = True
        Step = 1
        ShowHint = True
        TabOrder = 7
        OnMouseDown = equalizer_progressbar0MouseDown
        OnMouseMove = equalizer_progressbar0MouseMove
      end
      object equalizer_progressbar6: TProgressBar
        Left = 104
        Top = 18
        Width = 17
        Height = 100
        Hint = '2000 Hz'
        Max = 30
        Orientation = pbVertical
        ParentShowHint = False
        Position = 15
        Smooth = True
        Step = 1
        ShowHint = True
        TabOrder = 8
        OnMouseDown = equalizer_progressbar0MouseDown
        OnMouseMove = equalizer_progressbar0MouseMove
      end
      object equalizer_progressbar10: TProgressBar
        Left = 168
        Top = 18
        Width = 17
        Height = 100
        Hint = '16000 Hz'
        Max = 30
        Orientation = pbVertical
        ParentShowHint = False
        Position = 15
        Smooth = True
        Step = 1
        ShowHint = True
        TabOrder = 9
        OnMouseDown = equalizer_progressbar0MouseDown
        OnMouseMove = equalizer_progressbar0MouseMove
      end
      object equalizer_progressbar9: TProgressBar
        Left = 152
        Top = 18
        Width = 17
        Height = 100
        Hint = '8000 Hz'
        Max = 30
        Orientation = pbVertical
        ParentShowHint = False
        Position = 15
        Smooth = True
        Step = 1
        ShowHint = True
        TabOrder = 10
        OnMouseDown = equalizer_progressbar0MouseDown
        OnMouseMove = equalizer_progressbar0MouseMove
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 24
      Width = 393
      Height = 121
      Caption = ' Effekteinstellungen '
      TabOrder = 2
      object Label21: TLabel
        Left = 218
        Top = 96
        Width = 35
        Height = 13
        Caption = 'Reverb'
      end
      object eq_label8: TLabel
        Left = 372
        Top = 96
        Width = 6
        Height = 13
        Caption = '0'
      end
      object eq_label1: TLabel
        Left = 180
        Top = 24
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label13: TLabel
        Left = 24
        Top = 24
        Width = 33
        Height = 13
        Caption = 'Chorus'
      end
      object eq_label2: TLabel
        Left = 180
        Top = 48
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label23: TLabel
        Left = 24
        Top = 48
        Width = 30
        Height = 13
        Caption = 'Comp.'
      end
      object eq_label3: TLabel
        Left = 180
        Top = 72
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label25: TLabel
        Left = 24
        Top = 72
        Width = 30
        Height = 13
        Caption = 'Disort.'
      end
      object eq_label5: TLabel
        Left = 372
        Top = 24
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label27: TLabel
        Left = 218
        Top = 24
        Width = 35
        Height = 13
        Caption = 'Flanger'
      end
      object eq_label6: TLabel
        Left = 372
        Top = 48
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label29: TLabel
        Left = 218
        Top = 48
        Width = 31
        Height = 13
        Caption = 'Gargle'
      end
      object eq_label7: TLabel
        Left = 372
        Top = 72
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label31: TLabel
        Left = 218
        Top = 72
        Width = 35
        Height = 13
        Caption = 'Reverb'
      end
      object eq_label4: TLabel
        Left = 180
        Top = 96
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label33: TLabel
        Left = 24
        Top = 96
        Width = 25
        Height = 13
        Caption = 'Echo'
      end
      object eq_scrollbar8: TScrollBar
        Left = 258
        Top = 94
        Width = 110
        Height = 17
        Max = 20
        PageSize = 0
        TabOrder = 0
        OnChange = eq_scrollbar8Change
      end
      object eq_scrollbar1: TScrollBar
        Left = 64
        Top = 22
        Width = 110
        Height = 17
        Max = 255
        PageSize = 0
        TabOrder = 1
        OnChange = eq_scrollbar8Change
      end
      object eq_scrollbar2: TScrollBar
        Left = 64
        Top = 46
        Width = 110
        Height = 17
        Max = 10
        PageSize = 0
        TabOrder = 2
        OnChange = eq_scrollbar8Change
      end
      object eq_scrollbar3: TScrollBar
        Left = 64
        Top = 70
        Width = 110
        Height = 17
        Max = 30
        PageSize = 0
        TabOrder = 3
        OnChange = eq_scrollbar8Change
      end
      object eq_scrollbar5: TScrollBar
        Left = 258
        Top = 22
        Width = 110
        Height = 17
        Max = 255
        PageSize = 0
        TabOrder = 4
        OnChange = eq_scrollbar8Change
      end
      object eq_scrollbar6: TScrollBar
        Left = 258
        Top = 46
        Width = 110
        Height = 17
        Max = 255
        PageSize = 0
        TabOrder = 5
        OnChange = eq_scrollbar8Change
      end
      object eq_scrollbar7: TScrollBar
        Left = 258
        Top = 70
        Width = 110
        Height = 17
        Max = 255
        PageSize = 0
        TabOrder = 6
        OnChange = eq_scrollbar8Change
      end
      object eq_scrollbar4: TScrollBar
        Left = 64
        Top = 94
        Width = 110
        Height = 17
        Max = 127
        PageSize = 0
        TabOrder = 7
        OnChange = eq_scrollbar8Change
      end
      object eq_check1: TCheckBox
        Left = 8
        Top = 22
        Width = 15
        Height = 17
        TabOrder = 8
        OnMouseUp = eq_check1MouseUp
      end
      object eq_check2: TCheckBox
        Left = 8
        Top = 46
        Width = 15
        Height = 17
        TabOrder = 9
        OnMouseUp = eq_check1MouseUp
      end
      object eq_check3: TCheckBox
        Left = 8
        Top = 70
        Width = 15
        Height = 17
        TabOrder = 10
        OnMouseUp = eq_check1MouseUp
      end
      object eq_check4: TCheckBox
        Left = 8
        Top = 94
        Width = 15
        Height = 17
        TabOrder = 11
        OnMouseUp = eq_check1MouseUp
      end
      object eq_check5: TCheckBox
        Left = 202
        Top = 22
        Width = 15
        Height = 17
        TabOrder = 12
        OnMouseUp = eq_check1MouseUp
      end
      object eq_check6: TCheckBox
        Left = 202
        Top = 46
        Width = 15
        Height = 17
        TabOrder = 13
        OnMouseUp = eq_check1MouseUp
      end
      object eq_check7: TCheckBox
        Left = 202
        Top = 70
        Width = 15
        Height = 17
        TabOrder = 14
        OnMouseUp = eq_check1MouseUp
      end
      object eq_check8: TCheckBox
        Left = 202
        Top = 94
        Width = 15
        Height = 17
        TabOrder = 15
        OnMouseUp = eq_check1MouseUp
      end
    end
  end
  object PanelLighteffects: TPanel
    Left = 0
    Top = 370
    Width = 1008
    Height = 205
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object PanelControl: TPanel
      Left = 0
      Top = 0
      Width = 1008
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Shape1: TShape
        Left = 8
        Top = 0
        Width = 2000
        Height = 17
        Brush.Color = clGradientActiveCaption
        Pen.Style = psClear
      end
      object Bevel1: TBevel
        Left = 8
        Top = 16
        Width = 2000
        Height = 2
        Shape = bsTopLine
      end
      object Label1: TLabel
        Left = 40
        Top = 2
        Width = 110
        Height = 13
        Caption = 'Effekteinstellungen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Button2: TButton
        Left = 7
        Top = 1
        Width = 26
        Height = 16
        Hint = 'Blendet den Equalizer ein oder aus'
        Caption = '6'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Webdings'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 25
      Width = 105
      Height = 180
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object OpenEffektliste: TSpeedButton
        Left = 8
        Top = 160
        Width = 41
        Height = 25
        Hint = #214'ffnet eine Effektliste'
        Enabled = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCD0D0D0D0D0D0D0D0D0D0D0D0D0
          D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0DCDCDCFFFFFFFFFFFFFFFFFFC4C4C4
          8888887070707070707070707070707070707070707070707070707070707070
          70888888C4C4C4FFFFFFDCDCDC0C72A50C72A50C72A50C72A50C72A50C72A50C
          72A50C72A50C72A50C72A50C72A50C72A5646464888888DCDCDC189AC61B9CC7
          9CFFFF6BD7FF6BD7FF6BD7FF6BD7FF6BD7FF6BD7FF6BD7FF6BD7FF6BD7FF2899
          BF0C72A5707070D0D0D0189AC6199AC679E4F09CFFFF7BE3FF7BE3FF7BE3FF7B
          E3FF7BE3FF7BE3FF7BE3FF7BDFFF42B2DE197A9D646464B8B8B8189AC625A2CF
          3FB8D79CFFFF84EBFF84EBFF84EBFF84EBFF84EBFF84EBFF84EBFF84E7FF42BA
          EF189AC6646464888888189AC642B3E220A0C9A5FFFF94F7FF94F7FF94F7FF94
          F7FF94F7FF94F7FF94F7FF94F7FF52BEE75BBCCE0C72A5707070189AC66FD5FD
          189AC689F0F79CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF5AC7
          FF96F9FB187A9B707070189AC684D7FF189AC66BBFDAFFFFFFFFFFFFF7FBFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF84E7FFFFFFFF187DA1888888189AC684EBFF
          4FC1E2189AC6189AC6189AC6189AC6189AC6189AC6189AC6189AC6189AC6189A
          C6189AC61889B1C4C4C4189AC69CF3FF8CF3FF8CF3FF8CF3FF8CF3FF8CF3FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF189AC6197A9DC4C4C4FFFFFF189AC6FFFFFF
          9CFFFF9CFFFF9CFFFF9CFFFFFFFFFF189AC6189AC6189AC6189AC6189AC6189A
          C6DCDCDCFFFFFFFFFFFFFFFFFF21A2CEFFFFFFFFFFFFFFFFFFFFFFFF189AC6C4
          C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          21A2CE21A2CE21A2CE21A2CEDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = OpenEffektlisteClick
      end
      object SaveEffektliste: TSpeedButton
        Left = 56
        Top = 160
        Width = 41
        Height = 25
        Hint = 'Speichert die aktuellen Effekte'
        Enabled = False
        Glyph.Data = {
          9E020000424D9E0200000000000036000000280000000E0000000E0000000100
          1800000000006802000000000000000000000000000000000000E4BBBEC06860
          B05850A05050A05050A050509048509048409048408040408038408038407038
          407038300000D06870F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8
          C0505050A04030A04030A038307038400000D07070FF98A0F08880E080807058
          50404030907870F0E0E0F0E8E0908070A04030A04040A040308038400000D078
          70FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B0
          4840A040408040400000D07880FFA8B0FFA0A0F0909070585070585070585070
          5850706050806860C05850B05050B048408040400000E08080FFB0B0FFB0B0FF
          A0A0F09090F08880E08080E07880D07070D06870C06060C05850B05050904840
          0000E08890FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020
          A03810C06060C058509048400000E09090FFC0C0D06860FFFFFFFFFFFFFFF8F0
          F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A03810C060609048500000E098A0FFC0C0
          D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A04020D068
          60A050500000F0A0A0FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0
          F0F0E8E0F0D8D0B04830D07070A050500000F0A8A0FFC0C0E08080FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B05030E07880A050500000F0B0
          B0FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C0
          5040603030B058500000F0B0B0FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF8F0C05850B05860B058600000F0B8B0F0B8B0F0B0B0F0
          B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D07880D07870D07070
          0000}
        ParentShowHint = False
        ShowHint = True
        OnClick = SaveEffektlisteClick
      end
      object Button18: TPngBitBtn
        Left = 8
        Top = 32
        Width = 41
        Height = 25
        Hint = 'Objekte (Szenen, Befehle, etc.) an aktuelle Position setzen'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnMouseUp = Button18MouseUp
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C1800000A4D694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
          F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
          561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
          7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
          1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
          01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
          C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
          00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
          00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
          CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
          4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
          48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
          223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
          560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
          2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
          FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
          F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
          4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
          79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
          812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
          0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
          170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
          48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
          90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
          5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
          5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
          8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
          272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
          48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
          6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
          A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
          2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
          1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
          192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
          3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
          09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
          46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
          EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
          4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
          EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
          79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
          3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
          67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
          6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
          A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
          5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
          D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
          743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
          4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
          D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
          C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
          3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
          FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
          0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
          15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
          476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
          BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
          F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
          A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
          6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
          68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
          949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
          F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
          DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
          772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
          A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
          955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
          EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
          CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
          26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
          8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
          B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
          7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
          EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
          E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
          5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
          EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
          EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
          FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
          CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
          ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
          CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
          F73EE77CFEFC2FF784F3FB25D29F33000003274944415478DA6D935968135114
          86FF3B4B1A634AD5D616F2D2A0B8A33E29484470412B2AB850438D4B9AB45690
          56507C51D117517C7079758B7569B4011545ACB5757B28058B50B56A8A46E3D2
          566ADACEE024997DBC33B53EA8776038C39CFFBBE7FCE75E8213F87BC566F8FC
          C102CE0D5816886A22DDFF0567175DC18605EB9B65438EF00C0F9EE5219B32C8
          3F000B4D67EB0E6C717B541A027943C2E95B0904DE6CC291C8C138C331A1CFE2
          67BC1A7C856820FA5FC0B593E1FA90C27F052104239284C6960EAC7ABF19C777
          1D6D1A5686B756C42B10F00790D891F82FE0E2C970434473F5DB31C47C16B1FB
          CF50F97127766FAF8B55DDA98A76F776A366590DCE07CF3B80184D7481868EC2
          42E054F51EBFE6EA83AE1B905419575B3AE14DF9C095B1E99EF4EB0EC840EDE2
          5A9C0B9E53C98C2B7E6BEFBA2A488A041B623F9E711C7EC81F6C0FA1EA2A58AD
          0896E9866E68287479F1ACF70986DA26E272D5259079D76766F76D5CEBE9933E
          80219C5387AA6B300D0BA669C2300CA732C33428C4A4B189F6B7EF20DE2E422C
          782147E6C6470103D914CD631C914E456362DB486BECFB37E0D1BB247EDE9D30
          0A98DF382DBB6BF372CFA7A114585A81BD58FB65D26668398AAA21A7C9605802
          937AC2720C3A532988377F5750700CD9F2F2628F20E51D014F5C88AEA880C989
          746713829CC3A3AE5E08991C7446775A94350DA5C929680C5ECA91E62709ABF5
          611B744DC738C68D16B4225CB7043AFBCD6929AB2B88DFEB42D9D35998E39B0D
          CFF8026AAE89499E09D8B67E1B882229B181EF032E8D527D5E1FC28FAB03E50B
          2D3F57304C4D0305C848B4BEC0D264250E86F7A70B271576D8DEB03C8BE2C9C5
          2A114511838383F0725E74F675A2E141C3C59DD52B233992A6000B7953C78D96
          2EACF91AC2E1BA4331C550A2169D2FC771282D2D850318C98CA0FD633B6A6ED7
          D019E2DAAACAE9A121EDA773AE589EA0A7A71F9B0676E048EDE126D552B7DA00
          9EE747018220401C1671E6F9190879C126377577BFDC220822188671A6621BB7
          BAAC02F5E1FAB86119211B60FF2B29290191E865D1751D45EE228071B263C9D7
          C9602693F903B0CF80B7D88BA9D3A736D3B62263D7866559FC025B8499EFA294
          246B0000000049454E44AE426082}
        PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
      end
      object DeleteEffekt: TPngBitBtn
        Left = 56
        Top = 32
        Width = 41
        Height = 25
        Hint = 'Aktuellen Effekt l'#246'schen'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = DeleteEffektClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C1800000A4D694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
          F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
          561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
          7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
          1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
          01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
          C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
          00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
          00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
          CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
          4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
          48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
          223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
          560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
          2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
          FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
          F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
          4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
          79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
          812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
          0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
          170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
          48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
          90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
          5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
          5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
          8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
          272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
          48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
          6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
          A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
          2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
          1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
          192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
          3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
          09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
          46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
          EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
          4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
          EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
          79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
          3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
          67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
          6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
          A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
          5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
          D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
          743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
          4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
          D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
          C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
          3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
          FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
          0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
          15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
          476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
          BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
          F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
          A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
          6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
          68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
          949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
          F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
          DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
          772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
          A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
          955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
          EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
          CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
          26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
          8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
          B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
          7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
          EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
          E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
          5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
          EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
          EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
          FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
          CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
          ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
          CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
          F73EE77CFEFC2FF784F3FB25D29F330000036C4944415478DA3D937B48537114
          C7CFD5B9EB63BB9BF381A54DC3425BD9B287EB45F6CE4AC34A2B2A88B082A2AC
          88E89D96947F48644552D2C32C354BC7CCD7AC45C54CAD253A89D2349D577CCE
          59D9DCD6D6B2F3B36B173E7FDCF3E27BCFF95E0A0028C4B532EF8CC26DC45E26
          9C20C955C49D4AC59883E337FC7B5C6A9FA6CDB5DB1D2ED13B2E36E0BB9330D6
          8CD065D7926B6A72D4F29931515DDBD21F2DC7D8086241ECAFF2CECFE69BCC37
          8DEF9AE55E220130D111E98AADE73231672503F8AA7B2762D92A5D7153492D84
          2D980EF4D28894E494FB4ACC7DCFBF7A285C6C3016B5ABEA44BFBA8740286120
          72FF7A78D86688B99E57D5440678DCBCB47729EF335BD1F0E40D3062212892D6
          0E6C4ECFDD9994B88C4E904ECCFB92FF86710CFC00069BA50B6540AD92BF6C68
          EB529FCC2C2C2503BC103F55C68122DD8D923923DD2608899C0A4ED9A48A403E
          1D36F4521F6A658D20F6F786E0B828EBE3C1C1823BCAD71FB0A70B61FF0F4839
          9290106A3467B43CAB03B73F0042B1005CED4E18FD6101C6470493E317D8323E
          363FA9D4EA3BB0BE0FE91C1FE081481069F6E57D475D5EE813FB6A9BC1C5E600
          1A0F44064963A36C991D9D4AF5DB2616EB064923A7A0776C89881099804CC94E
          DA906A51BD973B4D3F31418177901FB4CC0FD5A51569B498EFE79A594EC5B7F1
          331215BE91B29088B30AF9DD9EE21A3F6AD83A3640800A02D6CFB35F61D9FC72
          6D630DD6B573034CE4D41467241AF17E7D25B9C470E7F93C4B6B2FD03C1ED0AE
          AEE0E67082C087019F15725BBB6C62E9F6D3593738F943888D34BBA51D490C58
          3E25F8962147B36EB8C9009E9EEE208E08B15BBD688BA47348ECF8DA07EE2436
          2318F88BA6B599C302CACD165BDDAA8319955443497AB249FBE9588FBA5E6A69
          EBC30B8C4210DEBA5E16507FAD506328D897B08CAFD2497EB7620EC57AF83220
          59390B6C717394E15B4F1EA5B4E7F68CB63CD0801D5DC6C7F3F94E0D047AFB92
          AEB5A9B7CB89D703FDBD79C587776CF4ACD4FB3B3E7703EDE50EA29DD196B8A7
          E5BB1B5BD9664A5770A1B027BB6ACB70630708D06941898B7FC5DF53E6740F7C
          234B1A26FF02F9CCDBA776AD5E43338B1C02DA7656ADCD29D4BCABC3B881EC40
          5E9675FCBC747064533F8F325CADA8AEAEA8D67FC5F80062243FCCF8921111C2
          43CCC403E3469A4E4C84047145C06DB897BBBB95F38A88CBD39C2AA2B0FF2F7F
          435DF5691DE66C0000000049454E44AE426082}
        PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
      end
      object Effektnachlinks: TPngBitBtn
        Left = 8
        Top = 128
        Width = 41
        Height = 25
        Hint = 'Aktueller Effekt nach links'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnMouseUp = EffektnachlinksMouseUp
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000002B744558744372656174696F6E2054696D65004D6F20323420466562
          20323030332031373A35353A3438202B30313030412589560000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000002CB4944415478DAA5935D48536118C79FE3CE8E6ED32DBFE6C7C83237AB
          1B9D53924D533318DEA8E574155D94691662A0175D48179544815117DA17611F
          6022983A4C134C82889A59AE657ECC4FB4D44DE79AC79DF931B79DD3990E75E8
          4DF45E3EBFFFF3E3E5799F1781FF3CC8AED5D8BAEAB81876BE76D07E1734CA9B
          1E4C5C5B75F8204BA9EB9DBD0543250F760A629B2E28B2436B4AF32548718566
          A9EF45B2EF2693B4142AB3F94F4BCF8991B365ADB3132A6598A740D2121B11E9
          545F294C64E3AB24D4354FD9276B65D83A8B51C5ED8B86CF258547588BAB00CF
          9EAB71C39B3CFF2D416A1717A3C67B8A8A6422C3E21AAC0006DD9FE6EC7FEAA5
          18C83A781866EAB9542015BA988D81C1C7B6EFF8E2DBDC6D02697363AE52A458
          20313058EC604130300E989C6BAF654C486A6ACA531E3A893B50D01334A3E8CC
          B77E8BA33D8787B89BCBD2E4FBEF7B07724167B481DE4A8183E90D30F6CB097A
          53F9B18CE84ACCCD66080A9C980F806E9080B62CEEBA2028B7753E4B111FD435
          4EC0E802090E8401C06601F4EBC870A66D499E1DEFD74DB361330924C3C5D800
          7DFD04A8323604EC4CD56886522AFC3AB104D3045DC0507768800CB02D98D272
          A47C35CD66AD3463BA59AF968006F98600E4EFD343A238EF5051246306B703A0
          EED0C09013268DA723C48206BB200C31581C5B4C430BEA53B95B4354745C0F8E
          397063DE277063BF5CA191DF24548B5038D159C58F179518512E80979B697AAC
          F032C96FDB1E505E70A6BDD3577A34DD4AD10364D1CF3F364A41652D0A790AA6
          176256B353122556A7EB0634EBD62C434D02C77391CEEBC250D4AADD733C21C4
          BC06400E4F5270BB91EEB84A42C1B010632E6B3829622E4E33EA8B76199E4838
          3B57F9F2B49C1F4EB64725EF65FCF860B2AC5404F33659D1D4298110AD172484
          223F55BD73ABD5E2D0DD3FD3C5A1723F9EB3985861DF8187918F3CD9C8BD007F
          47BE598F5F8357B2C7BB0BFEE1FC05ECB41E20B6B25B2B0000000049454E44AE
          426082}
        PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
      end
      object Effektnachrechts: TPngBitBtn
        Left = 56
        Top = 128
        Width = 41
        Height = 25
        Hint = 'Aktueller Effekt nach rechts'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnMouseUp = EffektnachrechtsMouseUp
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000002B744558744372656174696F6E2054696D65004D6F20323420466562
          20323030332031373A35353A3438202B30313030412589560000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000002C24944415478DAA5935B4853711CC7BF73478FDB9C7899A5162BC3CB54
          5CDE12CA4CA1876E5E53D0B20B683E296145644860BDF950D143118646F8105E
          23A41BA989A1C3BC5F4BECB29C4B72BAE5B633CEE6D9399D6DB8127DF30FE7BC
          7CBEE7F3FBFDFE9C9F00DB3C02E73BE6E18DB8FD3B6F4D4E5B9F63A2B86C4322
          A9E972D45E54CFCED97976B6724B41E2B936DDFDAA0C596DE314F7FABDBE0223
          798FD60329657D4B77AFC404DD7E32C675F6182E61F474C32681A2A0C578A130
          5EBA4271686C9FB42EE9C834A832071D4C59F2D178E654A8544FD9D1D03C6659
          59240F6138677C83604F6E93F1E831A55463A061B10BA1EA9C52B3845F12BA4E
          EAC38BDF19D3D3E452AD9E8699F1407FD7F41C2B084B46CF41A35B1092DD6A8E
          4E554834CB34566880B2B1B0CE4EBC424F69D6EEA2669322215632CF03831530
          5AECB07E5D6AC387AC02B72020A78D9229A3C4EA652B6C9C07407AF1963FC0B7
          CFD58101BED5B2981827B3727CDC8B67260AF8A9BB86EECC7B4E8124F7252508
          8F109BAD764028743D6231303363923234C145868BCC7C6578120041B8D8D4E4
          2ADA4FF839055E791D1413A110B32CE7FAD8514524020607174830016BFF3387
          402201868716D1763CD42910E6BFA1ECD1B162707CC8D313F0F606D41A165A5D
          2621462B1311E962EB9DCD6B396857F3F1F2F00BA78028EAB430714A1158B8E6
          379BF8F67FD4A2F5481551326E61C24244E0589798E2E79F563F406B6AA5FB12
          C9F3BDF45A7C02E9E812045F45A5EAC3AA32036F8318B27C8E5EDB17FC8FF57F
          1A42804F2A1E27DBDC029F32152D4839409A583E3030BC02625702EA42340EE6
          7B759EB62B82498AE3471B195D05ED9F886761DF37FC487EE503BFE5D9293B66
          7A175846C7E5A24EDEB11E08BCF94B179C1E229BEDD7728C962D44BDBC65F332
          1574978A43FD6B2C66AF7A34C4D66CD8968B5F2A7C026D77CC06413D9EC65DDF
          7A1BB771FE028D3729201793F7D40000000049454E44AE426082}
        PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
      end
      object EditEffekt: TPngBitBtn
        Left = 8
        Top = 64
        Width = 41
        Height = 25
        Hint = 'Aktuellen Effekt bearbeiten'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = EditEffektClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
          0D000000097048597300000B1300000B1301009A9C1800000A4D694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
          F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
          561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
          7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
          1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
          01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
          C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
          00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
          00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
          CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
          4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
          48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
          223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
          560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
          2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
          FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
          F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
          4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
          79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
          812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
          0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
          170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
          48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
          90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
          5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
          5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
          8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
          272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
          48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
          6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
          A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
          2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
          1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
          192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
          3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
          09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
          46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
          EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
          4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
          EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
          79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
          3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
          67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
          6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
          A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
          5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
          D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
          743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
          4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
          D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
          C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
          3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
          FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
          0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
          15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
          476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
          BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
          F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
          A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
          6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
          68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
          949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
          F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
          DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
          772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
          A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
          955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
          EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
          CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
          26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
          8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
          B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
          7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
          EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
          E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
          5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
          EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
          EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
          FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
          CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
          ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
          CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
          F73EE77CFEFC2FF784F3FB25D29F33000003D34944415478DA9D945F4C5B551C
          C7BFBD6D29941570A44B18A0C6B031373675CB32126388F1612F9BC6902D8A9A
          ED618B2FEEC1C4640F4BF47526CE98F9A2C13F9B6E86CD88A0FCEBB003D7AD94
          D1155A0A050A85FEA1957FB5BDEDED6D7BFF1CCFEDCA5081613CC937B927E7FC
          3EF7F7EFFC5422BF80B5A50224013217C7468B9E2223033CD4283194E2D78E9F
          8C4762CB1F18ADFD27679F3DDC7EEED6E025D5FF010A5A3DC6DCEE7AA7E9F3D6
          43CF3015D541193BC3325A0C55DF6F028CD12FC59CE431ABA7745FA087C56E7F
          DEF2F397371B2AB85DFAA72A52F16D6505FB5C494DEF04EF5C0F9445487C0AD9
          6C866E356B50950A1AEAD97DFB50FD40C7C7E683FBB6EBAB7794A2AA6A076C61
          5EE416B5990B974C5DFF023E5CB22022C3FAA12BDF0D29EE075221D00D488141
          B5307AB9D730D7F2CA34578D65C341D41DD98DF1B110AEDE08DB6FFCD8D5B909
          508090083C04C66640127E3085256A71E9EB1F8AC296934A222583848EC073C8
          16D4CA2DADBE91D63693859A9AB706520F8313B6A24AE3488B36D4F32A381128
          96A13ED4806BD7A77167B866B2F9DB9BBF51B37E2ADB638185C63A84C6AD7AA3
          EA5AAB2E663D4A9214A61380FDC7E1F1498977DFB73BAD36A7839A58A906A8C2
          9B0393F360534C6959F6ABF602CED200360D42A80E34613AC871C74E74F4CFF8
          82767A7D906A944A01091B036506D1B941633177E517FD13A17A124B026C0C64
          FF3BF00692A9C6B73BEF78267CF7F2618E51B15452AE4FD601191D124BC14A4D
          F8A31E7D255B47E209A82221C807DE82D797E01B4F99149812621F952B0F238F
          1A4FE0FF58EB42460B6E79EE69ADFFC3DEC21AA686704910AF8786F91A2667D3
          E9A6B30316977B4AF1EC763ECCF8DF613906BBF0609586E84ABCB47CF1F250F1
          5ED52E221290D17B90F7BE44C3D4644FBDE7B2D81DE38A67662AA7021B1EEA23
          2F1C7EF99FCF33B3E8CBFD83A875C804CC1775D1FEF3AA2733D086CC10ABF760
          22A213CF5D58B1FE6EB1DFCDC386A962726689385D6EAC030A6C90E64D0D3EB6
          50AB9DFC86BE4551C78B1204830BA1B45A3C7F51B2F5DEB6AD86A984F327CDBB
          CC300C360466D979687585C8B8AFF730D1D1A329F536B8223C3C8B1CD7D63DE3
          E8BE65B5E6ABA9C0561458AE769B0157E667E01A71BCB833D67EB76C7B092C61
          92310FC566AF7ED7F62095E2C7E99DFBF96AAE88E98804C2E0B1C0807F8E79BD
          F184436003B56FBE717CF28B2BDD33FEC0BC375F4537159D0E4888E9B0949B3A
          5B013FFBF49333CDCDCD4D8224F74D4D79957915CA37EBACE295D2FDD433F268
          8C6D053C7BE6F4B1CE2E131B0E47CA958453D1B263892A9D8C7A48919E8EADDC
          23F86FC0BF004AAE3D5317D0D0E10000000049454E44AE426082}
        PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
      end
      object CopyEffektBtn: TPngBitBtn
        Left = 56
        Top = 64
        Width = 41
        Height = 25
        Hint = 'Kopiert markierten Effekt an aktuelle Stelle'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = CopyEffektBtnClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C1800000A4D694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
          F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
          561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
          7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
          1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
          01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
          C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
          00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
          00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
          CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
          4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
          48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
          223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
          560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
          2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
          FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
          F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
          4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
          79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
          812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
          0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
          170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
          48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
          90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
          5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
          5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
          8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
          272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
          48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
          6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
          A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
          2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
          1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
          192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
          3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
          09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
          46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
          EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
          4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
          EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
          79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
          3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
          67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
          6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
          A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
          5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
          D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
          743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
          4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
          D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
          C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
          3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
          FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
          0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
          15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
          476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
          BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
          F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
          A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
          6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
          68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
          949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
          F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
          DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
          772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
          A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
          955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
          EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
          CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
          26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
          8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
          B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
          7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
          EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
          E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
          5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
          EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
          EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
          FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
          CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
          ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
          CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
          F73EE77CFEFC2FF784F3FB25D29F33000002CD4944415478DA7D92DB4B147114
          C7BF333B7BF53244BAA6695E326FBB626897BF20E8A12B148194469B8112A495
          05922895BD4B0F52F8A221111A7843301545656C5732A8C4B64D4DADBCE4EE4E
          AE1B8EB3B3DB6F675D73223A302FE79CF9FC3EBFF33B54201040630B37176D34
          EEF64B920F24289AA62949C4E347957747477B1AB0153131F1585B7361735308
          A74005016DFD763EE56026EBDBDC4A52802408083857505176A57CDCD65FFF5F
          C0CB3E3B9F96F70740AB000622B2E2D4B04DCCE1D6754BF9B875A0DE684C84DB
          FD03A2F817A09D1864E4138018FAD9B9E8827B79191EE72268460DDEFD4B1819
          EC699144B1A3ADB5A1133B4206740F7EE2D3CD19ACD7E3855AA3C6F4E46730BB
          E260888E06027EA818150C110C961D8EC0C33BA51536DB40BD02D03BE2E0F726
          27B04BF34B60D40C569656B127C7049D4107529663539490142DC1EBFC094BF1
          A572EBEBDEFA6D40DFB09DCF2DC864BDEB023160F0F1C33422E2126188346C03
          82C16C2C6363DD8DE9591E75F76E944D4EDA1A65C010E7E053D2E2D985B92568
          08E0FB372792CC2644B13A0560E1CB1C1666A7A1D3E8F0BCF1C950776773850C
          18E6ECFCA12399ACC723C880F7EF661015170FE78A133ED1479E959201C15E95
          8A466A462A2A2C4563DD9DCF6ECA00EBB8834FDF9FC0CECC840C16BEAE223DCF
          04AD4605BFDFBF73E63240A767505258C46D03DE4CCCF205F9A96CB86DE2ED0C
          22626389818BBCB9D2404D867C202B1996C262AEABA339043871F2E25342CE23
          3D3E41D8F099CD8753AB6A2B9324B2CE4A03B227340DBD5E8DC273455C57D880
          9CA025B5B0017FEA7451DD8BD6A6DB5353F3646D9506C12B6667EFC385F3C55C
          67D820DC100C93F9284ACBAA6BAF5D3D5E4351F43F0D1886C299B397B98EF626
          25202D2D0796926AE8749AAA5C53529D56AB964F55AC2E151CA416F71FD48CBD
          EA6D5502F4FA085264E0F3893182201E23A948F229154210154D075CA4CFFA1B
          3DE167F5829F82920000000049454E44AE426082}
        PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
      end
      object RefreshEffect: TPngBitBtn
        Left = 8
        Top = 96
        Width = 41
        Height = 25
        Hint = 'Aktualisiert aktuellen Effekt mit aktueller Szene'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = RefreshEffectClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C1800000A4D694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
          F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
          561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
          7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
          1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
          01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
          C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
          00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
          00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
          CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
          4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
          48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
          223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
          560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
          2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
          FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
          F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
          4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
          79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
          812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
          0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
          170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
          48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
          90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
          5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
          5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
          8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
          272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
          48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
          6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
          A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
          2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
          1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
          192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
          3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
          09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
          46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
          EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
          4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
          EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
          79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
          3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
          67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
          6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
          A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
          5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
          D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
          743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
          4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
          D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
          C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
          3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
          FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
          0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
          15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
          476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
          BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
          F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
          A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
          6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
          68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
          949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
          F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
          DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
          772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
          A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
          955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
          EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
          CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
          26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
          8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
          B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
          7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
          EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
          E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
          5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
          EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
          EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
          FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
          CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
          ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
          CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
          F73EE77CFEFC2FF784F3FB25D29F330000030E4944415478DAA5936948545114
          C7CF2CEA684E6E64E35A1AE807254DD30A4BD2D24493101BC1987021430D0A54
          A414D45034CAADB294D0524B437229272DC11D9951B32CF72571DFB537E3369B
          E374DE300A467DEAC21FDEBDF79CDFD9EEA328140AF89F452101140A65DF617A
          DD6474ED98C4777C5E6CC1504864660CD18CA7F146714CA877255E6FA0B6FF09
          88A85ACAE38E6B5D39A8C160E96AD340531DC0810550C5E52F791B8CBE7E121F
          9489664BBB907D80FCB685908456619A977A6FE3FA480748F5ACAC86E876C7EC
          9D9C742DF5002A2A1A56EC574A13647677BCB74414ADBAA4E39C7D80C8E2E1BC
          89F27B75B5D595BAAA08627650A4F3B0C975CEA58BA75906DA000F32ABE1518C
          2FE4167E1EFF96E31DF56709FAA8236466AA3445286644CADB38A6A35F98F921
          0DA0D30058884F4B295AE82808CED8034CCC2C1C0864FBEDF0F97C0D749290D1
          518AB6CE1ED67BDE420C8F3088BE79D501A83B003A3A0019894FE75B8B6E672B
          0125BCD9C0922151085D2E958B404B8B2EDFD956C3EEBB33FAB30736CD025C3C
          4F859862FA749CF8360276A800597793C73EBD49C851026E15F5E5C6FBDB864F
          10006B52CC1D638FE1F7604B653D739657293C7CC17F95109B4B65526D506C50
          65323ACD50D0DA5B53FEB24809F07BD6CDBDCF3E71B977114026C7F46A7AC072
          AAAAE77B5D61D3D4E4442B96224419A30CE8B8984CA61A4110BF70DFAB0478A5
          7F6D8C653BBA4D625431023A475661B5F1F10F6E7E72211A35A166516A28B23F
          545593C929AD29012EA9DD5F7CCED99DCCAAEE8038F61998DB04F850D3B266BF
          5CF6E25D71EE73349C261D46A70566A52D8B21891CEB2CDC4B492901E71F0EF0
          34A5738CE58F49538453A2BB9B8F07734B06D0DED44E9CD55B6CB631D2AC1782
          BEE9AB66C18D5047223B352A80AB820A76C768821B67942E273CD6BA9DE11366
          E3EAAA2FC1AE6F629C550100313343B82AF85D65A901A5683782EADB2B01019A
          A4B3AA362AFB5AB087D0D03D6A50646221011ACD4C31BF7E54DE3F585190D280
          F783A8AEDDB2FEF637E25B037CF96085B24519A9CEC849FC243BAF6A2AF9D8E0
          37E5276E8B9054F2B10000000049454E44AE426082}
        PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
      end
      object seteffecttoactualpositionbtn: TPngBitBtn
        Left = 56
        Top = 96
        Width = 41
        Height = 25
        Hint = 'Setzt den folgenden Effekt auf aktuelle Position'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = seteffecttoactualpositionbtnClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000AF000000AF00142AC349800000A4D694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
          F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
          561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
          7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
          1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
          01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
          C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
          00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
          00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
          CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
          4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
          48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
          223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
          560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
          2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
          FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
          F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
          4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
          79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
          812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
          0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
          170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
          48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
          90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
          5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
          5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
          8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
          272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
          48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
          6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
          A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
          2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
          1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
          192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
          3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
          09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
          46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
          EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
          4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
          EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
          79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
          3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
          67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
          6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
          A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
          5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
          D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
          743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
          4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
          D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
          C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
          3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
          FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
          0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
          15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
          476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
          BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
          F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
          A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
          6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
          68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
          949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
          F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
          DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
          772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
          A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
          955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
          EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
          CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
          26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
          8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
          B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
          7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
          EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
          E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
          5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
          EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
          EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
          FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
          CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
          ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
          CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
          F73EE77CFEFC2FF784F3FB25D29F33000003294944415478DA6DD35D48536118
          07F0FFD9CE8ECDE5E6D6DC5CA5464A691F5690508B4843A84008BAA8C8A8E8AE
          DB22BAA88B825229D234AA9BD6A2657E31A98C0C8C747DE0DACC6A9B6D8544CC
          B599ED4BE7D9DC713BA7D7C08B433D570F9CF7F99D87F77D1E4A10042C84CBE5
          C2622E914816F26BA15068EFD8D8183C1E8F2B1C0E1FAFAEAECE9080D7EB85D9
          6CFE7B965A2CB2D96C588C6C360B954AF58AE7F91AB7DB0D87C3E10F040265B5
          B5B5F31CC7FD1FE8EEEE864C26FB9BB32C8B783C7E5AAD565FF1F97C4C7F7FFF
          8DAAAAAA3346A351EBF7FBE9F1F1F1C97F809E9E1E300C838516C99FF725D9D9
          A30683E1402C1665ECC3F68E027D616F7979C5B148245C6AB7DB4F984CA60FFF
          0052A9343F2F2FEFA65EAFAFA7972CA57E4762E0291AF21C19FCBE8F48A6E630
          158962C4E96C261D9F11015D5D5DB456ABBD5F5C54529F2477A054AA2150124C
          04A3E0D44548444210263EE3F5D0CB1F81E0E44EABD51A1001168BE5D0A64D95
          9DF3B412EBCA8A20676884E21C660409DC5E1F861D5E186BF621E17C343F3068
          3BD8DEDEFE5804F43D7DD2A7D217D51597AE81264F41BE50E06890622F4C376E
          63E791B3A094C5D04C8FE285A5E5E95DB365BF0878DEF738245FB1B1B0A4580F
          A96C29E6327318793B04ABC58CAABA93A8A8D9839F4116B952165F3B2E059B5A
          6EAD1001BDDD1D71C5EAED2A5DA1165902FC9A0C61C0D480049B46CDA926A473
          34E41239D0421C139D17630D2DB73522A0FDC13D977CE5E68D89250668740630
          B480AF9F1C984D6550B8CE88684A80844A63193F85C1B6D39FEE7758B78880E6
          E6EB4D6BCBD79FFBA1D8025A26875CA1808491229901A22C20038B242D47C978
          2FCC775A1B066D6FCE8B80C6C6C6329D466553AEAA5CFE2D772BE6D249F2FE0C
          78F20A59B21B192A838AEC77BC365F0DBCFFFC65D7C7D1D1EF22A0ADAD0DE170
          A4AE40AD78A82FDDAC8A2EABC43448173229143C0B65C48D91678F6243C32347
          C9C83F773A9DE2516E6D6D45229100599A6DB98CF4824E57B023275799CF65E6
          9188FE8E7DF178DE4DFC8A5E1604FEFDC2B69205FB3F100C06A9E99999DD3C97
          3AAC94331BD2690EC1A9883B3E9BEA248583D96C46A0C88C2C027F007894AFF0
          D4E18EA60000000049454E44AE426082}
        PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
      end
      object layerbox: TComboBox
        Left = 8
        Top = 0
        Width = 91
        Height = 21
        Style = csDropDownList
        DropDownCount = 12
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 8
        Text = 'Alle'
        OnChange = layerboxChange
        OnCloseUp = layerboxCloseUp
        OnDropDown = layerboxDropDown
        OnKeyPress = layerboxKeyPress
        Items.Strings = (
          'Alle'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
      end
    end
    object Effektliste: TStringGrid
      Left = 105
      Top = 25
      Width = 903
      Height = 180
      Align = alClient
      Color = clWhite
      ColCount = 7
      DefaultRowHeight = 15
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect, goThumbTracking]
      PopupMenu = audioeffekte_popupmenu
      TabOrder = 2
      OnDblClick = EffektlisteDblClick
      OnDrawCell = EffektlisteDrawCell
      OnKeyUp = EffektlisteKeyUp
      OnMouseMove = EffektlisteMouseMove
      OnMouseUp = EffektlisteMouseUp
      ColWidths = (
        17
        43
        68
        147
        224
        99
        283)
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 25
    Width = 1008
    Height = 297
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 763
      Top = 0
      Width = 8
      Height = 297
      Align = alRight
      Beveled = True
      ResizeStyle = rsLine
    end
    object PanelWaveform: TPanel
      Left = 0
      Top = 0
      Width = 763
      Height = 297
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Panel6: TPanel
        Left = 0
        Top = 280
        Width = 763
        Height = 17
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object audioeffektscrollbar: TScrollBar
          Left = 0
          Top = 0
          Width = 763
          Height = 17
          Align = alTop
          Enabled = False
          LargeChange = 10
          PageSize = 10
          TabOrder = 0
          Visible = False
          OnChange = audioeffektscrollbarChange
        end
        object waveform_scrollbar: TScrollBar
          Left = 0
          Top = 17
          Width = 763
          Height = 17
          Align = alTop
          Enabled = False
          PageSize = 0
          TabOrder = 1
          OnChange = waveform_scrollbarChange
        end
        object ScrollBar1: TScrollBar
          Left = 0
          Top = 34
          Width = 763
          Height = 17
          Align = alTop
          PageSize = 0
          TabOrder = 2
          Visible = False
          OnExit = ScrollBar1Exit
          OnScroll = ScrollBar1Scroll
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 763
        Height = 280
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object waveform: TPaintBox
          Left = 0
          Top = 0
          Width = 763
          Height = 280
          Align = alClient
          Color = clBtnFace
          ParentColor = False
          OnDblClick = waveformDblClick
          OnDragOver = waveformDragOver
          OnMouseDown = waveformMouseDown
          OnMouseMove = waveformMouseMove
          OnMouseUp = waveformMouseUp
        end
      end
    end
    object PanelRight: TPanel
      Left = 771
      Top = 0
      Width = 237
      Height = 297
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object Shape3: TShape
        Left = 88
        Top = 264
        Width = 145
        Height = 33
        Brush.Color = clGradientActiveCaption
        Pen.Style = psClear
      end
      object AudioeffektplayerTimeLabel: TLabel
        Left = 8
        Top = 2
        Width = 233
        Height = 24
        Alignment = taCenter
        AutoSize = False
        Caption = '0h 00min 00s 000ms'
        Color = clGradientInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object bpmview: TLabel
        Left = 8
        Top = 266
        Width = 73
        Height = 23
        Alignment = taCenter
        AutoSize = False
        Caption = '? BPM'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        OnClick = bpmviewClick
      end
      object synchronizing: TImage
        Left = 92
        Top = 248
        Width = 49
        Height = 49
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000003000
          00003008060000005702F987000000097048597300000B1300000B1301009A9C
          1800000A4D6943435050686F746F73686F70204943432070726F66696C650000
          78DA9D53775893F7163EDFF7650F5642D8F0B1976C81002223AC08C81059A210
          92006184101240C585880A561415119C4855C482D50A489D88E2A028B867418A
          885A8B555C38EE1FDCA7B57D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F80111226
          91E6A26A003952853C3AD81F8F4F48C4C9BD80021548E0042010E6CBC26705C5
          0000F00379787E74B03FFC01AF6F00020070D52E2412C7E1FF83BA5026570020
          9100E02212E70B01905200C82E54C81400C81800B053B3640A009400006C797C
          422200AA0D00ECF4493E0500D8A993DC1700D8A21CA908008D01009928472402
          40BB00605581522C02C0C200A0AC40222E04C0AE018059B632470280BD050076
          8E58900F4060008099422CCC0020380200431E13CD03204C03A030D2BFE0A95F
          7085B8480100C0CB95CD974BD23314B895D01A77F2F0E0E221E2C26CB1426117
          29106609E4229C979B231348E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E6
          66E76CEFF4C5A2FE6BF06F223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D603
          70C701B075BF6BA95B00DA560068DFF95D33DB09A05A0AD07AF98B7938FC401E
          9EA150C83C1D1C0A0B0BED2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB
          7AF000719A4099ADC0A383FD71616E76AE528EE7CB0442316EF7E723FEC7857F
          FD8E29D1E234B15C2C158AF15889B850224DC779B952914421C995E212E97F32
          F11F96FD0993770D00AC864FC04EB607B5CB6CC07EEE01028B0E58D27600407E
          F32D8C1A0B91001067343279F7000093BFF98F402B0100CD97A4E30000BCE818
          5CA894174CC608000044A0812AB041070CC114ACC00E9CC11DBCC01702610644
          400C24C03C104206E4801C0AA11896411954C03AD804B5B0031AA0119AE110B4
          C131380DE7E0125C81EB70170660189EC218BC86090441C8081361213A881162
          8ED822CE0817998E04226148349280A420E988145122C5C872A402A9426A915D
          4823F22D7214398D5C40FA90DBC820328AFC8ABC47319481B25103D4027540B9
          A81F1A8AC6A073D174340F5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D
          8A8E6380D1310E668CD9615C8C87456089581A26C71663E55835568F35631D58
          3776151BC09E61EF0824028B8013EC085E8410C26C82909047584C5843A825EC
          23B412BA085709838431C2272293A84FB4257A12F9C478623AB1905846AC26EE
          211E219E255E270E135F9348240EC992E44E0A21259032490B496B48DB482DA4
          53A43ED210699C4C26EB906DC9DEE408B280AC209791B7900F904F92FBC9C3E4
          B7143AC588E24C09A22452A494124A35653FE504A59F324299A0AA51CDA99ED4
          08AA883A9F5A496DA076502F5387A91334759A25CD9B1643CBA42DA3D5D09A69
          6769F7682FE974BA09DD831E4597D097D26BE807E9E7E983F4770C0D860D83C7
          486228196B197B19A718B7192F994CA605D39799C85430D7321B9967980F986F
          55582AF62A7C1591CA12953A9556957E95E7AA545573553FD579AA0B54AB550F
          AB5E567DA64655B350E3A909D416ABD5A91D55BBA936AECE5277528F50CF515F
          A3BE5FFD82FA630DB2868546A08648A35463B7C6198D2116C63265F15842D672
          5603EB2C6B984D625BB2F9EC4C7605FB1B762F7B4C534373AA66AC6691669DE6
          71CD010EC6B1E0F039D99C4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37
          DA7ADABEDA62ED72ED16EDEBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51
          BA85BADB75CFEA3ED363EB79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EF
          D11F373034083690196C313863F0CC9063E86B9869B8D1F084E1A811CB68BA91
          C468A3D149A327B826EE8767E33578173E66AC6F1C62AC34DE65DC6B3C616269
          32DBA4C4A4C5E4BE29CD946B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D5
          9C6B9E61BED9BCDBFC8D85A5459CC54A8B368BC796DA967CCB05964D96F7AC98
          563E567956F556D7AC49D65CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9B
          ADC4769B6DDF14E2148F29D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625
          F66DF6CF1DCC1C121DD63B743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E9
          57671B67A1739DF33517A64B90CB1297769717536DA78AA76E9F7ACB95E51AEE
          BAD2B5D3F5A39BBB9BDCADD96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4
          F0F758E271CCE39DA79BA7C2F390E72F5E765E595EFBBD1E4FB39C269ED6306D
          C8DBC45BE0BDCB7B603A3E3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE
          237ED67E997E07FC9EFB3BFACBFD8FF8BFE179F216F14E056001C101E501BD81
          1A81B3036B031F049904A50735058D05BB062F0C3E15420C090D591F72936FC0
          17F21BF96333DC672C9AD115CA089D155A1BFA30CC264C1ED6118E86CF08DF10
          7E6FA6F94CE9CCB60888E0476C88B81F69199917F97D14292A32AA2EEA51B453
          747174F72CD6ACE459FB67BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC
          9BB880B8AAB8817887F845F1971274132409ED89E4C4D8C43D89E37302E76C9A
          339CE49A54967463AEE5DCA2B917E6E9CECB9E773C593559907C3885981297B2
          3FE5832042502F184FE5A76E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92
          E69D5695F638DD3B7D43FA68864F4675C633094F522B79911992B923F34D5644
          D6DEACCFD971D92D39949C949CA3520D6996B42BD730B728B74F662B2B930DE4
          79E66DCA1B9387CAF7E423F973F3DB156C854CD1A3B452AE500E164C2FA82B78
          5B185B78B848BD485AD433DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859
          F1E022BF45BB16238B5317772E315D52BA647869F0D27DCB68CBB296FD50E258
          5255F26A79DCF28E5283D2A5A5432B82573495A994C9CB6EAEF45AB963156195
          6455EF6A97D55B567F2A17955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796D
          DADADE4AB7CAEDEB48EBA4EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE5
          1B5F6D4ADE74A17A6AF58ECDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A
          9D7F5DCB56FDADABB7BED926DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78
          576BBD457DF56ED2EE82DD8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F6
          45EFEB6A746F6CDCAFBFBFB2096D52368D1E483A70E59B806FDA9BED9A77B570
          5A2A0EC241E5C127DFA67C7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD2
          3ABF75AC2DA36DA03DA1BDEFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F
          579EA09D283DF1F9E48293E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515D
          BD6743CF9E3F1774EE4CB75FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3D
          AE3D477E70FDE148AF5B6FEB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D5
          73D7F8D72E5D9F79BDEFC6EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC
          5D7A8F78AFFCBEDAFDEA07FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E
          09879EFE94FFD387E1D247CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7
          B2A713CFCA7E56FF79EB73ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F3
          72EFABA9AF3AC723C71FBCCE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC
          40FE50F3D1FA63C7A7D04FF73EE77CFEFC2FF784F3FB25D29F33000000046741
          4D410000B18E7CFB519300000F9B4944415478DAD55A097C15D5B9FFCECCDC2D
          EB25FB66162084452AA06001452BF0902714F029B5F88A52B18BA5E282AD88E2
          6B7DFD15A8A52D52152D5AA496BD169445A325B20690040C4B4802219104B290
          84DCDCE4DE3BCBE97766CEDC3B37B944A0EFF77BBF0EBF937BEFCC9933DFFFFB
          FEDF76064229857FE783FCDB03F89757787D9300ED5949718E94BCAC38474192
          93E446892449B20931A051222B5A47A7AC5C6EEA926BEA9ADB2B3C9E9A7350B6
          AE09B66F54E195620A2F7DF3FF09C0A242774262FE3787A4B8EEEBDFC736363B
          DE91931225C4C7D805D12100D824636959A1E0D7003A029ADAE0553CB56DBEDA
          8A466FF1A90BCD3BDACA3F3D08EB9EBF8CD37006DC1015AE1FC08B85EED4C401
          5386A7C7CC199EE61C991727C5C63B0510095B8CEA920457255C2C1C02FB2004
          549C70C5A7C1B936BFB7B4DE535A72B67E6DD3F16DDBE06FAF34E314F57A815C
          3B809FFE4A9252BF3376787ADC823B6F8A1E5F9064734549C4789A884FD575C8
          2505FE5BB03C80FD26C62F428DF39D689DF2E6806F4F55F3BE63A74EAC50773C
          5704E74E775E8F45AE0DC0D3DB63DDC9431F1F9317FFECD82C674662140A8EC2
          52CB0A947F319FAAC706623186C0C502C352E6AD04FF5DEEA4B0B7DAD378E064
          C5AAF6A23FAC82431B9AF0927C2D20BE1EC0133B5213B36E597C773FF79C11E9
          36975DA4A15505CE10945665F4410D0B785D10430BB3EB9ACA065EC3792221BA
          D0C4A49766CC0DE0F5A317FDFEDD5F566D692D7AE37F61FF5BD5EC7408F68D00
          40E1DD19C396DD95173F6B68AA8407AE46436AD1C0103CCA0590194F20275E80
          34178158BB000E4E25E6C09E800697BA28D4B46B50D74EA11349225204C45050
          CE2CCD58FBF845592DFAB2728767F7AB2FC291F7ABF08AAF3710570730FBCFF1
          CEDCF14B6ECF499C7B6B8628094CDB0482D451F0333E0EE0D6740146A4489081
          824BA4777DB07BEA114849A382DAD6E04A3BE8F7E87751C37A2E54D29EB38A76
          E078D907F2CEE75E84AA7DB5BD8188FCC489732418B1E8E941A929BF1C93E770
          1AB4A13ACF29734C5183E1990426E7D9E0A618F1BA431953C0571D2AECAC96A1
          B40EA9A70820081A4C1A80DC9305F8F0940A076BBBE4F2B2CFDF84F5DF7B15BA
          3C8DCC9810C127223D9BC0FC43E3131207ACB923C799E176194233CD331347C5
          004C1D28C0C42C095C36E13A450F3FBA640D0A2F28B0B342813BB3459839D00E
          1F9D5661F30915DAD1B1F755B7B4B61E5EBD08762DDE82D3DB208263F70430FB
          2FC942C6DD6B6F494B98949F2C18B4D1EFA210EDD260D670092664DB74678C74
          74CA14DA7D147CAAF1DB894A8D731288B2459E1F5029D47A54C88C15C185C964
          6399021BCA546079B0B25183E395A74AB51DF3E6437571194EF780912BAE0A00
          B57FECB1E4C4BE2B6FCB72389C48158D03906C141EBE558469F97616F6C30E46
          CE9A360D0ED66950D6A842A397825736AE45DB0052A2090C4D116174A600396E
          017AB3DBFAE332BC7F5C05665C9F4CE0486D97D25CBAF635D8FAE44ABC7C8919
          CE6A8570000FAC4815B2A76F1E92997C474E0241C18CF0C040DC534060DE48BB
          AE25EB71C54FE1A34A15765529D0E03568C6623E4B567A98A5465213F0B6D418
          02F7F697604A7F11E21D912DF2FE3105D61E53314A513D4AD5B4523879E64485
          F6E1F79F82FAB2A338A50587120900811FED7D203669E8BBC3D31DD12E3BE1E9
          90429A9BC22F26D8A1AF3B5CF7973A28AC3A2AC3DE1A15234C30D1EA87B5C835
          CFB3736C856FF51360FE283B86DB9E20D6962AF0EE510524203AE82E5450C905
          4FA0A378F9EF61F792D538E582D50AA115D2B39CF060E19B9949398F0C48366A
          00630685D9A3047874983D0C6D1B86C3E50765D85DAD86D53E57ABCE09BF260A
          14660DC3F5863AC021F604B006855FFD850222049D0F2A2F63FE38BD6B3F6C98
          B91054A51CCFB69A5608AD3075593F31FFE10FF3931307A5C41A9A67D449C158
          BF74B20DF21343DA6734595322C36A7C18A319ED2647F71E8310A20B2F491AFC
          F77014FE1B0E74EEC8147A0785FFD311A4906614270C78630781CAF3158DEAB6
          475E80BAD2DD78BA1E8CDC60D1DDAC75939D9913D70F488E8E8D711A4229C8A1
          F1F9489FFF7080DDF2C08A660D16EC94F5AC2A0A16ADF7E29D364C50DF1D46E0
          31B424133E92A1D823DE3AA4C0DB870C0B305F4283410746B5CA86367FD767CF
          AC8063EBFE8A53CF81119182BA13C99C4F9E8E4A1EBDB47F82244836C22944E1
          996F89F0F0305BD8835615CBF046B18A09AD27DFE955B29A0BD71C924CF4B01A
          562859EE1590F4B5E8B4B52D9AAE0BC24B0D56829F6F9369DB81651FC0EE57FE
          8097188D581FA19A4BD9C9DCBDBF8B4EB8F589DC3E0444D1A049940360F97409
          C6E448C187746079357F6B00332535144EAEBD805783A52A048B39C316BCCC66
          20F4E86301C80B888B1E0ACDC7DE3940B7CF5B823F8FB3533864736A8CF0F8E1
          77A2DC431FCC761B9522039088BEF0F6433618981CE2C6576D14E66C90F54FA1
          BBD30ADC04DDAD10566373CE06E710A42AD5FD46E0451D11795DA5E94DBB0EB2
          090BC0C6939B4ED00F66FF1A671D61A2E0F099CBB8C51F96FCC51133E8BE24AC
          2CED686E06201D2BCCF58FDA20CB1D92E8F4250D1E7C578696AE90D07AF34220
          18F7231D66C569FDCE38CEEAACF137534888A1FABDEC9A17C5DA739240A79F18
          CD0F9E6BC1A8D776EEC30A6DD3CCA578F7211CE771784DC912C5C7BF582B450D
          99CC9287243200AC32A43069B004310E082ECE9A8F9DE5D8E7CA34D8B404954C
          38984800049332E15649C2DAEAD37936B8392D646596BC26AC0840FD15D06561
          4700EBA6C0856D55DA96EF2CC79FFB71B07EC143B80889E2A39FAF96E2467D9B
          15B71A0D595C37AFA537642615BB3BAF7015CFB5B2C89AE8F803D8DFBEC9009F
          2080BC841080B27A0D26FF11337B7BC81F089A423EBFAE42DBF6FDD73880B356
          007DC487B6BE664B99380B546321CDB4B56AE4034DB338AB60CCE9AE6D111FA2
          0BD91D90D62D2F706BB0E8327E08C0E6B93688B394169F95AB30F34F2A787C2C
          73F37BB1DC96CB579E500B7FF626FE3AD01D409C3075D5CBF6BCEF3D45148168
          9658C86EEF97AE41DF0C9573BDA7B659B8EBC2E874B442026F1717B097231864
          D02C8BA7137871527898FE63910ACF6E0C159D7A3325C81038FC42B17668C51A
          3C55CC017404A31019F3CC63F661CF2F1568BCC32ABD8CEA7F698A008BA70A7A
          62EB29BC51AFBCFA0985DF7F6A7C370BB9A029BB0162746216CD4DD360CB8F45
          F8464628CBFBB1A89ABB46830D87B1A416437268D0A2060A6717D2B3859BC088
          42D5560051246FDC04FB3DAB5609F6FE697A6CE60F61B1FB7FA689F0C27D91D5
          CA045EBE0B01E0E894A167688D6434E647182016CE005888DAB7AE7CB29EC2FD
          2B15A8B90C7A9637F20C865ACF71AFFCD1FD7F87B6DA9D789655A5ACD5EC3497
          7660C13F589AB679A53DE5DE318CF494F5A878AB8C25D3CBD311C0D49E007C18
          897EBB1385DF6E7C2757939806FF18E5356AF6FEB11AAC98294252B410366DC9
          760D7EB5554F007A9D45F4228A42A0FACF75CAC73FDE8C3C2E022391B17AC86F
          3E89A5DA7461F473CF3A6E7EFE2702C449410A3100330478E1DB3D015CC11AE5
          A98D0A6CDC238016604DB94570D3712D0ECD2C2AD935983A5A835FCF1021A74F
          F89AA7B0219AF53A85331779A423E6526D9A7FDF8F4AB4F22DDBC070E05338D8
          DE9162AECE567293E48249D28435CB1CB1B7651902101DC0E2E908605AE450D9
          ECD5E0ADFD1AACF90716EA9710082E49B4F01E80F5D4026A310B39FFC83D003F
          182B84699E1D5E54C6CF3700BC5BA4E9FB4AC6B624D52BBC4073517BE0E3870A
          C1DBBC9BF39F6DB7B01E59B3EE62620E8602E98E9717D90B9E9D216851FA1398
          E32E460B2C9C76F558AF22D8930DD8997DA9C1DED348CE4602ED5EE35A5C3440
          760A853B07014C192AC010F430B15B98657EF6D6A7145EDE847EE467518706B3
          BA46BCD45FB2E08C7AECED8FC1883EC738FFF5A6C6BA128B652990D06FAAFDAE
          B717D9DDE3B2583491D131173F800030DC312D9D43E10A32B004907A0261298F
          157BCD1DE13D7112B6923176631BB1FBC114B4713F8597D603345C31A8634865
          B46F81E65DEDFECF1EDD8BDADFC7B57F9AD34736356F1E4CE3B1CC0AC2E059F3
          1C2396CD94C47487C228F45F0416A0055EDD0AF0D7CF293C712F81D977538872
          FE6BAF173A5121EF15E1BAC8EC8636634BD2EC3B9903ABCA578AFFE0E3A7B4EA
          4FF6E0952F7094E2A801A31708DB0837BFDB752B88D238E9F65FCE77F47FF236
          AAB8C8022C306251D8DFFC8D62C2227A6DF4C0688027FE9342C14DE48636B6CE
          7C45E1F51D0436A34B7A032CF9198512E5A955133A69D78957EAD492DF1463E4
          61C29758B41F801E3DB171301D607905D910933AD57EFB92B9F6CC59B9B96E1B
          B98C98BD5D4675C876669893E6A701CC1C87DCBE9D656BA3EBEAED6001E12C56
          F11F612DB911755A7989D748266D38084D90A9AF76758B7C686129F8AE1CE5BC
          67FB42ACA1EF00CBDE50CF7D21C31712700C0477EE74C7C8A50FDA526664889A
          8DD7E7FC26561BA9A067CB4C9C3DB20060148E829B90F3D847C7B88C053BD0D5
          9ADB99C6010EA3FE8E5400D4614BAEA8BCE408EEB91AEAA3920CBEBAF56D81C3
          3F3B09DE4B2CDE7FC985676D640B74DB9D8BBCB56844A4141C37435CCE14C788
          97A6D8D3BE9B21D12862B681840F3D69AB466127A130D178A70B8968E365808C
          D7589DC46A2485F700C4CCB016CA30202AE9A4BEBAF75A0325BF2847E159AC3F
          C947250EB63F1AB6A975350026953000429A0EC29538DE36F827131D7D7F9867
          171087C2CB1BDEF2999D94B93455C317337BE760EFC0DF2B98EF17581A0DA8F5
          8AFFEC8A26F9D41B55E06F3FC3DC84739E09CF76E4BCD06D5BB13700C4E20F69
          3A9D04DB18217BE23847FE9383ECEEBB626DD44918105D81A6552044AFB0C37C
          1162AE6CBE8612D866B48F06DA7677FACB97D76B7545D598091955AA38802A2E
          BCC9FB6BDA9DB65E933888541C79386E0157F2482967C6507BF6C319B6E8112E
          3B891188CA4144123E1210A671E8D464CF115FA0E6BD16A5F6EF75E06B613D2E
          0B91D55C70F6BD810BAF4412FEEB00584144E148C49185A33F8EC10864A0947A
          675F29EDDE143176548CCD996B13489CA06F09B250CE69A32A46BE57D846196D
          D764FF79596D2FEE522EED6C551AF636A1E04CC3AC30AB0323C39E0723DAB06D
          93CEDE84BF1600563A3971C483E1DC0C48368E5C247836894A4B1362FB279298
          81B1A22BDB496C493622F16247F36A9AAF4951BB6A02B4E38C57F35476D0AE86
          56F4FACB5C48E69C1739803AFE1BBB617DE7ED6B5FBB5E6B0E32E9CD125D3407
          92CCC1A4F14F167AFB804139D614D9F83D1AD7227BC3D2C529C1046CB30060A3
          899F67CE6A26AAFF83B79491AD610289E560FAF0CF583E4C0066FC51B9507E0E
          C0C3856DE59F1E8BE0D7F5B2FB468A99E0762407C206CB1B517C383900A91B00
          D30A8C1A9D7C7471A14DC1E17A84BF5100DDEFE7F95417D83ACCF3ECD0204425
          EB30CFDFF07F99F927238CAD885623DAF30000000049454E44AE426082}
      end
      object nomouseimage: TImage
        Left = 140
        Top = 256
        Width = 41
        Height = 41
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000002600
          0000260806000000A83DE9AE000000097048597300000B1300000B1301009A9C
          1800000A4D6943435050686F746F73686F70204943432070726F66696C650000
          78DA9D53775893F7163EDFF7650F5642D8F0B1976C81002223AC08C81059A210
          92006184101240C585880A561415119C4855C482D50A489D88E2A028B867418A
          885A8B555C38EE1FDCA7B57D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F80111226
          91E6A26A003952853C3AD81F8F4F48C4C9BD80021548E0042010E6CBC26705C5
          0000F00379787E74B03FFC01AF6F00020070D52E2412C7E1FF83BA5026570020
          9100E02212E70B01905200C82E54C81400C81800B053B3640A009400006C797C
          422200AA0D00ECF4493E0500D8A993DC1700D8A21CA908008D01009928472402
          40BB00605581522C02C0C200A0AC40222E04C0AE018059B632470280BD050076
          8E58900F4060008099422CCC0020380200431E13CD03204C03A030D2BFE0A95F
          7085B8480100C0CB95CD974BD23314B895D01A77F2F0E0E221E2C26CB1426117
          29106609E4229C979B231348E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E6
          66E76CEFF4C5A2FE6BF06F223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D603
          70C701B075BF6BA95B00DA560068DFF95D33DB09A05A0AD07AF98B7938FC401E
          9EA150C83C1D1C0A0B0BED2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB
          7AF000719A4099ADC0A383FD71616E76AE528EE7CB0442316EF7E723FEC7857F
          FD8E29D1E234B15C2C158AF15889B850224DC779B952914421C995E212E97F32
          F11F96FD0993770D00AC864FC04EB607B5CB6CC07EEE01028B0E58D27600407E
          F32D8C1A0B91001067343279F7000093BFF98F402B0100CD97A4E30000BCE818
          5CA894174CC608000044A0812AB041070CC114ACC00E9CC11DBCC01702610644
          400C24C03C104206E4801C0AA11896411954C03AD804B5B0031AA0119AE110B4
          C131380DE7E0125C81EB70170660189EC218BC86090441C8081361213A881162
          8ED822CE0817998E04226148349280A420E988145122C5C872A402A9426A915D
          4823F22D7214398D5C40FA90DBC820328AFC8ABC47319481B25103D4027540B9
          A81F1A8AC6A073D174340F5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D
          8A8E6380D1310E668CD9615C8C87456089581A26C71663E55835568F35631D58
          3776151BC09E61EF0824028B8013EC085E8410C26C82909047584C5843A825EC
          23B412BA085709838431C2272293A84FB4257A12F9C478623AB1905846AC26EE
          211E219E255E270E135F9348240EC992E44E0A21259032490B496B48DB482DA4
          53A43ED210699C4C26EB906DC9DEE408B280AC209791B7900F904F92FBC9C3E4
          B7143AC588E24C09A22452A494124A35653FE504A59F324299A0AA51CDA99ED4
          08AA883A9F5A496DA076502F5387A91334759A25CD9B1643CBA42DA3D5D09A69
          6769F7682FE974BA09DD831E4597D097D26BE807E9E7E983F4770C0D860D83C7
          486228196B197B19A718B7192F994CA605D39799C85430D7321B9967980F986F
          55582AF62A7C1591CA12953A9556957E95E7AA545573553FD579AA0B54AB550F
          AB5E567DA64655B350E3A909D416ABD5A91D55BBA936AECE5277528F50CF515F
          A3BE5FFD82FA630DB2868546A08648A35463B7C6198D2116C63265F15842D672
          5603EB2C6B984D625BB2F9EC4C7605FB1B762F7B4C534373AA66AC6691669DE6
          71CD010EC6B1E0F039D99C4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37
          DA7ADABEDA62ED72ED16EDEBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51
          BA85BADB75CFEA3ED363EB79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EF
          D11F373034083690196C313863F0CC9063E86B9869B8D1F084E1A811CB68BA91
          C468A3D149A327B826EE8767E33578173E66AC6F1C62AC34DE65DC6B3C616269
          32DBA4C4A4C5E4BE29CD946B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D5
          9C6B9E61BED9BCDBFC8D85A5459CC54A8B368BC796DA967CCB05964D96F7AC98
          563E567956F556D7AC49D65CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9B
          ADC4769B6DDF14E2148F29D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625
          F66DF6CF1DCC1C121DD63B743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E9
          57671B67A1739DF33517A64B90CB1297769717536DA78AA76E9F7ACB95E51AEE
          BAD2B5D3F5A39BBB9BDCADD96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4
          F0F758E271CCE39DA79BA7C2F390E72F5E765E595EFBBD1E4FB39C269ED6306D
          C8DBC45BE0BDCB7B603A3E3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE
          237ED67E997E07FC9EFB3BFACBFD8FF8BFE179F216F14E056001C101E501BD81
          1A81B3036B031F049904A50735058D05BB062F0C3E15420C090D591F72936FC0
          17F21BF96333DC672C9AD115CA089D155A1BFA30CC264C1ED6118E86CF08DF10
          7E6FA6F94CE9CCB60888E0476C88B81F69199917F97D14292A32AA2EEA51B453
          747174F72CD6ACE459FB67BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC
          9BB880B8AAB8817887F845F1971274132409ED89E4C4D8C43D89E37302E76C9A
          339CE49A54967463AEE5DCA2B917E6E9CECB9E773C593559907C3885981297B2
          3FE5832042502F184FE5A76E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92
          E69D5695F638DD3B7D43FA68864F4675C633094F522B79911992B923F34D5644
          D6DEACCFD971D92D39949C949CA3520D6996B42BD730B728B74F662B2B930DE4
          79E66DCA1B9387CAF7E423F973F3DB156C854CD1A3B452AE500E164C2FA82B78
          5B185B78B848BD485AD433DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859
          F1E022BF45BB16238B5317772E315D52BA647869F0D27DCB68CBB296FD50E258
          5255F26A79DCF28E5283D2A5A5432B82573495A994C9CB6EAEF45AB963156195
          6455EF6A97D55B567F2A17955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796D
          DADADE4AB7CAEDEB48EBA4EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE5
          1B5F6D4ADE74A17A6AF58ECDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A
          9D7F5DCB56FDADABB7BED926DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78
          576BBD457DF56ED2EE82DD8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F6
          45EFEB6A746F6CDCAFBFBFB2096D52368D1E483A70E59B806FDA9BED9A77B570
          5A2A0EC241E5C127DFA67C7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD2
          3ABF75AC2DA36DA03DA1BDEFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F
          579EA09D283DF1F9E48293E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515D
          BD6743CF9E3F1774EE4CB75FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3D
          AE3D477E70FDE148AF5B6FEB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D5
          73D7F8D72E5D9F79BDEFC6EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC
          5D7A8F78AFFCBEDAFDEA07FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E
          09879EFE94FFD387E1D247CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7
          B2A713CFCA7E56FF79EB73ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F3
          72EFABA9AF3AC723C71FBCCE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC
          40FE50F3D1FA63C7A7D04FF73EE77CFEFC2FF784F3FB25D29F33000000046741
          4D410000B18E7CFB519300000AC44944415478DAA597795094F719C71F58CE65
          77B941E4101CF1021195A478C493C62A9E5163476D479336D1D1893563D27446
          3BA67F64DA74DA489B69C6D1986A3B3A2A5E04150FBCA07278A01CCA2D821C8A
          A01C7208ECF6FB7D795FE72DA340D277E699DD7DF77D7FEFE7FD3EE7CF4E74C7
          AA55AB86B5B4B444B9B8B874B8BABA36E054E1FEFDFBDB376DDA647AFEFCF9C8
          EEEE6EA3CD66B3E27C536B6B6BE98913273AB57BE3E3E36D5D5D5DD2D3D32356
          AB5539876B65A0E3F2E5CBAF3C6FA77D59B3664DD88B172F220194C4853D3C3C
          A4ADAD2DCAD1D1D1686F6FEF101111916EB158A4B3B3536A6B6B253737773120
          AA8F1D3B968FDB7B5493F9F3E7DBF0020A1C4D837B1D64BF6073E6CC31787B7B
          C70126A5B1B151828282242A2A4AA09272117F13062A29DFFDFDFDE5C9932772
          E0C0811580EB4C4B4BBBDAD4D4D4814BBBC8B074E952453D026A90047B155C7F
          6076EBD6ADB3F226B8509E3D7B2673E7CE1528A52CE8E7E72759595992979727
          4E4E4ECAEF69D3A6C9F0E1C3A5A1A1414E9D3A252525252BB2B3B3D3EBEBEB9B
          B1DE0BAAB77AF56A5B474787D0F42EEE0BD72FD8C48913DD020202DE864A47E1
          4EF1F2F292C0C04045999B376FCAEDDBB765C488113261C20405B8AAAA4A860C
          19A2803537372B4AE29A5F3A3838B4DAD9D9B5190C86AAC4C4C422AC6DD51E84
          97B5E9D51B0C983DCC69F6ECD96FE286E8993367261088C7FDFBF7A5B4B454C6
          8E1D2B63C68C5114639CC1ED4A0C161717E3413D12121202C01605B4AEAE4ECE
          9D3BF7165E700854CA86A2B52AA0F55570FD811960CE304F28F753BCF1E4E0E0
          E00FF029B4F0F07019366C981273A3468D124F4F4FE53C172F2F2F93DDBB0F88
          C96494458BE2100A462516A9627979B9A4A6A6BE8FEBF25252520AD4F86382D8
          10D3360D6E40C5601658C0D0A14327BAB9B945E1E1812C0F50C96DE7CE9D33C7
          8F1F2F66B3599C9D9D052E53164D4A4A948307EDC5DEDE11AECE930D1BD6BD54
          8EEEA5DA28291F23C66E002017EB3341BAA91E3C64E31A972E5D7A7D8CC11C61
          4698376C282C84C908F31D3D7A74F89E3D7B164145C57D46A35101E371F264A2
          1C3E6CC0B9116230A4CA871F4E839BFDE4E9D3A72C35829A2877EFDEC57527B7
          23A9521187C5B8EDB9AA9E75D6AC59B681C034D54C302F98BF6ABE919191D1BB
          76EDFA35924371A3C96492F6F67625966EDCC8423CD500742154CB40B6DA2329
          02954C6416124C53EEFAF5EBBF47CC263DC4A1C2317B6DAABDBA8EE9E0A89C1B
          CC1DE64143DCC5242424FC092E566A12D7E5437D7C7C60DE9291912DE7CF3F90
          80003BD9B2652DC0CD4A8C51312D1998443939392CCA9B517ACE60DD06BD72FD
          81F5857381B902C62B2C2C6CCC8E1D3B8EB0BEB1544447470BDD8A6EF0F2C627
          4FEAE04E13CE3908CB0D039B9F34166916EDFCFC7CD9BB77EF1EB839A5A8A8E8
          166E6B84B5A93167EB0F4CEF5A66AA03023460CA9429658CAD98981899346992
          12637A28ED60AB6221251415A5F137DD4E05D9292E5EBCC84CFD2BC08EA35354
          E0B6A76A4258FBC2D9C9AB0FE53C9A7A206A56D5E2C58B953A4640F452A55CE8
          0F2A43376BD55D0F47602D11D021E4ECD9B388CD1B9B90145771EB2358932EDE
          060453FE43630F44F3AE628B62A52718DB961E8C505486A9AF41694658FEA777
          6B5252929C3973660F12E218C28359FA448DB71E3D5CBF60CB962D0B898D8DAD
          405A0B83BF2F98F6507D93D68369AAF11AB429E59EF4F474494E4E66ABDB8ACE
          41D5AA61CF742E1D186CE1C285A188B172B429A5EDE85D4935581634203D14BF
          EBDDCA176061664B6312A0E8CA952B57BE2B2C2C3C81182C565DDAA257AD5FB0
          B8B8B8604C120FD04294B6C43AC6E0E7C1FAA46FC61A505F776A60ECB10463B9
          61510518D5DB5C5353731DB757496F96BE54AD5F30F449AF9123474EDFB265CB
          318E396CDE0463A6D13D5A766A401A605FE5A82E6394D7B3B611EAF4E9D32CBA
          0970E705DC560AABE3FB4A6FF9E81F0CE6868974EEFAF5EB13D9C07D7D7D9576
          C44CD3E24C3FA16A807D95E3B504E32795C660A9805DBB76ED4841414132AEB9
          87251EAAAA29193A10982BC0E2D7AE5D7B98E5824322DF9E81CCB77F9D2B7950
          29FEE6F554992D8DE798999999994AD9605740BC7D8272721BB794C3EAD50CB5
          0E04E6844DC6CF50C74EB0B832F8F93026405F30BD6284E96CAD97DA1BDF8BF7
          A868F1099DACC4185F8821C08998603DED8D52517277DFC90BD967B144914EB5
          EEFEC07838CC9B376F3A3A402A7AA6D21F19C054404BFFBEEE64A0335B6BB28F
          CAA5BFFD5BDE7C77AE442CFF48304A29A586C536FFD67FA4BB2853BA6F17899B
          BB494A7D4DC91B3EDFFB3596285313A173203003A0C6E08123366EDC789C31C6
          CCE44308C698D1970BCD85ED4DD572F9CF7F90DC9319326A72844CDFB15D5C3D
          C39479EED9E3075273E85BB97F344D3AAB1BC5EC6591091BE2E5B3B3E99FA466
          165CC6121C2ADB070263DA995136DE59B972E55E1659AAA6A53E138146487EF2
          1C156B6E7C28E73EFF54720E5F118B8759A67FB4521C621688A7D9599E7EBF5F
          8AF69D97AEC74D620154C894B1523721B438A3A0ECF2AE23170FE37919830153
          3273C68C197350CF4E708AA56A34C2D1358C3702D17830B8B15B92076987E4FC
          B6BFCBF3EA06099D102E412B178BE1519DD41EBD28ED95F5E2E1E72981F131D6
          84C2B2E233E977B837650270EAB83258306740F88F1B37EEDD254B967C89BAA6
          EC9EB893E2D0C87823204722268406565D9E2BE57BBF91A2A44C7144A29A3D4C
          6278814C6D6A138BB7BB042F8AB56DCFB8F5302BB7B406CFB8AF42D1AE0D168C
          73B43B46ECF1007C7BC58A159F128EE9CF2CA57284A3628C39063EE7AFCACA4A
          697B942FD5DFEC97BA8C42B1EF405BC272041C1AFF86ED8BBB25F5D7728A1E63
          6DEEA20A55A83C58FE60825F4900E9DD0FF8A296BD05D74D470F7D8F9D8031A7
          8DDB74A9560E306B4945458560EE12BF4785D2BC3F457A1A5A30BBDB896790AF
          644605B57E7D3A8D4AD5AB997807C6CD0A3B004BC680E5E2A53BA577DC0E080D
          0D9D0C95A661925DC54D31A759777777C5951A18AB3B7B62755585CCB161483C
          9A2E76CDED0A98098AF9CE8FB16ECBBB5B9A9557764F552807764F558FF39975
          B06054CD557A372A8100198B048881FB46A255CD221015E3C1764563ACBD3F65
          B8741EB92A6D25B5E28CAC75C6758E5D3D62F2B688C7ECA8EE0C3F63CED6AF0E
          FE4B558B955F1BB76D8301D3E09CE47FB778C17061386AD3708C34FE281766C4
          9813EA99C1647472D834EF8D60D7D43BEECDB91588411731470EB3B6B83A7507
          3C7CE6D45556272E38E711394C2476646563984F4A5B7B67FAE2AD09C9D23B6E
          CB0F01D3F69FFA2D5E20DD0BF3515DEDFAF1BAF9E3A61A4D11CFAFE4BBB595D6
          21236D12845A7521D8F2F8DBA4B4C6031F2C0F3125DF327697E03F2CE9EA6311
          AFB868695F30F1F8989FFF6E0BD678F043C0B46BB55D9451052190AFFAC9ED9E
          5BDAF65F7D51B4EF82BC4055774299F0090F94EE77629B96FFF13B665C87BF97
          A5EBE86FD6C45ACEE57976DDAB16673717715F33A36DC19153EFDD29A9BCA7BA
          F50781F555CE4555CFA29A998A1DFB6AF36786A4EB539A6FDF17132AFBD0E553
          BB16EE4E4C7DDCD8DCA8BA8993AAF51FBFFDC5D4F9AE1E3FE93239776C4B49FB
          E7A10B5999385F01CBFA31607A38830E5033C661C4812F376D88ECB0CE7928D6
          9ABF9C4ABB959A55C007B26671846E569537ABE6A0C232232B61377E2CD8AB00
          35487E8E85054B6FECD1BDECEE54AB467D78AB7AAD45FD9FA588C361830A5EF8
          FF82E901FBC26AE76CBA4F5B9F73FD1EFF05ACA00583F6656EB4000000004945
          4E44AE426082}
        Visible = False
      end
      object recordingimage: TImage
        Left = 180
        Top = 248
        Width = 49
        Height = 49
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000003000
          00003008060000005702F987000000097048597300000B1300000B1301009A9C
          1800000A4D6943435050686F746F73686F70204943432070726F66696C650000
          78DA9D53775893F7163EDFF7650F5642D8F0B1976C81002223AC08C81059A210
          92006184101240C585880A561415119C4855C482D50A489D88E2A028B867418A
          885A8B555C38EE1FDCA7B57D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F80111226
          91E6A26A003952853C3AD81F8F4F48C4C9BD80021548E0042010E6CBC26705C5
          0000F00379787E74B03FFC01AF6F00020070D52E2412C7E1FF83BA5026570020
          9100E02212E70B01905200C82E54C81400C81800B053B3640A009400006C797C
          422200AA0D00ECF4493E0500D8A993DC1700D8A21CA908008D01009928472402
          40BB00605581522C02C0C200A0AC40222E04C0AE018059B632470280BD050076
          8E58900F4060008099422CCC0020380200431E13CD03204C03A030D2BFE0A95F
          7085B8480100C0CB95CD974BD23314B895D01A77F2F0E0E221E2C26CB1426117
          29106609E4229C979B231348E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E6
          66E76CEFF4C5A2FE6BF06F223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D603
          70C701B075BF6BA95B00DA560068DFF95D33DB09A05A0AD07AF98B7938FC401E
          9EA150C83C1D1C0A0B0BED2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB
          7AF000719A4099ADC0A383FD71616E76AE528EE7CB0442316EF7E723FEC7857F
          FD8E29D1E234B15C2C158AF15889B850224DC779B952914421C995E212E97F32
          F11F96FD0993770D00AC864FC04EB607B5CB6CC07EEE01028B0E58D27600407E
          F32D8C1A0B91001067343279F7000093BFF98F402B0100CD97A4E30000BCE818
          5CA894174CC608000044A0812AB041070CC114ACC00E9CC11DBCC01702610644
          400C24C03C104206E4801C0AA11896411954C03AD804B5B0031AA0119AE110B4
          C131380DE7E0125C81EB70170660189EC218BC86090441C8081361213A881162
          8ED822CE0817998E04226148349280A420E988145122C5C872A402A9426A915D
          4823F22D7214398D5C40FA90DBC820328AFC8ABC47319481B25103D4027540B9
          A81F1A8AC6A073D174340F5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D
          8A8E6380D1310E668CD9615C8C87456089581A26C71663E55835568F35631D58
          3776151BC09E61EF0824028B8013EC085E8410C26C82909047584C5843A825EC
          23B412BA085709838431C2272293A84FB4257A12F9C478623AB1905846AC26EE
          211E219E255E270E135F9348240EC992E44E0A21259032490B496B48DB482DA4
          53A43ED210699C4C26EB906DC9DEE408B280AC209791B7900F904F92FBC9C3E4
          B7143AC588E24C09A22452A494124A35653FE504A59F324299A0AA51CDA99ED4
          08AA883A9F5A496DA076502F5387A91334759A25CD9B1643CBA42DA3D5D09A69
          6769F7682FE974BA09DD831E4597D097D26BE807E9E7E983F4770C0D860D83C7
          486228196B197B19A718B7192F994CA605D39799C85430D7321B9967980F986F
          55582AF62A7C1591CA12953A9556957E95E7AA545573553FD579AA0B54AB550F
          AB5E567DA64655B350E3A909D416ABD5A91D55BBA936AECE5277528F50CF515F
          A3BE5FFD82FA630DB2868546A08648A35463B7C6198D2116C63265F15842D672
          5603EB2C6B984D625BB2F9EC4C7605FB1B762F7B4C534373AA66AC6691669DE6
          71CD010EC6B1E0F039D99C4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37
          DA7ADABEDA62ED72ED16EDEBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51
          BA85BADB75CFEA3ED363EB79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EF
          D11F373034083690196C313863F0CC9063E86B9869B8D1F084E1A811CB68BA91
          C468A3D149A327B826EE8767E33578173E66AC6F1C62AC34DE65DC6B3C616269
          32DBA4C4A4C5E4BE29CD946B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D5
          9C6B9E61BED9BCDBFC8D85A5459CC54A8B368BC796DA967CCB05964D96F7AC98
          563E567956F556D7AC49D65CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9B
          ADC4769B6DDF14E2148F29D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625
          F66DF6CF1DCC1C121DD63B743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E9
          57671B67A1739DF33517A64B90CB1297769717536DA78AA76E9F7ACB95E51AEE
          BAD2B5D3F5A39BBB9BDCADD96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4
          F0F758E271CCE39DA79BA7C2F390E72F5E765E595EFBBD1E4FB39C269ED6306D
          C8DBC45BE0BDCB7B603A3E3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE
          237ED67E997E07FC9EFB3BFACBFD8FF8BFE179F216F14E056001C101E501BD81
          1A81B3036B031F049904A50735058D05BB062F0C3E15420C090D591F72936FC0
          17F21BF96333DC672C9AD115CA089D155A1BFA30CC264C1ED6118E86CF08DF10
          7E6FA6F94CE9CCB60888E0476C88B81F69199917F97D14292A32AA2EEA51B453
          747174F72CD6ACE459FB67BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC
          9BB880B8AAB8817887F845F1971274132409ED89E4C4D8C43D89E37302E76C9A
          339CE49A54967463AEE5DCA2B917E6E9CECB9E773C593559907C3885981297B2
          3FE5832042502F184FE5A76E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92
          E69D5695F638DD3B7D43FA68864F4675C633094F522B79911992B923F34D5644
          D6DEACCFD971D92D39949C949CA3520D6996B42BD730B728B74F662B2B930DE4
          79E66DCA1B9387CAF7E423F973F3DB156C854CD1A3B452AE500E164C2FA82B78
          5B185B78B848BD485AD433DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859
          F1E022BF45BB16238B5317772E315D52BA647869F0D27DCB68CBB296FD50E258
          5255F26A79DCF28E5283D2A5A5432B82573495A994C9CB6EAEF45AB963156195
          6455EF6A97D55B567F2A17955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796D
          DADADE4AB7CAEDEB48EBA4EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE5
          1B5F6D4ADE74A17A6AF58ECDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A
          9D7F5DCB56FDADABB7BED926DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78
          576BBD457DF56ED2EE82DD8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F6
          45EFEB6A746F6CDCAFBFBFB2096D52368D1E483A70E59B806FDA9BED9A77B570
          5A2A0EC241E5C127DFA67C7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD2
          3ABF75AC2DA36DA03DA1BDEFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F
          579EA09D283DF1F9E48293E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515D
          BD6743CF9E3F1774EE4CB75FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3D
          AE3D477E70FDE148AF5B6FEB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D5
          73D7F8D72E5D9F79BDEFC6EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC
          5D7A8F78AFFCBEDAFDEA07FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E
          09879EFE94FFD387E1D247CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7
          B2A713CFCA7E56FF79EB73ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F3
          72EFABA9AF3AC723C71FBCCE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC
          40FE50F3D1FA63C7A7D04FF73EE77CFEFC2FF784F3FB25D29F33000000046741
          4D410000B18E7CFB519300000EC54944415478DAED590B7455E595FECEE3BE6F
          1E37EF04C88300E14D0095F0A8F21244D141A94A052CD5E9A085358E62AD5597
          9D1616D6A9636DB103EA88E2888E0FD0A24E2A202858411910094F0921842437
          24407293FBBEF7DC33DF7FEE81B22019648CCE6A9767B13939E7FCE7FCFBDBFB
          DBFBDFFBBF92AEEBF86B3EA4EF007C07E03B007F2300FCB52FF07F9537EAA0AB
          0D50E43468F126581DE588478E8C90134727C84AAC5C8F376683AF48725183A4
          B57C7EB4A57CD3A8696BF7B7B5B65C74B26FC2585D006884A2E621DEB1ED2A35
          76E201C48F4D94ED7EBBE2A0128A8DE312403C0C4424C403B6F6C3C74BDEFCF5
          8BDA53AFBF7BB44A8B85FEBF011C876E396E97A3A7EF91DAD63CA23853DC52AA
          0B92D3898422F3395F52747A20420031E8A120D400C1C453DAFEF04AFA92854B
          6A9641D7A2DF3E80632F2501C0EBD6DB562D57F52373644F0EE47437E0E07D5A
          5ED779962463BC2CC7791D8694882011F201A77C5068FC275F4AFFCDA25F372F
          066281A4ABBE2D0047FE955736243A362C55E21B7EAEE4F486EA498164B75279
          3B075AC57053CE1C51E85284CFDAA1054390DAE889D351EDCE5FE2E1556BEB57
          7040C7B920BE5100A776DF09291E1EA186366E507BE467A85919505C6EC85206
          9FA698C3FD94B8B0BF7916BA69042141FBB78308666A90AA9A117BBD2D7AE4A8
          B6F3575AE2FEF7803DCD40BE13B89BD02F8FD1CD8DC0B6DF02CF3F071CE50744
          D0184AD08F192AF0138E9B22C63500DBCF1F77BE11CE02A8DBFE20E4F62D4FA7
          E5B42EB0979442716790E7F97C22248F62A13427A741805FE2594AF0030E837A
          D1F12F21D2D48ED4C37ED41529B03626E2F931FD89DF13C002603921A71D06AA
          E9C79422209720EA6F06EEFA04E03FB4F16BA534D30E2A9F2E9E1180A5B371E7
          23380BA0F1CF4FF540DB8A4F3C43720A6D79257CBD940F0770446F3ECDA63016
          104E02D0BDBC7F324927DDCE9384E0D87BE0DA56835F5464E0CB1C0D4AAB167B
          7D7BF8FDD3B1F8E57C2B500E7CD490B442FB75B4C86BC0F4EDC081C9C0BDBCB7
          8363FE832027CF042ADF49BAB67D11413D014C5C0B7CC6FB3F13E3A86FA05300
          F59B1E9C6E89AE7DC773F910A86925E43D95D787902D0482748E50CEBEA4236A
          504832A894A037DAE11F3D059103D5B8F5B26C4C1E6347B13B888D4B9ABE78DE
          1F1F360A58F51910E4E08F29D514EBF3A4CA1DC00F689E25C381756BA8E4DBA4
          D68D24039F6FA3EC12AE5D0E2C200DF57701E24225F56DE91440DDFABB17DB6C
          1F3F92317C14D4D43E49E5310889583AE23E0D318D74B1E95015C685456425F2
          3EA241E659B16B088C198B86867A2C1DDF03F3667A302CAD099573EB4ECE6908
          66ED045A5C0C2046532B5D1043327AB23269E1DB818DC3E81D5A7BF10F81F5CC
          851C8ED5948366B0090A945184CBF7E906773B0150F5D68F7E9B9D55F54FD923
          4743760C232B86231AEC0DFFE13AC851E6FA5415713D086B5A29B45007E22D34
          846445429561EBD913FA0D37C0EBADC71FFEAE2FE6CE7063B0F3185EBBB92EF0
          C3FA808BE66CE7F21716229901ABD1A5A48DE3214E4D0FED5A02DC3717F8E065
          808CC11B94339616E9CF997C0541EAAB750E60EDFCC7B3B33E7B206B44051427
          3D20F5879E188450B3CB4838BACEBC1F67C689CB5CA738B51C16CB323DE1822D
          CF8DE8D593D0D4D48067BE3F00B36F70A34C69C47FCE3A14B9A33E601B08EC3F
          001CE234B5E7A455C954AE99D6F793EB4F72F1F8F4516025EFAD1189D1CC7B53
          998B73994AFE680288750AE0B1BB47FDE81FBE1F59993A7C10D4747A4C1A6878
          4E32D2A8C388019D312889734286264C48FA48B2306907FC151308C08B676696
          E207D73A90D1DE88F90B8E05D77B43CE7F611A64048AA5FE032385C1E0C98F39
          CBCC2B817B48F6035CD7B7EDE3BA3102F89D49A1E3621CA36D3783C7C1285C20
          EC4C7D4F740AE0E6C943C6FD6EA16D73E61545AA35A717B5EBC9BBB994345A3C
          958A526339C34CA7829A19C9C0D68386B1FCA36F2380935831A31873C65B103A
          DE826B1FAA6B7FD61F0BDEC2AC43CD7753A395E4BBB714B8211598BB01D83005
          788B1FD8CA8CB490549ACF283F4A37BD4A0EEC6114CEA6FFAF7F9841BE14F833
          C7ADA5BED59D0228ECD9C3F5D2FDF91F564C715CA696643330A9A0587D250F98
          D10940285D6428AE6B11C86A84B412D4ECE0B30602584C003E2C9F9E8F599729
          78E3BD563CF1663379AC6D7A1DE8C35C3EF2DC89C9911DFF486599E7A9BB410F
          8DE3965D4BCAB892D402BD125C057C311FA8E1E566CABB5D7A40922C787076D9
          C30FCC892D710E4D859AC3024E2665241671B10C24129950AD05889F62C04AED
          B0649E60F960836C2700A909D535F5585F790C5A4B3B0638A358F45C58AFAAF1
          1DE1A75F13F99BA9A47C1C309A01A06E62C1D1985CD60F998AED43726917D9E6
          AA7904C10BBB39AE8DF7F698F4ABEE32064491D6A7306FC08B0BA58DC3C64A05
          B63E6EA819348492E47FF8642AAC9E54241ACB90B074404E3D0E2DAAC2E6396D
          D0A8BDB503DEBD1D887DD98A57DF97F0D89B4689FA295FFE77CA263390444ACC
          31E716CBBA2811BC48AE1142119BC9DB624A81C9D526243D20C645BA2C259255
          A6A2FC7446FEB24537B6DDEDEEEF84ADD40525CD064965A9D0CAF9452F10BB9A
          D933816860336C6911E2A321A361C49B83D06B02D8B72D8259CB2CF8B2C1DF64
          524304EFE748E67F11407673EEB079AFB30A4F35014BE78FBB08009AA867F615
          CFCED3FF38626838CFDECF054BA11DB2CB6A940C91B674A6CD6B983D4BA1C7D6
          C291B1033A1733ED640CD1BA10E247C3786C8D0D8FAF0B90BE71B192BE88E40A
          EA45371D170540AF596E9F54B8F8D1698D3FCB2CB6C25AEA80AD48458C74F1D7
          8C474A9FCB489D08624D5BE12ADC05ED441051965E7A530455FB64CC596DD76B
          BD3EAF69FD55C2FAFAD4A951512F2148A6B491D26211F471410D8B7E22F19595
          EDECE80400CBC594B4812B66ABEF5C5DEEEB6DCBB540C9A7476D2E044EB06A71
          3820C5FC502D3AACCE3DD09ADAA0352718BC093CBEC98D27D61BDCDF91A328AF
          BCD2BFFF9149252555484F6F829BC520A96880F0125F6DAD719604A0EE06C02B
          F5A68ADC471EBBFEE42F321952AA5316251BB4ECB1886B6EE8E176F6CC3E5803
          FBA173A5915AE3A83EC62CF6AA4DBFA9D11F9C9596064F0ED35836ABD8AC2C66
          DE0C3F3C9E0D71B77B85C56E5BAFB3F9C1B163CC3DFB207FBEEB9B00C02AAB57
          41F98A19914DE545A73CB29D0064098EA1BD602BC922854208EF6B86D6780A92
          2641F725B0F565157DF76A28E4BBCE9494A4E21E0FA40C4FF2EF9C1CE31C73BB
          376FAAA9993DEDE965220B09FE74A9E5D7029097DFC3F1DC94E8E757F46D2953
          D364447D5494855B4A39CB685D46C717321941BF683A3E659E91593BF663D2E8
          C1772DA4196C36432417972501A2A0005209FB8CC25E88A7A735BEB0F5E34977
          BDF88248A3319CD73B770B00A72B15BFBF5AFFE4BAC1FED1165228C8D22AAE58
          905D11E5CA2CC1B7478545D1B07D4B02B59B250CA5F2AC9C4055CF760EC63715
          25193704210048C3CB21F5EB0B9FC55235E8FEFBAEF7B6B5893259A44AED7CE5
          BE160051A5DD3B71E0D2B2E6833F17059BA740C538D63879B7643395FAE15BEF
          C3CE8F803757C73084C55D05952FA288242F5F308B6404B0E4611A1E3218F298
          D190FA94E28343879E9ABA7409BB4EA3740EE2FFB08BD135001E9ED4B482814E
          CBFBA59EE8E06B6E52D077480AD45C96635A2B428D5578FBB9304E6F8D632255
          1E43C9306AD5FFE5B0B034C9CB853C6E0C948A2BD06AB79FCC99FFF7B3F8E4B0
          094278E2ACD65F1B8038A64D18BA2CCBDAB1D0C271ADBE200E378491E37162E2
          A42BB16565258ADB439841B54752CE2C9D5DCF26197452860F8332E14A484585
          B865F9D38BDFDEB5B312C956B315C99AA8FB002C9C35EEDEEF956A4F2A4CE175
          2D117CB4DB8B81FD8A70FBBC3BF1E3F17761202D7F2B57FE7202502F3A1D8C98
          90CBFA421DFF3DC87D4BF1E89FDE7BFBF1F72B5FE593DD947A9CB3CDD22D00E6
          DD3876FCB8BECABA60544B69F4E9A83AEA438FDC4C4C1C35144FDFB79CD5998C
          D92C71467C55009C47EE5D0C751C5BD73EBDF1F0863F6D7E72CB66B16A8BB2FA
          B0E9854B07E072392E7818678A5C78DBC471C519914A5DB1B93B3A22F8EF030D
          CC84B9983E6D0A16CFFD155239E67696EF630D0A49179D5000504A4BA05C3E02
          72512FCC5BB7E6C337F657311D18FB3E7B91AC52E3970CE0D619932E78A82574
          3854AD6268B1B3524B203D1C8961D7412F0A72D271DD3593F0FC3FAFC4C9BA13
          8C012BA6D20B39F48672B119AD5602A00706B1E7CECED2CB56ADA86C0A06F69A
          00048DD80224772E2E09C0EA677F73C143997C6D3BDD3CF2C8811D1F58ADD6B4
          60288C03D55EE4646762EAC4D1F8F0AD2D38F0E16EF4A1DA330982DD345CE66E
          51A707BB3AC9CD12BDB810728F7CEC8C855A276F5C27AC5F7D0E800618ADF025
          021834A0EC8287B1B886A282ECDCB1E5051B2D0A06D7B3E7ADAEF52293F9BC62
          E440F8DAFCD8F0CC7FB11E8AE32A0298482F14128CD34CA7670925E28B2289FD
          A41437E4AC4C4869A9B8ADFA8B5DEB4F35D522D99909007B4C0F5C3A85BA0A62
          95B97BFCE8F269038A3DABAB8F3678EABDA7108BC509C20D576A3AF6EEF81285
          A1B861F509043182207AF22A95221ADB2490E4B7C5DFB2CD6A807819E1BA9F9E
          AC15412B38BFCF04B01FC9F520D16D00CC61E97939998BF458F8A148286230C4
          E6702210D3E0F7FB035C9ADA4AA0E6F30BF210D2A88C524075D3A8B8C3A05492
          56224BB9F9F736C4BC3F81EF503CB9A5516752E733245BC77674671A350FBB2C
          CBFD1D76CB1DB168FC1A5E17D23356C6845040587147066D5B04E55A3BA4AC6C
          AA2B0064F19C4E7199401448D17711AA790D21D1F0089E9F36E923B61345201B
          7DEF9949BB138038C48F0462C3743AA58222767C4521B6C35440F4BBFD3259E9
          7820F7CB8322CA37258D0048E8401DE2A77621762A0C5DF05B6419D1C9D49A8A
          5751D820183F889C2DEABA1B8018904AE96B4A8AA984D83A3961021299A03FA5
          17923B5F0EFC65274C4C249437F7E88D6015DE3B680269C5794D7E77033803C2
          8A337B8D498584CB132620F14B88D8FD2A46F29791F473C626CCB182E32270EB
          4CC5EB4DE5A338AFB9B924005F49FBAE418A072246C5569D6809724C115E709B
          5E100002A6D75A4CAF890D5C7F67CA7FDB00CE8090F197ED70A138DB3163B34A
          3115141E089A4A07CC6B0D5DB4955F45B7FF01DD6D75FB1866484B0000000049
          454E44AE426082}
        Visible = False
      end
      object GroupBox5: TGroupBox
        Left = 168
        Top = 32
        Width = 57
        Height = 217
        Caption = ' Volume '
        TabOrder = 2
        object Label4: TLabel
          Left = 15
          Top = 196
          Width = 26
          Height = 13
          Alignment = taCenter
          Caption = '100%'
        end
        object audioeffectplayer_volume: TTrackBar
          Left = 16
          Top = 16
          Width = 25
          Height = 177
          Max = 100
          Orientation = trVertical
          Frequency = 25
          TabOrder = 0
          TickMarks = tmBoth
          TickStyle = tsNone
          OnChange = audioeffectplayer_volumeChange
        end
      end
      object bpmprogress: TProgressBar
        Left = 8
        Top = 280
        Width = 73
        Height = 9
        Smooth = True
        TabOrder = 3
        Visible = False
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 32
        Width = 153
        Height = 217
        Caption = ' Waveform-Einstellungen '
        TabOrder = 0
        object waveform_zoomin: TSpeedButton
          Left = 8
          Top = 140
          Width = 33
          Height = 25
          Enabled = False
          Glyph.Data = {
            36030000424D360300000000000036000000280000000F000000100000000100
            1800000000000003000000000000000000000000000000000000E9D9D9E9D9D9
            E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9BF00
            00BF0000E9D9D9000000E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9
            D9D9E9D9D9E9D9D9E9D9D9BF0000C0C0C0BF0000BF0000000000E9D9D9E9D9D9
            E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9BF0000C0C0C0BF00
            00BF0000BF0000000000E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9
            D9D9E9D9D9BF0000C0C0C0BF0000BF0000BF0000E9D9D9000000E9D9D9E9D9D9
            E9D9D9E9D9D9000000000000000000000000BF0000C0C0C0BF0000BF0000BF00
            00E9D9D9E9D9D9000000E9D9D9E9D9D9000000000000C0C0C0C0C0C0C0C0C0FF
            FFFF808080BF0000BF0000BF0000E9D9D9E9D9D9E9D9D9000000E9D9D9000000
            808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF808080000000808080E9D9
            D9E9D9D9E9D9D9000000E9D9D9000000C0C0C0C0C0C0C0C0C0000000000000C0
            C0C0C0C0C0FFFFFF000000E9D9D9E9D9D9E9D9D9E9D9D9000000000000C0C0C0
            C0C0C0C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0C0C0C0C0000000E9D9
            D9E9D9D9E9D9D9000000000000C0C0C0C0C0C000000000000000000000000000
            0000000000C0C0C0C0C0C0000000E9D9D9E9D9D9E9D9D9000000000000C0C0C0
            FFFFFF000000000000000000000000000000000000C0C0C0C0C0C0000000E9D9
            D9E9D9D9E9D9D9000000000000C0C0C0FFFFFFC0C0C0C0C0C0000000000000C0
            C0C0C0C0C0C0C0C0C0C0C0000000E9D9D9E9D9D9E9D9D9000000E9D9D9000000
            FFFFFFFFFFFFC0C0C0000000000000C0C0C0C0C0C0C0C0C0000000E9D9D9E9D9
            D9E9D9D9E9D9D9000000E9D9D9000000808080FFFFFFFFFFFFFFFFFFC0C0C0C0
            C0C0C0C0C0808080000000E9D9D9E9D9D9E9D9D9E9D9D9000000E9D9D9E9D9D9
            000000000000C0C0C0C0C0C0C0C0C0C0C0C0000000000000E9D9D9E9D9D9E9D9
            D9E9D9D9E9D9D9000000E9D9D9E9D9D9E9D9D9E9D9D900000000000000000000
            0000E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9000000}
          OnClick = waveform_zoominClick
        end
        object waveform_zoomout: TSpeedButton
          Left = 48
          Top = 140
          Width = 33
          Height = 25
          Enabled = False
          Glyph.Data = {
            36030000424D360300000000000036000000280000000F000000100000000100
            1800000000000003000000000000000000000000000000000000E9D9D9E9D9D9
            E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9BF00
            00BF0000E9D9D9000000E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9
            D9D9E9D9D9E9D9D9E9D9D9BF0000C0C0C0BF0000BF0000000000E9D9D9E9D9D9
            E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9BF0000C0C0C0BF00
            00BF0000BF0000000000E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9
            D9D9E9D9D9BF0000C0C0C0BF0000BF0000BF0000E9D9D9000000E9D9D9E9D9D9
            E9D9D9E9D9D9000000000000000000000000BF0000C0C0C0BF0000BF0000BF00
            00E9D9D9E9D9D9000000E9D9D9E9D9D9000000000000C0C0C0C0C0C0C0C0C0FF
            FFFF808080BF0000BF0000BF0000E9D9D9E9D9D9E9D9D9000000E9D9D9000000
            808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF808080000000808080E9D9
            D9E9D9D9E9D9D9000000E9D9D9000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0FFFFFF000000E9D9D9E9D9D9E9D9D9E9D9D9000000000000C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000E9D9
            D9E9D9D9E9D9D9000000000000C0C0C0C0C0C000000000000000000000000000
            0000000000C0C0C0C0C0C0000000E9D9D9E9D9D9E9D9D9000000000000C0C0C0
            FFFFFF000000000000000000000000000000000000C0C0C0C0C0C0000000E9D9
            D9E9D9D9E9D9D9000000000000C0C0C0FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0000000E9D9D9E9D9D9E9D9D9000000E9D9D9000000
            FFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000E9D9D9E9D9
            D9E9D9D9E9D9D9000000E9D9D9000000808080FFFFFFFFFFFFFFFFFFC0C0C0C0
            C0C0C0C0C0808080000000E9D9D9E9D9D9E9D9D9E9D9D9000000E9D9D9E9D9D9
            000000000000C0C0C0C0C0C0C0C0C0C0C0C0000000000000E9D9D9E9D9D9E9D9
            D9E9D9D9E9D9D9000000E9D9D9E9D9D9E9D9D9E9D9D900000000000000000000
            0000E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9E9D9D9000000}
          OnClick = waveform_zoomoutClick
        end
        object ScalingLbl: TLabel
          Left = 84
          Top = 152
          Width = 11
          Height = 13
          Caption = '1x'
        end
        object CheckBox9: TCheckBox
          Left = 8
          Top = 72
          Width = 89
          Height = 17
          Hint = 'Umschalten zwischen Mono- und Stereoanzeige'
          Caption = 'Stereowave'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBox9Click
        end
        object effekteein: TCheckBox
          Left = 8
          Top = 88
          Width = 81
          Height = 17
          Hint = 'Effekte beim Abspielen der Audiodatei starten'
          Caption = 'Effekte ein'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 1
          OnMouseUp = effekteeinMouseUp
        end
        object Repeataktiviert: TCheckBox
          Left = 8
          Top = 104
          Width = 81
          Height = 17
          Caption = 'Repeat ein'
          TabOrder = 2
          OnMouseUp = RepeataktiviertMouseUp
        end
        object Wavezweifarbig: TCheckBox
          Left = 8
          Top = 56
          Width = 137
          Height = 17
          Caption = 'Waveform zweifarbig'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnMouseUp = WavezweifarbigMouseUp
        end
        object lockmouse: TCheckBox
          Left = 8
          Top = 120
          Width = 137
          Height = 17
          Caption = 'Maus/Tastatur sperren'
          TabOrder = 4
          OnMouseUp = lockmouseMouseUp
        end
        object Wavedarstellung: TComboBox
          Left = 8
          Top = 16
          Width = 137
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 5
          Text = 'Anzeigemodus 1'
          OnChange = WavedarstellungChange
          Items.Strings = (
            'Anzeigemodus 1'
            'Anzeigemodus 2'
            'Spektrum')
        end
        object ScrolltimelineCheckbox: TCheckBox
          Left = 8
          Top = 40
          Width = 113
          Height = 17
          Caption = 'Autoscroll Timeline'
          TabOrder = 6
          OnKeyUp = ScrolltimelineCheckboxKeyUp
          OnMouseUp = ScrolltimelineCheckboxMouseUp
        end
        object Videoscreenbtn: TPngBitBtn
          Left = 8
          Top = 172
          Width = 137
          Height = 37
          Hint = 
            #214'ffnet einen Videoscreen, um parallel zum Audio eine Videosequen' +
            'z laufen zu lassen'
          Caption = 'Videoscreen'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = VideoscreenbtnClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
            F4000000097048597300000AF000000AF00142AC349800000A4D694343505068
            6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
            F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
            561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
            7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
            1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
            01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
            C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
            00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
            00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
            CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
            4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
            48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
            223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
            560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
            2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
            FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
            F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
            4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
            79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
            812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
            0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
            170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
            48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
            90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
            5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
            5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
            8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
            272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
            48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
            6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
            A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
            2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
            1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
            192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
            3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
            09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
            46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
            EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
            4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
            EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
            79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
            3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
            67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
            6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
            A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
            5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
            D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
            743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
            4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
            D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
            C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
            3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
            FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
            0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
            15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
            476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
            BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
            F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
            A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
            6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
            68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
            949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
            F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
            DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
            772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
            A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
            955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
            EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
            CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
            26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
            8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
            B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
            7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
            EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
            E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
            5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
            EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
            EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
            FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
            CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
            ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
            CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
            F73EE77CFEFC2FF784F3FB25D29F33000007354944415478DAED576D4C945716
            7EDE1918660686810C238A48F9763BD5D550291F554815B1F891D6603686B8AE
            DD5513936DA27FEA2F63767FF68F6ED2644DD33492FE688D452B2A82496DA6B6
            5A3F4165401151B4506006668601861960A6CFB9ED585A6D9ACDBAF1C776929B
            F7DEF7BDF79CE73CE739E782168D46F13C7FDAEF009E3B80DCDCDCA77E080402
            8FE731909AA641A7D3A9F5CCCC8C7A171F1F8F502884E9E969242424A86FB24E
            4C4C94A75DAFD7CFE3365B241219E6BC8B36269F3980C9C949FDD4D454C46432
            45E55B301884C160C827800D74FA32F7A4F1FD10B737707EE29902888B8B7B29
            1C0EBFC731C17737B867824E8BED767B455E5E5E8AD16854B6F80E7D7D7DF078
            3CFFA08D7FF268E43F01A0892F0E130DE9E82C85D1CDA73323A37DE72F5BFF5C
            FD6A69093A3B3A119C0C223B2717F98585C87A211B269319F7EE75E3FCF9F318
            1B1BC3E9D3A7FDB4FD2ACFBA1400A27C2A00BFDF9FC3BC9571E3CB5C2E24EA4C
            CEED8C5297969666B2D96C49E1F09456B2AC48E728AD44EFB41973930C4837C7
            21D5A843A25E8341CF141912E00F86D0D4D44420F770F3E6CDC8C8C8C84ADA73
            2A001919194F3867C46F721C604EB325C7429F0CA17F626202656565D8B66D1B
            662233B09A8CF8E4C6B7B8134942029D4ECF4C632A1C823E320D8B3E8A3FA65B
            600B0C2800ED2E9730EBA2EDD7188C5B01484F4F57399D558E498CDC59585858
            24EC708E5F962A5380F5EBD76391E3450C8DF8F0E16D1F26CD567819A937348D
            C94814119D1E414D8FB5E9062C1D68C3A10F0F636070B09BE27C9B269A1F8B30
            33335395CDAC9F50F21501E4083B525EB37F0248CAADAEAE0ED919E968EAE8C3
            E1FE1984A141D3694830181017AF1771229EA5B8D5EC87ABE9283E6EF8EC229D
            6F64E483B3C5AD00B08C94C2634AE7877AB3D9BC95297822FA58BD575656A2A4
            68297A4DF3E00C262010657AB835CAC8CDF13A988D06E4588C58D17F0D0D9F7E
            8A2F9CCE568BC5B291A9EC153B52AAA3A3A33F0190FC4A743F82B0F2B195CE45
            ADF325703EC759EBF114E18B0421CD45575850807535AF23D596067DAA1D21AB
            1DBE040B7C7126F46B262C8DFAA13FDF88C0D48C0AACBEBEFE267D2CA7AE02E3
            E3E33F0058B06001B858401095345A402056A2F4F2401B013CE4BC9F0EF3F8BE
            94355D939A9A5AC22E6771381C58B66C99021E0A4E60D4EB459C0EB0265B61E2
            D0AC3684C702E8BBDF8D5555AB919C9C8C5DBB76A1A3A3A386369BA5CC550A28
            C26AE6EBBDD2D2D282A4A424B044D4181E1E96521CA1E07AE9348FF425676767
            63C58A1590E7AD5BB7C418366DDA84A2A222A5A391112FCC66936271CCE785D7
            E7877734403DE8C5168E1C3982EBD7AFEF60B01FC4B4A5D169FFDEBD7BE71517
            172B9412916C7EF8F021BABBBBF1E8D123F59EB50F2FA3946E565D5D8DB56BD7
            E2C2850BB87CF93276EFDE0D8254DD5168957A1F66103EEE97754CE4478F1E45
            6767E746AE5B24851C131A1B4A70FFFEFDC6C6C646D5D7A97E1430B712A59428
            F38E07BDBDB87FFF3EDC8383707B3C90F6BA7DFB7608E883070F222B2B0BAB57
            AF464F4F0F4E9E3CA9D8930A1240725E2AE2C183073871E2C420BFED20F53E3A
            F770F40880B17DFBF6254AA390832216C98FCFE7C3C2850BE1702CC22BCCB538
            31261AF1F5575FE3E2C58B2A153B77EEC4B973E7D4BAB6B656457BECF87196A3
            0E363212AB18014CE7C2D621027AF7C7E8BD1CBEC7009A9B9B9501412B0A15AA
            8511B7DB8F1C9B1955C5E528FB531D5ACE9E42D79D3B58B26409B66CD9A29839
            73E60CAAAAAA14632DA74E2144F0598B164134254D4B4AAEA1A1012E976B3741
            FDEB67B7E1D300C8A5E176BB55DEFDFE7184C7BDD851F1125E786D333E3E7512
            41AA3B2525053535354A2357AE5CC19A356B50989F8FCFC9402AE94FB6DBF1DD
            C000BAEFDE55F433A0566AA88E0CDCFE25807102304B0A0400BB95CA9DA440C0
            686C2EFDDFB9B1382B03B58CF8EC974E78084EC42A79BF7AF5AA8A74E5CA95B0
            13B0ABB35389EE1ADFF7523B030303BD64E17D96DE47B4FF4834F1330054EF18
            4598D8D2D2A2E8B25AAD2A6752A372F104393C23C32C311FFEF6D7B7E43653B4
            CF993347094D80C8E52420E48C88594A94CCB4B3E9D4D3F1610E8F3439A9AE27
            00D059E39E3D7B362C5FBE1C972E5D524A9614C8ED270292A7884958913D4EA7
            5395A8801D1A1A1A632333F26F8A3829D5AEAE2EB4B6B6CA1F25FFA67E8EC98D
            A79A0D85FDAB00D88AFF40E3A7A9E85CA1549C0A88B6B636955F11A4BA221961
            7979B952BD3822BD5798A2CD04328F9457D1511A9D7EC386758CF360EC0EF94D
            00F9140ECBAF8051FF9D946EE6253367D5AA5558BC78B13A2CCDA8BDBD5D5585
            30709C2293BCD3502D011C1376E42E91A75C5E3266DFA0BF0940EEFCD8073231
            9725B38E86DF20ADC56CCF732B2A2A2020459C12FD81030726B96F0F537348F2
            1F03202912EDFC570044F5A260C93B8D3A68A8848EAB28B8F29C9C9CF964A39F
            C2DC4BAA8F88E1FF190079CA5AA2E6DAC2C3991C0ED67E0F9DB7C68C3C1300CF
            FD3FA3FF7B00DF0342C0954155E5C77C0000000049454E44AE426082}
          PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
        end
      end
      object TrackBar1: TTrackBar
        Left = 0
        Top = 0
        Width = 9
        Height = 79
        Max = 5000
        Min = 100
        Orientation = trVertical
        Position = 1000
        TabOrder = 1
        ThumbLength = 7
        TickMarks = tmBoth
        TickStyle = tsNone
        OnChange = TrackBar1Change
      end
      object TrackBar2: TTrackBar
        Left = 8
        Top = 248
        Width = 81
        Height = 17
        Hint = 'Wavedarstellung skalieren'
        Max = 375
        Min = 100
        ParentShowHint = False
        Position = 100
        ShowHint = True
        TabOrder = 4
        ThumbLength = 10
        TickMarks = tmBoth
        TickStyle = tsNone
        Visible = False
        OnChange = TrackBar2Change
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 330
    Width = 1008
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object PlayEffektaudio: TPngBitBtn
      Left = 6
      Top = 8
      Width = 41
      Height = 25
      Hint = 'Spielt aktuelle Audiodatei ab'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = PlayEffektaudioClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000000097048597300000AF000000AF00142AC349800000A4D694343505068
        6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
        F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
        561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
        7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
        1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
        01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
        C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
        00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
        00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
        CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
        4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
        48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
        223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
        560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
        2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
        FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
        F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
        4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
        79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
        812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
        0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
        170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
        48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
        90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
        5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
        5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
        8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
        272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
        48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
        6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
        A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
        2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
        1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
        192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
        3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
        09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
        46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
        EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
        4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
        EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
        79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
        3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
        67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
        6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
        A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
        5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
        D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
        743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
        4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
        D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
        C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
        3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
        FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
        0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
        15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
        476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
        BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
        F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
        A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
        6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
        68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
        949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
        F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
        DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
        772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
        A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
        955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
        EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
        CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
        26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
        8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
        B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
        7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
        EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
        E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
        5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
        EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
        EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
        FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
        CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
        ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
        CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
        F73EE77CFEFC2FF784F3FB25D29F33000002AF4944415478DA8DD35B4853711C
        07F0EFD9CE2EA5D4435A2D282C29E728A8F7280CEA2588AE56C2D2A0074B4848
        B3392F902F091625592F114189500476811443A7D381264B4CD4B45C9BE6653A
        776967D3ED9CB3D3EFB45149173DF0E53C9CF3FBFC7FFF1B83CC5A0520EDDEBC
        65DDE3D55ACDDA117B6B2DA69F3E80E80F60994792243048AF495724698BAB4D
        07F2535392D0F0C6094B5BAF55703C2B03D7DBB53C005D867AEB91D2AA6A532E
        A3E4E10DC730E40AA3CB36C6F9862DB59869BC83C8B4E73F404A862AED98A9B0
        B2244F64784CF9A2084401EF8284314700F3C3FDDD70BEA884A7E32D10FB1B90
        AA576D3B6ECABB5A9C1B9508F04731CB89985F9410101408514731B72782CFAF
        EAE07A7913E1C999A500B35ECFA69F306717161943311E9304B8B91866433144
        44F2D52A80A5048380736400838FAE61BAB5E917A0D8A067B79F321F2EB862E4
        8428267CD405011C4FC50ADA20A59200165011027A8F0ECDA1A5200FDF3EB510
        2030501290916D3E985F6C0C44A370F905CC8424884CA2588E0CC9487232F075
        4EC2939375F0F5D71030C180958133E6AC8B25461FCFC3E98BCF5F52FC06C8D3
        5069007F18B03EFC889E1BF510C20D047C2160A39E35E498F75F32C501EAC01B
        95DB4F146BB58048D8E84008B67B1F30D66881B8F09AE6D3474084005D26BBD3
        589E75B934E7071088613E420BA452C7479DF30AE8793E89DEBBEDE01C9D54D8
        4E7152C4F822B23A03BBEB5CD9A1A28A1CBFC0633C04B8790DF808EDF9903D8C
        CEDB3D703577415C6CA3223B25B8741B559B0CEC9EF3E547CDD7CF7210E00A2A
        E018714B116BFD28DEDFB7819BB0D0BFF2C8E372CD9F0729394D07FDE90BFBF2
        2BAAD46B34E86EEE0870ADB7DEC1D5D49168B78F12FEF7514ECDA4C55A95A2D0
        EDAD661818C4C1063B221E1B7DB752A65670997E3E6B293B12A339280B2BB9CE
        DF0170EC61F09B3BA4610000000049454E44AE426082}
      PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
    end
    object PauseEffektaudio: TPngBitBtn
      Left = 55
      Top = 8
      Width = 41
      Height = 25
      Hint = 'Pause'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = PauseEffektaudioClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000002B744558744372656174696F6E2054696D65004D6F20323420466562
        20323030332031373A34353A3439202B3031303026DC5D220000000774494D45
        000000000000000973942E000000097048597300000AF000000AF00142AC3498
        000002984944415478DAA592DB4B14511CC7BFB333B3B3B3A18538E63575176F
        AB6D5899A11444B0115D0C0AAD1E7AEA460F5DFF8090A020307AA888282824B5
        A81E042382C297A22844D15231776D696D7675B69D556776DD9D99CEEE80303E
        D6793997EFF77C7EDFF3E350F8CF41ADAC1AEE75E617E65C4A6A1A6D6758438A
        33BDF8DC712AAB6DEB7B24AC4D7724D3698A65584D12E52E8C9EEBB4002A0EF6
        C93D377DB9C1F904583B8BAEC7C3C6C70F4A1E9428DDBABB78EEFAF9266A564A
        C0C1DB71F9C6A01C7879649D0590EF7BAA5C39B39DFF454C363B8337EFA73135
        E217A0B2B4A7B9503C7AC003F1CF3258078727CF86D4D8EB76A70590EBEB510E
        B535F2B3B1243486C5B7912022635101CA025DD15424B6B4B81196D30067C7A7
        C1717569E0B015E0DCF35CD9D85A4700CB48D818C4832292E179014B715A7095
        8A1BEACAF03BAE2145DB218DFB557DA0CD0AE0F6BE52B81A171F57F56C1584C3
        C06C289BC0595929DA4A8AB198209AC30104022AFAF75901D4FE7EC570BBF9EC
        26630A85801999249069CA5D201A2525C444EC1C074C4FAB78E1B302D036A0A0
        B6D604F0640A06814844C0628C46519988F272C0304C6D725245EFAE5580F6B7
        0AEAEA4D40A64A0610FC296041A6E1AA320199044E726FECBB8AEED65580E383
        0ABC5E1EBA6E56F1FB811F120144697848824A1756D28D8DAA78D8BC0A70E2A3
        82C64D7C3666A6CAD494D94459A25141125457230BCF68C3C32AEE6F5ED5C493
        5F1463EB1613C0D9C83B4982998080984E539E52D1A8AA31DD196D8824B8E3B5
        02F80B23F29A9DDE5C294E7AC59083899081A89487488ACE692898B3D59751F1
        25A2B144FB3A2EE3B6C7FA9571ECDD55AE70FDC5544AA37586319072F4E2AEFB
        6CD6747AE201E34C7568699DD25946C37CF416BA775CB302FE71FC0590700E20
        CDB538970000000049454E44AE426082}
      PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
    end
    object StopEffektaudio: TPngBitBtn
      Left = 102
      Top = 8
      Width = 41
      Height = 25
      Hint = 'Stop'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = StopEffektaudioClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000002B744558744372656174696F6E2054696D65004D6F20323420466562
        20323030332031373A34353A3439202B3031303026DC5D220000000774494D45
        000000000000000973942E000000097048597300000AF000000AF00142AC3498
        000002634944415478DAA593CD6B135114C5CF9BA4F9C06A5C387511EC1FE04E
        44AD06ADAEC460518A2E6A1B8845445DFAB1928AAE5D8B284594225528BA29DA
        22A80BB588B15644936E6D9C64E6D5A4496692743233CF9B992996B6BB3EB803
        C39BF3BBE7DEB997619387B9CFDDF72EC6BA3A6F6DED0C864CD386234021E0D0
        B56DD327C281804421C01843D311A655ADDFC6B74BA32E2076F471FECD8353F1
        F97C0DEA9209AE9B28E936CA750B3553A0DE126810A8D5CE170822140D233395
        C98B77E776B980EEBE71EDEE8D237276A10AADDAC25FDD42A94E808683EAB280
        D10265054C72012980D096082A73596E4D9FE97201F1134FB591AB87E5DC6F1D
        5ACD220716160D1B250254085031A90A46E240C08B7004C8FEE298EAF7003B93
        E3DAF5CB0939FB47874A00AD668313803728BB0537AB2B947C48340AFCF8C931
        79D203C87DCFB52BC387E49C62A058B550A4FA55C3C152932E03AB32AF405CC0
        778E17491F707A423B9FEA9173853A0A551B05DD8142E1ACD896D640DA80D9AF
        1C13C73DC08EFE975A6AE8809C551A506A8E0BE04DF1DFFA5A481B9021C0B363
        3EE0ECA43630B89F1C34DCCC8A2E5036D9FACCAB4BF8F29963ACD7070CBC2200
        95506CBAE2BCD1EE3CDBD87E3B22F4176666389E247CC0D0B436983A28CFABCB
        50484CBDC4A2EB6003FBC12039A0F70F198ED17D7E13D36FB5E1748F9C554D50
        1F419540694A34CAD2FA1ED0882342B24FB31C0FF77A806DE9F7F99BD77AE339
        B545F6198929EA12CA56BB0C7F6B484FABE09D0E8A8F730BB8BFA7DB5BA6E4EB
        0BDBE3B1918E702044BBE4CEBCE578B32F18F384125967C273E238266AC61D8C
        251EB1CDAEF33F37052D207B81B0210000000049454E44AE426082}
      PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
    end
    object movefileup: TPngBitBtn
      Left = 244
      Top = 8
      Width = 41
      Height = 25
      Enabled = False
      TabOrder = 3
      OnClick = movefileupClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000000097048597300000B1300000B1301009A9C1800000A4D694343505068
        6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
        F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
        561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
        7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
        1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
        01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
        C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
        00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
        00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
        CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
        4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
        48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
        223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
        560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
        2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
        FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
        F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
        4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
        79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
        812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
        0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
        170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
        48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
        90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
        5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
        5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
        8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
        272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
        48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
        6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
        A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
        2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
        1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
        192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
        3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
        09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
        46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
        EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
        4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
        EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
        79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
        3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
        67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
        6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
        A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
        5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
        D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
        743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
        4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
        D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
        C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
        3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
        FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
        0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
        15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
        476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
        BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
        F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
        A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
        6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
        68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
        949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
        F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
        DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
        772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
        A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
        955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
        EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
        CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
        26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
        8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
        B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
        7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
        EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
        E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
        5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
        EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
        EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
        FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
        CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
        ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
        CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
        F73EE77CFEFC2FF784F3FB25D29F33000002F24944415478DA7D935D48537114
        C0CF5D9BB339E7CC4A932C4CFC40AD34C42CD0D488A484B2B75E7A0982903E1E
        92104B2B847A081F8C0C421FCCA1855F44CDADCCA5951F4958A696CE697E443A
        9D77BBDB7577F7EE7E746606ADB43FFC1EEEFF9EFFEF9E7BCEF913B0CEBAFD8A
        3A31FC83AD915B07CED516E59970CB85087FC7116B1D2E7F49E5F49B175F6878
        AB6209B6789DBD0F2F773FB9DB84AF6C88F85FC175BD3D7D64CE63DA1DA90C52
        4A0C0C9B2780E4B59E7953E5C54F86EA160CB1FF29F11314355B932DA4D09914
        A509532903806645F0D036B08C8F03C58538BDBD15853D465DDBAA44F2139CAF
        5BDC31C7706F6323353B344A3938181EBC8200BC24038F0B251353B0551BEA48
        703CBD5A7EEB46F3EF4C5604EFC7A8F06B6DAEAEF89DEA78AD4A010EB7174449
        028E1711090489008626C18C927D5121CB310E63715969E9633C4A128B4B64E8
        9D0EA789536C4A898908049EF302C309605EE08017C4952C588E0749260737B5
        0093B3F390971842539D95850D0DF57AA2AC69BAA5AED3763C79BB5A5CB433F2
        FDA991F2E86D0AE8B278F02F310B2C17EBA6607E660E05023E4A04B90CB2B399
        CAE98AC24367889453257143AF1B1381A552C4CD07F69E2EB9773235560D1DA3
        341004012C0FC0799C60191C87247BE34097A96D44049933283898722D7CEBF6
        D5408584235A45D2A58C820B57AA92A355D0FEF597C057039EA361F2B305F203
        9EBD79545BDD80B143881BA188D54EC87CC5DC985D7734B7204BEF1398C66890
        4409BC88877583736A06988EB256C7EC871A0C7D87D0BE56FACD812A5B979799
        9F6188DFA581F62F1410D8694EF065B00CD4AC15ECCF8B5BC0FEF10186F6AC66
        E03F48AA1C5D5EDA917443020ADA064990635E3C76DAC3D0C02ED8C065286902
        FB401586F621CC3F02754EFDB1B8EC34FDC13D61F07D890172598079170F36BB
        0B5CD885E0FE9B4DE474DFFA02CD615D567068900E38A75A1285809559C51A10
        1BF0163978C8D5180D467DEB7DDFECAD29C0158824201948C41A17756EF5EBA3
        08EBDBF809749374DFFE0E824E0000000049454E44AE426082}
      PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
    end
    object movefiledown: TPngBitBtn
      Left = 291
      Top = 8
      Width = 41
      Height = 25
      Enabled = False
      TabOrder = 4
      OnClick = movefiledownClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000000097048597300000B1300000B1301009A9C1800000A4D694343505068
        6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
        F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
        561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
        7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
        1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
        01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
        C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
        00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
        00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
        CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
        4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
        48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
        223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
        560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
        2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
        FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
        F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
        4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
        79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
        812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
        0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
        170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
        48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
        90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
        5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
        5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
        8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
        272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
        48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
        6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
        A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
        2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
        1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
        192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
        3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
        09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
        46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
        EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
        4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
        EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
        79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
        3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
        67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
        6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
        A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
        5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
        D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
        743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
        4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
        D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
        C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
        3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
        FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
        0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
        15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
        476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
        BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
        F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
        A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
        6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
        68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
        949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
        F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
        DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
        772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
        A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
        955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
        EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
        CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
        26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
        8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
        B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
        7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
        EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
        E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
        5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
        EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
        EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
        FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
        CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
        ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
        CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
        F73EE77CFEFC2FF784F3FB25D29F33000002F54944415478DA7D925F48537114
        C7CF5D9BB339A766A5491626FE41AD34C42CD0D488A484B2B75E7A098290FE3C
        2421965608F5103E1819843E98430BA7123567994B2BFF1296A9E59F69FE89D4
        39EF76B7BBDDEDEEFEE95CD3D0461DF83CFCCEEF9CEF39BFDF39046C347F241E
        4947C2C1D7E6915E6414F1480E62FDADE6A836333024400BAC5D2D0ABC9F2839
        0511884D00161B07399A5643ABBEF9217AFB10C647409D5D7722362B557F785F
        28FC58668074F2B0E0E0C062758063761E02FB6FEBC899DECAD52E7C0554D9DA
        DCD4636986F83D1A681924412E03E00402DC0C0D1EB3051C86621D5807FE2390
        A5CDCDC84B37C4A140DB570A087C03CB8BC0B14EA0E616C1FAB2A809AC9F1E61
        6837E25A1390904987CD59B5C773F233F549512A308ED120E2FBBD88DBE302FB
        F42C30EDA5CDB6B98FD518FA01A111514A56216148B022F14A7AFEA56B959240
        DB371A08820096933AA061EA8B09F2FC5EBC7B5253558FB143AB1D5044F299E2
        D8A1B70D09E0A19285AD87F69F2D7E703A25460DEDA3BF053C1C3EC36D07D3E0
        04245A1B063A8D2D2302C8EC01818194C3FCBD8B28D5CD34D576584E26ED540B
        4B56467E3025421EB543019D26373628022BE0C05D142CE0145C148F4791209D
        203B9FA19C292F38728E585A2643EEB5DB8DAC624B7274B83FB6EB0586E561DC
        CC02C70BE0E579F0B01C8832390A98616A6E0172138268AAA3A2A0BEBE4EBF32
        85BE312AEC468BA3336EB73A2E58A5009BCB8BFB83D53961E50F78FC2A862661
        7C721A0E440639A36DAD45A525254F3195FC33C68BB54BBBE619F67D4C846697
        4629071BC3AD54E74419B81D163061F2F6E0105BBCEDF9F5B23BB71A31C52AED
        E9863D286C5C4C32917C4762A42654A5F403DA23809BC6E48909A0D820BBB7A7
        BCA0BB55DBB29A2CFA2C926437F5D6B49179B7716F8432402932303C3E092417
        EC5E30565CFE6CA86A5AABBC16EF232059D96B2ABB7F7CE995865B542CC336AF
        BDE7F1D5AE67F7757865599FFC4F01C9EEBEA14E0DFFF454CB17072ED414E61A
        D1E540F8BFE37E019F3374DF1DC3F11D0000000049454E44AE426082}
      PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
    end
    object recordbtn_on: TPngBitBtn
      Left = 149
      Top = 8
      Width = 40
      Height = 25
      Hint = 'Effekt-Aufnahme starten'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = recordbtn_onClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000000097048597300000B1300000B1301009A9C1800000A4D694343505068
        6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
        F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
        561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
        7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
        1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
        01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
        C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
        00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
        00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
        CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
        4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
        48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
        223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
        560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
        2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
        FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
        F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
        4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
        79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
        812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
        0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
        170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
        48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
        90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
        5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
        5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
        8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
        272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
        48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
        6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
        A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
        2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
        1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
        192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
        3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
        09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
        46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
        EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
        4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
        EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
        79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
        3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
        67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
        6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
        A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
        5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
        D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
        743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
        4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
        D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
        C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
        3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
        FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
        0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
        15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
        476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
        BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
        F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
        A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
        6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
        68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
        949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
        F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
        DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
        772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
        A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
        955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
        EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
        CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
        26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
        8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
        B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
        7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
        EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
        E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
        5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
        EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
        EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
        FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
        CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
        ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
        CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
        F73EE77CFEFC2FF784F3FB25D29F33000002D64944415478DAA5935F48537114
        C7CFFD37FF6DE5A6E8DA74D98B2BB0C4D4C07F0F0E7A08528AEA459A0F81A44F
        9246E86314D2434FBD144998B088828892308C6CE04350CB7F6B62796738983A
        E7EEFEBBBBDDDD7B3B77B9A121BD74E17B7F977BCFF9FCCEF9DEDF21645986FF
        B908054010C4FE9700A486618C1449563004A1E1453124489237218A3EFC2CA2
        E47F028EAAD5672E984CDDBAC2C2169AA64BE33CBFBEC4719F27BDDEE7495174
        6248220BD907A83418F21A19A6FB6A43C3C8718BA5545D5909A44A05E9781CC2
        6E374C4F4CAC3E5A5CBCF7231C7E85E161A59A7D804B66F3E5EB4D4D63D59D9D
        6A1E9312C120888200144D43814E07A428C287F171DF9DB9B99B9BA1D024A670
        39C0398BA5E20A49BE69B55A4F27221148A2B26009132504690C061002017860
        B37DB1B1EC0D4110E67380DE8E8ED68BE5E533A6E666E058162886F963127E93
        D3694845A390E03828AFAE86A9A9A9C8DDF9F9E14834FA360318E8EB2BD0B16C
        57ABD93C5A505C4CC4FD7E60F2F341C69DE5641252B118083B3B90C4D5505707
        4B2E177FDFE57ABA118D3EC900AE59ADF4D160B0AB45AF1F57511484D6D64085
        0065F74C059294B15C4098BEB616169D4E7E646ECEE60D04C6B22D10C3BDBD6D
        4DC1A05D5F55456C399D40630B8A7990F501DB90702DABA9811987233664B73F
        E679FE65CE835B83837AE3ECECB3C6FA7A4B1A0D8C6F6C64008A32C918A7C5FE
        433E1F8CB95C4B2F305692A4D77B7F237DBBBFBFE388C3317AB2A5A584C4B279
        340DD0072A2F0F0ACACA20B2BD0DF68585ED872CFB7ECBEF7F8739D37B01CA4D
        33D4D3D3AD5F5919A8361A8F1569B5C0602B299E07CEEB95BFC662DE89F5F56F
        DF97973F61EC47D4CADF479944959C6D6F6F3352D4F952593E7598614A3CD168
        783595F2CDBBDDEE00C72D608C03F513153B681628A5126D71B1E984D95CA362
        988A5F1E8FB8E6F12883B48E5A436DA276947938709876DB514E5211EAD0EEB3
        324091DD353791BF01D9677174F4CBE8220000000049454E44AE426082}
    end
    object RunAllPreviousEffectsBtn: TPngBitBtn
      Left = 197
      Top = 8
      Width = 40
      Height = 25
      Hint = 'Synchronisiert Effekte vor aktueller Position'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = RunAllPreviousEffectsBtnClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D000000097048597300000B1300000B1301009A9C1800000A4D694343505068
        6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
        F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
        561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
        7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
        1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
        01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
        C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
        00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
        00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
        CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
        4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
        48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
        223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
        560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
        2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
        FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
        F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
        4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
        79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
        812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
        0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
        170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
        48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
        90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
        5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
        5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
        8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
        272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
        48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
        6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
        A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
        2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
        1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
        192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
        3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
        09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
        46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
        EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
        4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
        EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
        79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
        3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
        67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
        6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
        A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
        5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
        D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
        743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
        4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
        D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
        C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
        3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
        FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
        0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
        15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
        476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
        BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
        F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
        A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
        6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
        68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
        949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
        F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
        DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
        772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
        A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
        955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
        EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
        CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
        26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
        8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
        B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
        7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
        EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
        E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
        5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
        EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
        EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
        FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
        CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
        ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
        CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
        F73EE77CFEFC2FF784F3FB25D29F33000004694944415478DA5D947D4C55651C
        C7BFE7E5BE5FDE2E8917B9F26640DEF282481481666A641AC2ACB5FE688D8895
        2D2DFBC3ADBF72F48FB5ACB0DCDADCDCACB555229B2C61CE054E230D106161BC
        AC9148970079E7BE9F7BCF39FD9ECBC374DCEDB33DBBE7793ECFEFF73CE77C05
        2774ACF9098444C8848123F3672A117D088DF360F11A211319091B9144A41089
        84856F14267CC422B144F889081123F4B542992F74101944369145A473A9C005
        F78971E21EE1256689C06AC5AB425699954823F288ADBA5D79C651BE545658A1
        A76ECA91E2B346EF86D07F3DE29BBF61EA1703293705987B69E9303DFA8F57AE
        3021DBD9CC659B89ED5AFEE22B55C7A2F965453618641DB261A58518D5108D09
        F8BD6F062D9FCDCC4AA3E96D2252DB49DCCFABF531A1CCCF2A9FD811CB99AA7D
        A9C1929FE51490EF14519E6582D3BE722753FE183AEF453036AB616641C1B9A3
        5D7EE3BFF9CD225CAD022C7D3465920959AB1B89A7344BF8B5CCA3732F7A0AAD
        A82932A1AAC00A9FA263704A890BDD4E23ACE4F6FA621898D0F0D1B9614C7C3D
        36618814FE2021BB95A68C3021BB0437F182FAC4C8FB5BDFDB90B8E7311DC776
        26E296574163A70FD301357E8659C9124EEC4D469A4D42535F1067FE50D173FA
        7B4883EE76239E3B4B53BA9990DD68899A30596BAE5CA8D9BC3B035FD4589093
        6AC01B3FCE63725985D9204089E928C934E0F5623B8C74EA2D77C2E81851F177
        67077CADF393D660FD49F27430610E0DCA15DB6F472C07934BDD4F66A2A93E01
        5D63511C39BF088B497CF092922812D5E14C12E0B089985C90307EE736E67EBE
        1249087DFA394D6963C25C1A5428F68E0FA4FD8E624B7616321255CC05344C2D
        6B71A1AAAE0859DBC1B0869FDE4DC6F63C23CA4F2C6372E416945F2EAA89A1D3
        5FD2E34B4C98C92E246AEE7B1B3BFC7B62B91EBC5AAAA36EA705A1888E5397C3
        B836188589DA0E84756C5C27A0ABC181A10915558D2144862E227ABD474954BE
        61C256265C47038F0E7F8DE26A3BA4EDAB968F1F50F1E17E2BBCF32A5E3EB98C
        A1710D2275EE4A1371AACE8ADD6E13DE39E3C3853E23C2970E43F46E98B7A381
        9DE1AF4C9840036A5B7B362AF6BCA554D93D1FD7B951B54DC3A3E91296A9C59B
        23D178CB650506A458457C4B557F725E831E18C052D35730EA157F5971B891A6
        DC604223FF4AB6E858DE174E687ED37DE8A0EDFEAC19CF7B54D4EF35C19D23C5
        858377559CBD1C414BAF08D110C4EC855A48BEC743463CDD6A42F57734E54F26
        64D768275C944EDB54780F846C4DD5F65D9506C1EA818912CB615B49A879BF88
        8840F2702F16DA8F43F46FA26CF3741B50DA2C634B3B4D195B0D07038FAB2C1D
        C1621563958A707597BE7EDC61CE2C8264CD8C5F712CF40F42E357119B5E84AC
        E78565E40DC8F05C9151704D40D2084B9E55A1C87390495D3A026EAAB444C528
        553C9AAB0ADE64DA481674A326C016A0B7705A826B9884DDF4C9DD26D9288FB1
        E0C379B82A65ED3FC273907D45EBF946469ED87EBE788A850131C30337C40269
        6D628B3C684D3C1F13F80666FE3F3B4C9614411EAA012E52F866DAFF7937B7BE
        974CE6D00000000049454E44AE426082}
    end
    object recordbtn_off: TPngBitBtn
      Left = 149
      Top = 8
      Width = 41
      Height = 25
      Hint = 'Beendet die Aufnahme'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      Visible = False
      OnClick = recordbtn_offClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D000000097048597300000B1300000B1301009A9C1800000A4D694343505068
        6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
        F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
        561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
        7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
        1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
        01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
        C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
        00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
        00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
        CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
        4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
        48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
        223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
        560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
        2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
        FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
        F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
        4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
        79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
        812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
        0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
        170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
        48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
        90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
        5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
        5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
        8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
        272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
        48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
        6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
        A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
        2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
        1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
        192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
        3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
        09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
        46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
        EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
        4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
        EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
        79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
        3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
        67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
        6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
        A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
        5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
        D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
        743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
        4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
        D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
        C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
        3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
        FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
        0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
        15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
        476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
        BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
        F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
        A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
        6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
        68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
        949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
        F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
        DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
        772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
        A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
        955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
        EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
        CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
        26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
        8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
        B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
        7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
        EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
        E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
        5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
        EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
        EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
        FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
        CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
        ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
        CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
        F73EE77CFEFC2FF784F3FB25D29F33000003D54944415478DA6D55DD4F5B651C
        7ECE57690B52C0229516EDEAD82615514950C18DCDC51B19BB59A289267ABDFB
        FD21BBF2DE1B635C16890926A8CC8FC8059A8DC140906D20B30758299FE5F4B4
        3D3DE7F8BCDDDB09D5264F0E7DCFFB7B787E5F4F151FFFF928844A68842EA1C9
        338F70898A842BCF9ED228758435A20011261AE53328CF054191281016611365
        49EED5130A3243063713CF12ED44547E3764709EC8496C130792B8AAB846A8C8
        00A1A695E82492BCF1D27DE0B409242829DC44557C612681655E5EA1E4BF786F
        9DD8958A9D1AA1A853886823BA889789BE69E01D4A3A5D318CA0A7EBF0CA65EC
        BBAE4DE9F75F03A623C00CD35AE4DDBFA5DA822014EA1A88162241BC6229CAD0
        6DDF1FE98EC79F8F5DB902E5CC19168295D8DB833B3B8BDB376E60B550D81C02
        2659935F197C8F718F881D41A8CAE2C70846E2ED69C3F8B027954A355DBD8AF2
        E1212AD92CFC5209AA61408BC510E0DF77AF5FC71FB66D0E552AE34CE927A63F
        2FD217849A54C7D2E08D4C383C5A52944BC96BD794F2EE2EBCED6D288A52AD8B
        EFBA55622395826E9AF8FCE64D743ACEEFFDBE3F46A553BCF25010EAB293A784
        BA3F5B5B3F8E2693BDCD232328323D3510A8D6A44AEA38F07676E03E7E8CE6BE
        3EDC9A98C0826DE7861DE7EB57816F796D41108AEE3E271A613734BC9B09043E
        89A5D371231A8543155A23AB51A940B52CF8A286F93CDCFD7D340E0F63697E1E
        63A592F3A66D4FBC57A97C498EBBC7081D4D3BBF12897C1A4B24124155457971
        117A385C55574DDAF39EAC4AB188D0D9B358989BC357858237605993973DEF0B
        BEBA732C655E1E5C89C73F8A18466F5B77378A5353D098B2C691F155F5491D99
        B6CB7F101A1CC4CF333318CF669D738EF3FD28F05461AD292F8AA66CB7B48C9A
        AE3B7A6A6040D17239B8ABAB554255903275CFF7A1F7F7E390E5F88CA9173636
        762EF8FEF80560AC56C36363C3451D5A3979F2037575F5C4898B176188466C6E
        42E15311E97775C16253269797F11DC97BF2F97BE7816FD2C08F8C7F503FD85D
        DCFE5E8EFCB9873D3DEFABA6D9DEDDDE8E20617006CBB68DFCDA1A6E71C87FA3
        DAE8FABAF91667F075E0076ECF2CE3CDA3AB179686F08203A4331CA1071D1D83
        B95028A97A9E1A620D590A6C681AACADAD4A876565A8EA4E2FF00BF77B96046B
        62FD8E9A43E0086982A9776F013D8F743DBDD5D696DC0B069B0F3836DAC1419E
        1D5CE7762C7113E6381E4BFABFBB6CD5DB578D34224689E977D242E2BC19A357
        B596D840BE3CE0566CD29232DC6E936459E936C223CBF5065B73695153BA159E
        91E44DF20CD2132DE98BC20B0FA5E93A47FDF0FF5C5B978A1BE45397EF5D192C
        884B35A2DA4FC13F580F8F74A544F3650000000049454E44AE426082}
    end
    object RunAllPreviousEffectsBtnOff: TPngBitBtn
      Left = 197
      Top = 8
      Width = 41
      Height = 25
      Hint = 'Synchronisiert Effekte vor aktueller Position'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Visible = False
      OnClick = RunAllPreviousEffectsBtnOffClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000000097048597300000B1300000B1301009A9C1800000A4D694343505068
        6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
        F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
        561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
        7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
        1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
        01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
        C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
        00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
        00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
        CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
        4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
        48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
        223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
        560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
        2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
        FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
        F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
        4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
        79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
        812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
        0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
        170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
        48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
        90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
        5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
        5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
        8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
        272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
        48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
        6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
        A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
        2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
        1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
        192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
        3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
        09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
        46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
        EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
        4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
        EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
        79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
        3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
        67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
        6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
        A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
        5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
        D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
        743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
        4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
        D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
        C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
        3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
        FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
        0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
        15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
        476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
        BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
        F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
        A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
        6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
        68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
        949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
        F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
        DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
        772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
        A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
        955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
        EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
        CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
        26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
        8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
        B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
        7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
        EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
        E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
        5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
        EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
        EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
        FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
        CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
        ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
        CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
        F73EE77CFEFC2FF784F3FB25D29F33000002F94944415478DAA5535B48936118
        7EBF39DD5AF3D486CED3DC3436F3502043BDF038A38BD4C01BC1F4A2AB5D0483
        BAB18BA8BBD89D17A14846226E2A096B914C901669081BE9D08B2DD491E0A135
        C79C734BD8D1F5BE7F2DBCEF8387FFE73B3CEFF33CEFF7B1743A0DFF33584747
        07104971713188C562C8C9C929542814F711F72412899CF61C1F1F7B5D2ED747
        9BCDF6D6E9741EE15CA2ADAD2DCDE3F1FE105C5C5C4051511194959575B5B6B6
        BE96CBE5D5B448A041EB048FC7F3D364323D5B5E5E7E87D3E1F6F6F614D36AB5
        904AA5A0A2A242DBDBDBFBA1A0A0E0AA542A05A552097979791C41381C86BDBD
        3D383D3D8548241237180C4F3736368CB814604343439048240A9B9A9A1CE5E5
        E5AABABA3AA8AFAF8768340A289D23207BD9D9D9707676063E9F0FE6E7E74FC6
        C7C77548F899353737834AA5D2A395975495141D1E1EC2EAEA2A55E3085015A0
        3AC8CDCD85ADAD2D585F5F87A9A9A94587C3F19C7576762A1B1B1B276B6A6A6E
        F7F4F400C99F9D9DE56453D5643249F640A3D14056561660989C1D3C7C64B55A
        0DACAAAAAAABBFBF7F52AD565F1F1E1E86838303B0582CDCE1CCA030D126A740
        2412C1F9F939B8DDEEC8DCDC9C91A1EC3B7D7D7DAF64329982DA488B241DDBC9
        259F19B1580CA8001684898909D8DEDEFEB5B0B0F09E61CB6E767777BFC1AFA6
        B6B616304CAEDADADA1A2795CFE7433C1EE772D0EBF5E0F7FB61666686B23859
        5A5A32332417B4B4B418D0FF63EC2B1042A110188D466E33630CF2F3F3015552
        D860369B61676707A6A7A7DD782F4C44C08442E12D9D4E671B181890D026BC81
        5C1BF7F7F739F99595959C77BBDD0E2B2B2BD4CAD8D8D8D8225AB4B0BF168568
        E1D1C8C8C80BF4CAA3769215BA9D344809B58E2A6357D2A3A3A39BC160D08A4B
        8B1902FA4A4B4B4B9F0C0E0E3E2C2929B942C90B04827F0152A05EAF3741D2F1
        F0179CFE84B0B34B0F8B8F90616877F14E3C68686850E39D10E1436381402086
        A1F9777777BF21910BF77D453811BECB0419926B886AC40D0CB01A09C4F81F45
        84103F101EC477441091FC0DADE957E43B69C3B50000000049454E44AE426082}
    end
    object audioeffektfilenamebox: TComboBox
      Left = 576
      Top = 10
      Width = 265
      Height = 21
      Hint = 'Liste verf'#252'gbarer Audiodateien'
      Style = csDropDownList
      DropDownCount = 15
      ItemHeight = 13
      ItemIndex = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      Text = 'Audiodatei hinzuf'#252'gen...'
      OnChange = audioeffektfilenameboxChange
      OnClick = audioeffektfilenameboxClick
      OnDropDown = audioeffektfilenameboxDropDown
      Items.Strings = (
        'Audiodatei hinzuf'#252'gen...')
    end
    object Button20: TPngBitBtn
      Left = 846
      Top = 7
      Width = 35
      Height = 25
      Hint = 'Aktuelle Audiodatei durch neue Datei ersetzen'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = Button20Click
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000000097048597300000B1300000B1301009A9C1800000A4D694343505068
        6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
        F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
        561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
        7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
        1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
        01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
        C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
        00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
        00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
        CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
        4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
        48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
        223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
        560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
        2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
        FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
        F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
        4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
        79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
        812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
        0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
        170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
        48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
        90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
        5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
        5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
        8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
        272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
        48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
        6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
        A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
        2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
        1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
        192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
        3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
        09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
        46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
        EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
        4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
        EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
        79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
        3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
        67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
        6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
        A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
        5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
        D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
        743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
        4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
        D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
        C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
        3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
        FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
        0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
        15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
        476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
        BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
        F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
        A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
        6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
        68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
        949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
        F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
        DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
        772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
        A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
        955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
        EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
        CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
        26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
        8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
        B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
        7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
        EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
        E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
        5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
        EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
        EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
        FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
        CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
        ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
        CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
        F73EE77CFEFC2FF784F3FB25D29F330000035A4944415478DA85536B6C145514
        FEEECC6CBBBBD50EFB2869D6A5AD940AC402FE300DC42A69FD01A6221084100A
        040A111B09B11A9BA0318A893158FEF843258241833192A66D8CA5B412A36950
        712161BB5D96F268D94E69B7CBEEB2D3EE63B6F3D8F174358DAFC42FF79B3B73
        E79CEF9E73EE3DACF7AD12E8BA8EBCAE82E719CADC1EBC3F14B39D4FCC1D8580
        FAB22565761B6F0B4B3DD22798C420FE01F6DD512B4C66A9E78B4A6B048B6073
        BB1639DEE9BEE1EB1D52ABC1619D73BDB7B1E5E02EEF40EF85D0F0C7C3BBA061
        E86F02FDC71637D76E6AFD42F47A045EB042E066F0D9B18F7C5D7DD21BE54E2B
        9F03EA2C3B9F6ADFF962ABF395C3072E477AE22F905F6C4120F8EDDEB195CF3D
        FDA8961D9FFF2C0C2561404B73AACB61679CC3C5750C5CC09AB547F86F7E3C8D
        33BBBFDE41869D0B02B7FAB6A5ABEA5695E84AEA0F01022708282E2EC60FA13B
        F8F5D634C298C3330DFB713BE9C789D74F5ECA45B57EBB84B34A06121BE9DE28
        57AD7E5CD4E7D20B02F328B208B81E0EE3D58B23D8B2BB0D8E7215F7AC7E0C5E
        F6635BAE09CBA7FC0F361EEE6B6223E79E952B6B968ABA9A0547FE86AE219FD7
        3047F206F3E081731D4E04FAB1A88187248D614376335EDAD082EE8E667547FB
        600B0B9DAD972B2B2A442515C3AC4231D85C60C5A560760FDC35AB611773084B
        A368FFA9136B4B97E0B54D07918D04B06FCF7BBECE5F8C16163CF384EC7DC42B
        C6670D886BB6A24454C198065E30606A7198790345820599AC0E93A2B43D2CE2
        DAF717D1F4B2EF782C837759E0F35AD9E1768858DC88F26A2B0C3A0D936E103D
        FE3C15567817781E4A2685225347C7F19EC8DB5FCEEC27830176EDF40AF92177
        85E85AF13CEC2C48F9E33FC11807435510BF3B8AED6D3FF75C19335B6939CAAE
        9E5C2A3B6B1AC572EF3220ED274BCB5F9C58210A46D5B5501A8622A3ABEB92D2
        FC41A48DF639453FF3CCF769A55C51774874F053C8E7EE93B1403DC1919B49F9
        EB34EB5052B3882766119D8EE3C3AFC67DDDBFE907C83958D8E4EAA9554A6DC3
        21AB90A43E31F3D0943412891944E329842792B9E0686A3A34AE4CDE99D2C66E
        4E22905111A092CC3755AE2070EE4DCF95EAC7563E199142EAF068361A0A2B93
        1331ED5E68C2BC9E4CE3B66ED2450424A24C4CFDAB3656015514ED7A8322D6F2
        98A0B5BBC4243143D4F13FF81D23196DF617F702D50000000049454E44AE4260
        82}
      PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
    end
    object Button21: TPngBitBtn
      Left = 886
      Top = 7
      Width = 35
      Height = 25
      Hint = 'Aktuelle Audiodatei l'#246'schen'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = Button21Click
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000000097048597300000B1300000B1301009A9C1800000A4D694343505068
        6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
        F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
        561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
        7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
        1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
        01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
        C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
        00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
        00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
        CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
        4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
        48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
        223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
        560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
        2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
        FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
        F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
        4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
        79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
        812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
        0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
        170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
        48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
        90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
        5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
        5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
        8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
        272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
        48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
        6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
        A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
        2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
        1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
        192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
        3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
        09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
        46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
        EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
        4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
        EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
        79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
        3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
        67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
        6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
        A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
        5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
        D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
        743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
        4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
        D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
        C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
        3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
        FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
        0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
        15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
        476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
        BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
        F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
        A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
        6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
        68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
        949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
        F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
        DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
        772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
        A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
        955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
        EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
        CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
        26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
        8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
        B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
        7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
        EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
        E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
        5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
        EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
        EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
        FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
        CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
        ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
        CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
        F73EE77CFEFC2FF784F3FB25D29F330000036C4944415478DA3D937B48537114
        C7CFD5B9EB63BB9BF381A54DC3425BD9B287EB45F6CE4AC34A2B2A88B082A2AC
        88E89D96947F48644552D2C32C354BC7CCD7AC45C54CAD253A89D2349D577CCE
        59D9DCD6D6B2F3B36B173E7FDCF3E27BCFF95E0A0028C4B532EF8CC26DC45E26
        9C20C955C49D4AC59883E337FC7B5C6A9FA6CDB5DB1D2ED13B2E36E0BB9330D6
        8CD065D7926B6A72D4F29931515DDBD21F2DC7D8086241ECAFF2CECFE69BCC37
        8DEF9AE55E220130D111E98AADE73231672503F8AA7B2762D92A5D7153492D84
        2D980EF4D28894E494FB4ACC7DCFBF7A285C6C3016B5ABEA44BFBA8740286120
        72FF7A78D86688B99E57D5440678DCBCB47729EF335BD1F0E40D3062212892D6
        0E6C4ECFDD9994B88C4E904ECCFB92FF86710CFC00069BA50B6540AD92BF6C68
        EB529FCC2C2C2503BC103F55C68122DD8D923923DD2608899C0A4ED9A48A403E
        1D36F4521F6A658D20F6F786E0B828EBE3C1C1823BCAD71FB0A70B61FF0F4839
        9290106A3467B43CAB03B73F0042B1005CED4E18FD6101C6470493E317D8323E
        363FA9D4EA3BB0BE0FE91C1FE081481069F6E57D475D5EE813FB6A9BC1C5E600
        1A0F44064963A36C991D9D4AF5DB2616EB064923A7A0776C89881099804CC94E
        DA906A51BD973B4D3F31418177901FB4CC0FD5A51569B498EFE79A594EC5B7F1
        331215BE91B29088B30AF9DD9EE21A3F6AD83A3640800A02D6CFB35F61D9FC72
        6D630DD6B573034CE4D41467241AF17E7D25B9C470E7F93C4B6B2FD03C1ED0AE
        AEE0E67082C087019F15725BBB6C62E9F6D3593738F943888D34BBA51D490C58
        3E25F8962147B36EB8C9009E9EEE208E08B15BBD688BA47348ECF8DA07EE2436
        2318F88BA6B599C302CACD165BDDAA8319955443497AB249FBE9588FBA5E6A69
        EBC30B8C4210DEBA5E16507FAD506328D897B08CAFD2497EB7620EC57AF83220
        59390B6C717394E15B4F1EA5B4E7F68CB63CD0801D5DC6C7F3F94E0D047AFB92
        AEB5A9B7CB89D703FDBD79C587776CF4ACD4FB3B3E7703EDE50EA29DD196B8A7
        E5BB1B5BD9664A5770A1B027BB6ACB70630708D06941898B7FC5DF53E6740F7C
        234B1A26FF02F9CCDBA776AD5E43338B1C02DA7656ADCD29D4BCABC3B881EC40
        5E9675FCBC747064533F8F325CADA8AEAEA8D67FC5F80062243FCCF8921111C2
        43CCC403E3469A4E4C84047145C06DB897BBBB95F38A88CBD39C2AA2B0FF2F7F
        435DF5691DE66C0000000049454E44AE426082}
      PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
    end
    object LayerCombobox: TJvCheckedComboBox
      Left = 344
      Top = 10
      Width = 225
      Height = 21
      Items.Strings = (
        'Layer 1'
        'Layer 2'
        'Layer 3'
        'Layer 4'
        'Layer 5'
        'Layer 6'
        'Layer 7'
        'Layer 8')
      CapSelectAll = '&Select all'
      CapDeSelectAll = '&Deselect all'
      NoFocusColor = clWindow
      DropDownLines = 8
      TabOrder = 12
      OnChange = LayerComboboxChange
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 1008
    Height = 25
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      BorderStyle = bsNone
      Caption = 'TBToolbar1'
      DragHandleStyle = dhNone
      Images = MainForm.PngImageList1
      TabOrder = 0
      object Datei1: TTBSubmenuItem
        Caption = 'Datei'
        Visible = False
        object Neu1: TTBItem
          Caption = 'Neu...'
          ImageIndex = 0
          OnClick = Neu1Click
        end
        object Dateiffnen1: TTBItem
          Caption = #214'ffnen...'
          ImageIndex = 1
          OnClick = OpenEffektaudioClick
        end
        object Dateispeichern1: TTBItem
          Caption = 'Speichern...'
          ImageIndex = 2
          OnClick = SaveEffektaudioClick
        end
      end
      object Ansicht1: TTBSubmenuItem
        Caption = 'Ansicht'
        object Waveformneuberechnen1: TTBItem
          Caption = 'Waveform neu berechnen'
          OnClick = Waveformneuberechnen1Click
        end
        object AktuellesLayeraktualisieren1: TTBItem
          Caption = 'Aktuelle Layeransicht aktualisieren'
          Hint = 'Sortiert die Effekte des aktuellen Layers neu'
          ImageIndex = 42
          OnClick = AktuellesLayeraktualisieren1Click
        end
        object N3: TTBSeparatorItem
        end
        object Anzeigedeaktivieren1: TTBItem
          Caption = 'Anzeige deaktivieren'
          OnClick = Anzeigedeaktivieren1Click
        end
      end
      object BPMErkennung1: TTBSubmenuItem
        Caption = 'BPM'
        object chkBPMCallback: TTBItem
          AutoCheck = True
          Caption = 'BPM-Wert zyklisch ermitteln'
          OnClick = chkBPMCallbackClick
        end
        object BPMScanzyklus1: TTBItem
          Caption = 'BPM-Scanzyklus...'
          OnClick = BPMScanzyklus1Click
        end
        object chkBeat: TTBItem
          AutoCheck = True
          Caption = 'BPM-Position anzeigen'
          Visible = False
        end
        object BPMScanlnge1: TTBItem
          Caption = 'BPM-Scanl'#228'nge...'
          OnClick = BPMScanlnge1Click
        end
        object N6: TTBSeparatorItem
        end
        object BPMWertneusuchen1: TTBItem
          Caption = 'BPM-Wert neu berechnen'
          OnClick = BPMWertneusuchen1Click
        end
      end
      object Einstellungen1: TTBSubmenuItem
        Caption = 'Einstellungen'
        object vorlaufzeit1: TTBItem
          Caption = 'Vorlaufzeit bei Effekterkennung...'
          OnClick = vorlaufzeit1Click
        end
        object nachlaufzeit1: TTBItem
          Caption = 'Nachlaufzeit bei Effekterkennung...'
          OnClick = nachlaufzeit1Click
        end
        object EinblendzeitbeiEffektsynchronisation1: TTBItem
          Caption = 'Einblendzeit bei Effektsynchronisation...'
          OnClick = EinblendzeitbeiEffektsynchronisation1Click
        end
        object sendtimecodetodll: TTBItem
          AutoCheck = True
          Caption = 'Timecode an Plugins senden'
          OnClick = sendtimecodetodllClick
        end
      end
      object N2: TTBSubmenuItem
        Caption = '?'
        object astenkrzel1: TTBItem
          Caption = 'Tastenk'#252'rzel...'
          ImageIndex = 24
          OnClick = astenkrzel1Click
        end
      end
      object Popupmenu1: TTBItem
        Caption = 'Popupmenu'
        OnClick = Popupmenu1Click
      end
    end
  end
  object OpenDialog: TOpenDialog
    Left = 336
    Top = 8
  end
  object SaveDialog: TSaveDialog
    Left = 368
    Top = 8
  end
  object audioeffekte_popupmenu: TPopupMenu
    Images = MainForm.PngImageList1
    Left = 272
    Top = 72
    object Effektlschen1: TMenuItem
      Caption = 'Effekt bearbeiten'
      Enabled = False
      ImageIndex = 85
      OnClick = EditEffektClick
    end
    object MarkiertenEffektausfhren1: TMenuItem
      Caption = 'Markierten Effekt ausf'#252'hren'
      Enabled = False
      ImageIndex = 56
      OnClick = MarkiertenEffektausfhren1Click
    end
    object MarkiertenEffektstoppen1: TMenuItem
      Caption = 'Markierten Effekt stoppen'
      Enabled = False
      ImageIndex = 53
      OnClick = MarkiertenEffektstoppen1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object KompletteShowstreckenstauchen1: TMenuItem
      Caption = 'Zeitkorrektur...'
      ImageIndex = 54
      OnClick = KompletteShowstreckenstauchen1Click
    end
    object MarkiertenEffektaufPositionXsetzen1: TMenuItem
      Caption = 'Aktuellen Effekt auf aktuelle Position setzen'
      Enabled = False
      OnClick = MarkiertenEffektaufPositionXsetzen1Click
    end
    object MarkierteEffekteverschieben1: TMenuItem
      Caption = 'Markierte Effekte um Xms verschieben...'
      Enabled = False
      ImageIndex = 26
      OnClick = MarkierteEffekteverschieben1Click
    end
    object N43: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object Layer1: TMenuItem
      Caption = 'Layer'
      object Layerffnen1: TMenuItem
        Caption = 'Layer '#246'ffnen...'
        Enabled = False
        ImageIndex = 1
        OnClick = Layerffnen1Click
      end
      object Layerspeichern1: TMenuItem
        Caption = 'Layer speichern...'
        Enabled = False
        ImageIndex = 2
        OnClick = Layerspeichern1Click
      end
      object Layerlschen1: TMenuItem
        Caption = 'Layer l'#246'schen...'
        Enabled = False
        ImageIndex = 31
        OnClick = Layerlschen1Click
      end
      object LayerkopierenzuLayer1: TMenuItem
        Caption = 'Layer kopieren...'
        Enabled = False
        OnClick = LayerkopierenzuLayer1Click
      end
    end
    object Layernamenbearbeiten1: TMenuItem
      Caption = 'Layernamen bearbeiten...'
      Enabled = False
      ImageIndex = 85
      OnClick = Layernamenbearbeiten1Click
    end
    object Effektliste1: TMenuItem
      Caption = 'Effektliste'
      object Effektlisteffnen1: TMenuItem
        Caption = 'Effektliste '#246'ffnen...'
        Enabled = False
        ImageIndex = 1
        OnClick = Effektlisteffnen1Click
      end
      object Effektlistespeichern1: TMenuItem
        Caption = 'Effektliste speichern...'
        Enabled = False
        ImageIndex = 2
        OnClick = Effektlistespeichern1Click
      end
      object Effektlistelschen1: TMenuItem
        Caption = 'Effektliste l'#246'schen...'
        Enabled = False
        ImageIndex = 31
        OnClick = Effektlistelschen1Click
      end
    end
    object N44: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object RecordModus1: TMenuItem
      AutoCheck = True
      Caption = 'Record-Modus'
      OnClick = RecordModus1Click
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object RepeatModus1: TMenuItem
      Caption = 'Repeat'
      Enabled = False
      object Repeataktiviert1: TMenuItem
        Caption = 'Repeat aktiviert'
        OnClick = Repeataktiviert1Click
      end
      object N52: TMenuItem
        Caption = '-'
      end
      object SprungmarkeanaktuellePosition1: TMenuItem
        Caption = 'Sprungmarke an aktuelle Position'
        OnClick = SprungmarkeanaktuellePosition1Click
      end
      object Sprungmarkeverschieben1: TMenuItem
        Caption = 'Sprungmarke verschieben'
        ImageIndex = 26
        OnClick = Sprungmarkeverschieben1Click
      end
      object N51: TMenuItem
        Caption = '-'
      end
      object ZielmarkeanaktuellePosition1: TMenuItem
        Caption = 'Zielmarke an aktuelle Position'
        OnClick = ZielmarkeanaktuellePosition1Click
      end
      object Zielmarkeverschieben1: TMenuItem
        Caption = 'Zielmarke verschieben'
        ImageIndex = 26
        OnClick = Zielmarkeverschieben1Click
      end
      object N53: TMenuItem
        Caption = '-'
      end
      object Importieren1: TMenuItem
        Caption = 'Repeatmarken '#246'ffnen...'
        ImageIndex = 1
        OnClick = Importieren1Click
      end
      object Exportieren1: TMenuItem
        Caption = 'Repeatmarken speichern...'
        ImageIndex = 2
        OnClick = Exportieren1Click
      end
    end
    object Videoseekingeinrichten1: TMenuItem
      Caption = 'Videoseeking einrichten'
      Enabled = False
      ImageIndex = 55
      OnClick = Videoseekingeinrichten1Click
    end
    object N23: TMenuItem
      Caption = '-'
    end
    object Wavedarstellungzweifarbig1: TMenuItem
      Caption = 'Wavedarstellung zweifarbig'
      Checked = True
      OnClick = Wavedarstellungzweifarbig1Click
    end
    object Mausklickssperren1: TMenuItem
      AutoCheck = True
      Caption = 'Mausklicks sperren'
      OnClick = Mausklickssperren1Click
    end
  end
  object AddSzenePopup: TPopupMenu
    Images = MainForm.PngImageList1
    Left = 272
    Top = 104
    object ObjektausSzenenbibliothekstarten1: TMenuItem
      Caption = 'Objekt aus Bibliothek starten'
      ImageIndex = 56
      OnClick = AddSzeneClick
    end
    object ObjektausBibliothekstoppen1: TMenuItem
      Caption = 'Objekt aus Bibliothek stoppen'
      ImageIndex = 53
      OnClick = ObjektausBibliothekstoppen1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Effektstarten2: TMenuItem
      Caption = 'Effekt starten'
      ImageIndex = 56
      OnClick = Effektstarten1Click
    end
    object Effektstoppen2: TMenuItem
      Caption = 'Effekt stoppen'
      ImageIndex = 53
      OnClick = Effektstoppen1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Direktszenehinzufgen1: TMenuItem
      Caption = 'Direktszene einf'#252'gen'
      Hint = 
        'An aktuelle Position eine Direktszene einf'#252'gen (wird nicht in Sz' +
        'enenbibliothek aufgenommen)'
      ImageIndex = 38
      OnClick = AddDirektSzeneClick
    end
  end
  object CheckBPMTimer: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = CheckBPMTimerTimer
    Left = 240
    Top = 72
  end
  object ScrollbarRefreshTimer: TTimer
    Enabled = False
    Interval = 750
    OnTimer = ScrollbarRefreshTimerTimer
    Left = 240
    Top = 105
  end
  object audioeffekttimer: TSVATimer
    Interval = 100
    OnTimer = audioeffekttimerTimer
    Left = 304
    Top = 105
  end
  object audioeffektplaytimer: TSVATimer
    Interval = 50
    OnTimer = audioeffektplaytimerTimer
    Left = 336
    Top = 105
  end
  object GetAudioeffektTimer: TSVATimer
    Interval = 50
    OnTimer = GetAudioeffektTimerTimer
    Left = 368
    Top = 105
  end
end
