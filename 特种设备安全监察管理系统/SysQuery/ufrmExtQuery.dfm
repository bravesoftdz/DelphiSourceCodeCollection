object frmExtQuery: TfrmExtQuery
  Left = 192
  Top = 133
  BorderStyle = bsDialog
  Caption = #22806#25346#24335#26597#35810
  ClientHeight = 348
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 320
    Width = 536
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object bbtnOK: TBitBtn
      Left = 207
      Top = 3
      Width = 60
      Height = 22
      Caption = #30830#23450
      Default = True
      TabOrder = 0
      OnClick = bbtnOKClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333FF3333333333333344333333
        3333333F88F333333333333422433333333333F8338F33333333334222243333
        33333F833F38F333333334222A224333333338F3F8F38F3333333222A3A22433
        333338FF838F38F333333A2A333A2243333338F83338F38F333333A33333A224
        3333338333338F38F333333333333A2243333333333338F38F333333333333A2
        243333333333338F38F333333333333A2243333333333338F383333333333333
        A2233333333333338F833333333333333A233333333333333883333333333333
        33A3333333333333338333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnCancel: TBitBtn
      Left = 269
      Top = 3
      Width = 60
      Height = 22
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333331333333333
        3133338333333333383331113333333331333838333333333833311113333333
        1333383383333333833333111333333133333383833333383333333111333311
        3333333838333388333333331113311333333333838338833333333331111133
        3333333338388833333333333311133333333333338383333333333331111133
        3333333338388833333333331113311333333333838338833333331111333311
        3333338838333388333331111333333113333833833333388333311133333333
        3133388833333333383333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 536
    Height = 320
    Align = alClient
    Caption = ' '#35831#36873#25321#19968#39033#26597#35810#28982#21518#21452#20987#25110#28857#20987#30830#23450#25353#38062#24320#22987#25191#34892' '
    TabOrder = 0
    object lbExtQueryList: TListBox
      Left = 2
      Top = 14
      Width = 532
      Height = 304
      Align = alClient
      ItemHeight = 12
      Sorted = True
      TabOrder = 0
      OnDblClick = lbExtQueryListDblClick
    end
  end
end
