object SHXXQUeryForm: TSHXXQUeryForm
  Left = 245
  Top = 321
  Width = 533
  Height = 242
  BorderIcons = [biSystemMenu]
  Caption = #25910#36135#20449#24687#26597#35810#31383#20307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 0
    Width = 525
    Height = 215
    ParentColor = True
    Align = alClient
    TabOrder = 0
    object AALabel1: TAALabel
      Left = 96
      Top = 54
      Width = 52
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #36873#25321#23383#27573
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object AALabel2: TAALabel
      Left = 331
      Top = 55
      Width = 39
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #26597#35810#20540
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object FlatComboBox1: TFlatComboBox
      Left = 56
      Top = 72
      Width = 145
      Height = 21
      Style = csDropDownList
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        #25910#36135#20844#21496
        #25910#36135#20154)
      ParentFont = False
      TabOrder = 0
      ItemIndex = -1
    end
    object FlatButton1: TFlatButton
      Left = 152
      Top = 136
      Width = 57
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 304
      Top = 136
      Width = 57
      Height = 25
      Caption = #21462#28040
      TabOrder = 2
      OnClick = FlatButton2Click
    end
    object Edit1: TEdit
      Left = 279
      Top = 72
      Width = 153
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
  end
end
