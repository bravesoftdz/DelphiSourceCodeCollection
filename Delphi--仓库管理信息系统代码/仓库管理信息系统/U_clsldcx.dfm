object frmClsld_CX: TfrmClsld_CX
  Left = 74
  Top = 51
  Width = 680
  Height = 470
  Caption = #25910#26009#21333#26597#35810
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object StatusBar1: TStatusBar
    Left = 0
    Top = 424
    Width = 672
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 397
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 2
      Top = 2
      Width = 668
      Height = 393
      Align = alClient
      DataSource = DataSource
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = DBGridTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = #25910#26009#23383#21495
          Title.Alignment = taCenter
          Title.Color = 4227200
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20179#24211#21517#31216
          Title.Alignment = taCenter
          Title.Color = 4227200
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21046#21333#26085#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26448#26009#32534#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23384#25918#20301#32622
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23454#25910#25968#37327
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20837#24211#21333#20215
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20973#35777#25968#37327
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26448#26009#21517#31216
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35268#26684#22411#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#37327#21333#20301
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#21010#21333#20215
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21333#20215#21333#20301
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20379#24212#21378#23478
          Visible = True
        end
        item
          Expanded = False
          FieldName = #29289#36164#26469#28304
          Visible = True
        end
        item
          Expanded = False
          FieldName = #37319#36141#20154
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21512#21516#32534#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21457#31080#37329#39069
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20854#20013#36816#26434#36153
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21457#31080#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20027#31649
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21046#21333#20154
          Visible = True
        end
        item
          Expanded = False
          FieldName = #39564#25910#20154
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23457#26680#20154
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26159#21542#23457#26680
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23457#26680#26085#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21333#25454#22791#27880
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26159#21542#19978#20256
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19978#20256#21333#20301
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19978#20256#26102#38388
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 397
    Width = 672
    Height = 27
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object ToolBar1: TToolBar
      Left = 378
      Top = 2
      Width = 292
      Height = 23
      Align = alRight
      AutoSize = True
      ButtonWidth = 75
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 0
      object btnLookUp: TToolButton
        Left = 0
        Top = 0
        Caption = #26597'    '#25214
        ImageIndex = 0
        OnClick = btnLookUpClick
      end
      object btnBrowseAll: TToolButton
        Left = 75
        Top = 0
        Caption = #20840#37096#27983#35272
        ImageIndex = 1
        OnClick = btnBrowseAllClick
      end
      object btnOrder: TToolButton
        Left = 150
        Top = 0
        AutoSize = True
        Caption = #25490'  '#24207
        ImageIndex = 2
        OnClick = btnOrderClick
      end
      object btnPrint: TToolButton
        Left = 217
        Top = 0
        Caption = #25171'  '#21360
        ImageIndex = 3
        OnClick = btnPrintClick
      end
    end
  end
  object ImageList1: TImageList
    Left = 544
    Top = 232
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000001000FF031F0000000000000000000000007C007C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001000FF031F001F0000000000000000000000007C007C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00000000000000000000
      0000000000000000FF7F00000000000000000000000000000000000000000000
      000000001000FF031F001F000000000000000000007C007C007C007C007C007C
      0000000000000000000000000000000000000000000018631863186318631863
      1863186318631863000018630000000000000000FF7F00000000000000000000
      0000000000000000FF7F00000000000000001042004200420042004200420042
      00421000FF031F001F0000420042000000000000007C007C007C007C007C007C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001863000000000000000000000000000000000000
      00000000000000000000000000000000000010420000E07F1863104200000000
      104218631F001F000042E07F004200000000000000000000007C007C00000000
      0000000000000000000000000000000000000000186318631863186318631863
      E07FE07FE07F18631863000000000000000000000000FF7F0000000000000000
      00000000FF7F00000000000000000000000010420000186310421863FF031863
      0000104200420042E07F1863004200000000000000000000007C007C00000000
      0000000000000000000000000000000000000000186318631863186318631863
      00000000000018631863000018630000000000000000FF7F0000000000000000
      00000000FF7F0000000000000000000000001042000010420000FF031863FF03
      186300000042E07F1863E07F0042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000018631863000000000000FF7F0000000000000000
      00000000FF7F000000000000000000000000104200001042FF030000FF031863
      FF03000000421863E07F18630042000000000000000000000000000000000000
      1F00000000000000000000000000000000000000186318631863186318631863
      1863186318631863000018630000186300000000000000000000000000000000
      0000000000000000000000000000000000001042000010420000FF030000FF03
      186300001042E07F1863E07F0042000000000000000000000000000000000000
      1F001F0000000000000000000000000000000000000000000000000000000000
      000000000000000018630000186300000000000000000000FF7F000000000000
      00000000FF7F00000000000000000000000010420000186310420000FF030000
      00001042E07F1863E07F186300420000000000001F001F001F001F001F001F00
      1F001F001F001F000000007C007C000000000000000000000000000000000000
      0000000000000000000018630000186300000000000000000000000000000000
      00000000000000000000000000000000000010420000E07F1863104210420000
      1042E07F1863E07F1863E07F00420000000000001F001F001F001F001F001F00
      1F001F001F001F000000007C007C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042000000000000000000000000
      0000000000000000000000000042000000000000000000000000000000000000
      1F001F0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      000000000000FF7F0000000000000000000010421863E07F1863E07F1863E07F
      1863104210421042104210421042000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000010421863E07F1863E07F1863
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421042104210421042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFF3FFFFFFFFFFFFFFE1E7F8FFFF
      07C1FFC1E7F8C00707C1800381FF800307C1000181FC000101014001E7FC0001
      00014001E7FF000102015001FFFC000002014801FEFC000080035401FE7F8000
      C1074A018013DFE0C10740018013E821E38F7FF9FE7FEFF7E38F0003FEF8F417
      E38F80FFFFF8F7FBFFFFC1FFFFFFF80300000000000000000000000000000000
      000000000000}
  end
  object DataSource: TDataSource
    DataSet = DM.CDS_CLSLD_CX
    Left = 288
    Top = 96
  end
end
