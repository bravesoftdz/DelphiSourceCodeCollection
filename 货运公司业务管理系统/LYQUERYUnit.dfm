object LYQUERYForm: TLYQUERYForm
  Left = 232
  Top = 344
  BorderStyle = bsDialog
  Caption = #38470#36816#26597#35810#31383#20307
  ClientHeight = 215
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
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
      Left = 110
      Top = 62
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
      Left = 313
      Top = 63
      Width = 39
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #26597#25214#20540
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
    end
    object FlatComboBox1: TFlatComboBox
      Left = 69
      Top = 82
      Width = 137
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
        #30446#30340#22320)
      ParentFont = False
      TabOrder = 0
      ItemIndex = -1
    end
    object FlatButton1: TFlatButton
      Left = 128
      Top = 144
      Width = 57
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = FlatButton1Click
    end
    object FlatButton2: TFlatButton
      Left = 272
      Top = 144
      Width = 57
      Height = 25
      Caption = #21462#28040
      TabOrder = 2
      OnClick = FlatButton2Click
    end
    object Edit1: TEdit
      Left = 262
      Top = 81
      Width = 153
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Text = 'Edit1'
    end
  end
end
