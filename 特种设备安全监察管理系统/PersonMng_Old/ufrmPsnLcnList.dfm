object frmPsnLcnList: TfrmPsnLcnList
  Left = 70
  Top = 74
  Width = 696
  Height = 480
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #20154#21592#36164#36136#19968#35272#34920
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 425
    Width = 688
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object Panel4: TPanel
      Left = 533
      Top = 1
      Width = 154
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object bbtnHelp: TBitBtn
        Left = 0
        Top = 2
        Width = 75
        Height = 22
        Hint = #33719#21462#30456#20851#24110#21161
        Caption = #24110#21161'(&H)'
        TabOrder = 0
        Glyph.Data = {
          36010000424D3601000000000000760000002800000010000000100000000100
          040002000000C0000000C40E0000C40E00000000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000ADD02D004DD
          00000ADD020004DD00000004DDD70477000870B07DDD000002DD060000080FF0
          07DD00000004D0FF06FB0006FFF07D0000000010D0FBFFF44FFBF07D00000010
          D0FFFBFFFBFFF07D00000010D0FBFFF47FFBF07D00000010D0FFFBF748FFF07D
          00000010D0FBFFFB747BF07D00000010D0FFF47FF44FF07D00000010D0FBF44B
          844BF07D00000006D0FFF800044400068FF07D0000000010D0FBFFFBFFFBF07D
          00000010D0FFFBFFFBFFF0DD000002DD0A0000040DDD00000001}
      end
      object bbtnClose: TBitBtn
        Left = 77
        Top = 2
        Width = 75
        Height = 22
        Hint = #20851#38381#24403#21069#31383#21475
        Caption = #20851#38381'(&C)'
        TabOrder = 1
        OnClick = bbtnCloseClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF000FFF
          FFFFFFFF005000FFFFFFFF0055500000FFFF0055555000000FFF055555507880
          00FF055555507770FFFF05555B5077700FF005555B507770B00B05555550770B
          BBBB05555550770BBBBB055555507770B00B0555555077700FF0055555007770
          FFFF055500777770FFFF050077777770FFFF000000000000FFFF}
      end
    end
    object bbtnAction: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Caption = 'Action'
      TabOrder = 0
      OnClick = bbtnActionClick
    end
    object bbtnRefresh: TBitBtn
      Left = 65
      Top = 3
      Width = 60
      Height = 22
      Caption = #21047#26032
      TabOrder = 1
      OnClick = bbtnRefreshClick
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C000000000000000000000000000000000000000000000000
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0002FF7FFF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7F00020002FF7FFF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7F00020002000200020002FF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7F00020002FF7FFF7F0002FF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0002FF7FFF7F0002FF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7F0002FF7FFF7FFF7FFF7FFF7F0002FF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7F0002FF7FFF7F0002FF7FFF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7F0002FF7FFF7F00020002FF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7F00020002000200020002FF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00020002FF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F0002FF7FFF7F000000000000
        00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000
        1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001F7C
        1F7C1F7C1F7C1F7C00000000000000000000000000000000000000001F7C1F7C
        1F7C1F7C1F7C}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 397
    Width = 688
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object bbtnFind: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Hint = #26597#25214#35760#24405
      Caption = #26597#25214
      TabOrder = 0
      OnClick = bbtnFindClick
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C1F7C1F7C000000000000
        000000001F7C0000FF7F0000000000001F7C1F7C1F7C1F7C1F7C0000FF7F0000
        000000001F7C0000FF7F0000000000001F7C1F7C1F7C1F7C1F7C0000FF7F0000
        000000001F7C00000000000000000000000000001F7C00000000000000000000
        000000001F7C00000000FF7F000000000000000000000000FF7F000000000000
        000000001F7C00000000FF7F000000000000186300000000FF7F000000000000
        000000001F7C00000000FF7F000000000000186300000000FF7F000000000000
        000000001F7C1F7C000000000000000000000000000000000000000000000000
        00001F7C1F7C1F7C1F7C0000FF7F0000000000001F7C0000FF7F000000000000
        1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C00000000000000000000
        1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C0000000000001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00001F7C1F7C1F7C0000FF7F00001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C0000000000001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object bbtnFilter: TBitBtn
      Left = 65
      Top = 3
      Width = 60
      Height = 22
      Hint = #36807#28388#35760#24405
      Caption = #36807#28388
      TabOrder = 1
      OnClick = bbtnFilterClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770000000
        0000777770F7F7F7F7F07777707F7F700070777770F7F7F0F0F0777770700070
        0070777770F7F7F7F7F07777707F7F70007077770007F7F0F0F0777706000070
        007077770707F7F7F7F077770704444444447770776044444444770777760777
        7777706FF7776077777700000000000777777777777777777777}
    end
    object bbtnColunm: TBitBtn
      Left = 127
      Top = 3
      Width = 70
      Height = 22
      Hint = #25511#21046#21015#34920#21306#22495#30340#26174#31034#39118#26684
      Caption = #21015#25511#21046
      TabOrder = 2
      OnClick = bbtnColunmClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFF333
        333330888888F333303030880888F333003030800088F330003030808008F333
        003030888808F333303030888888F33333333000000003333333333333333333
        333300000000000000000F888888F88888870F800088F80008870F888888F888
        88870F888888F88888870FFFFFF8FFFFFF870000000000000000}
    end
    object Panel3: TPanel
      Left = 485
      Top = 1
      Width = 202
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      object CSdxDBNavigator1: TCSdxDBNavigator
        Left = 0
        Top = 2
        Width = 200
        Height = 22
        DataSource = Listd
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
        Captions.Strings = (
          #26368#21069
          #21518#36864
          #21069#36827
          #26368#21518
          #28155#21152
          #21024#38500
          #20462#25913
          #20445#23384
          #21462#28040
          #21047#26032)
        QuantumCtrl = grdList
      end
    end
  end
  object grdList: TdxDBGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 397
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'sysid'
    ShowGroupPanel = True
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    TabOrder = 0
    OnDblClick = grdListDblClick
    DataSource = Listd
    Filter.Criteria = {00000000}
    LookAndFeel = lfFlat
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    OnChangeNode = grdListChangeNode
    OnCustomDraw = grdListCustomDraw
    object grdListsysid: TdxDBGridColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 78
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sysid'
    end
    object grdListcertno: TdxDBGridColumn
      HeaderAlignment = taCenter
      Width = 124
      BandIndex = 0
      RowIndex = 0
      FieldName = 'certno'
    end
    object grdListperson_sysid: TdxDBGridColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 78
      BandIndex = 0
      RowIndex = 0
      FieldName = 'person_sysid'
    end
    object grdListperson_sysid_name: TdxDBGridColumn
      HeaderAlignment = taCenter
      Width = 79
      BandIndex = 0
      RowIndex = 0
      FieldName = 'person_sysid_name'
    end
    object grdListlicns_category: TdxDBGridColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 57
      BandIndex = 0
      RowIndex = 0
      FieldName = 'licns_category'
    end
    object grdListlicns_category_name: TdxDBGridColumn
      HeaderAlignment = taCenter
      Width = 93
      BandIndex = 0
      RowIndex = 0
      FieldName = 'licns_category_name'
    end
    object grdListlicns_kind: TdxDBGridColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 41
      BandIndex = 0
      RowIndex = 0
      FieldName = 'licns_kind'
    end
    object grdListlicns_kind_name: TdxDBGridColumn
      HeaderAlignment = taCenter
      Width = 91
      BandIndex = 0
      RowIndex = 0
      FieldName = 'licns_kind_name'
    end
    object grdListorgan_sysid: TdxDBGridColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 78
      BandIndex = 0
      RowIndex = 0
      FieldName = 'organ_sysid'
    end
    object grdListorgan_sysid_name: TdxDBGridColumn
      HeaderAlignment = taCenter
      Width = 172
      BandIndex = 0
      RowIndex = 0
      FieldName = 'organ_sysid_name'
    end
    object grdListstate_name: TdxDBGridColumn
      HeaderAlignment = taCenter
      Width = 124
      BandIndex = 0
      RowIndex = 0
      FieldName = 'state_name'
    end
    object grdListstart_date: TdxDBGridColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'start_date'
    end
    object grdListend_date: TdxDBGridColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'end_date'
    end
    object grdListstate: TdxDBGridColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 23
      BandIndex = 0
      RowIndex = 0
      FieldName = 'state'
    end
  end
  object ImageList1: TImageList
    Left = 260
    Top = 152
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421042104210421042
      1042104210421042104210421042104210420000000010421042104210421042
      1042104210421042104210421042104210420000000010421042104210421042
      1042104210421042104210421042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000010420000000000000000000000000000
      0000000000000000000000000000000010420000000000000000000000000000
      0000000000000000000000000000000010420000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07F00000000FF7FE07F0000104200000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07F00000000FF7FE07F0000104200000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07F00000000FF7FE07F000010420000000000000000000000000000
      00000000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7F000000000000FF7F0000104200000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7F000018630000FF7F0000104210420000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7F000000000000FF7F000010420000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000FF7F0000FF7F
      0000FF7FE07F0000E07F000000000000104200000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07F0000E07F186300000000104200400000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07F0000E07F00000000000010420000000000000000000000000000
      00000000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      00000000FF7F00000000000000000000104200000000E07FFF7FFF7FFF7FE07F
      FF7FE07FFF7F00000000000000000000104200400040E07FFF7FE07FFF7F1042
      0040E07FFF7F0000000000000000000010420000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      0000E07F0000FF7FE07FFF7FE07F0000104200000000FF7FFF7F1000FF7FFF7F
      1000FF7FE07FFF7FE07FFF7FE07F00001042104200401042E07FFF7F10420040
      1042FF7FE07FFF7FE07FFF7FE07F000010420000000000000000000000000000
      00000000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      0000E07F0000E07FFF7FE07FFF7F0000104200000000FF7F10001000FF7FFF7F
      10001000FF7FE07FFF7FE07FFF7F000010420000004000401042E07F00400040
      FF7FE07FFF7FE07FFF7FE07FFF7F000010420000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      0000E07FE07F0000E07FFF7FE07F000010420000FF7F10001000100010001000
      100010001000FF7FE07FFF7FE07F00001042000010420040004000400040FF7F
      E07FFF7FE07FFF7FE07FFF7FE07F000010420000000000000000000000000000
      00000000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      0000E07FE07F0000FF7FE07FFF7F00001042FF7F100010001000100010001000
      1000100010001000FF7FE07FFF7F0000104200001042004000400040FF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7F000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000E07FE07F000000000000000000001000100010001000100010001000
      1000100010001000100000000000000000001042004000400040004010420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000E07FE07F000000000000000000000000100010001000100010001000
      1000100010001000000000000000000000000040004010420000004000401042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010001000100010001000
      1000100010000000000000000000000000000000000000000000000000400040
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000040004000000000000000000000000000001000100000000000
      1000100000000000000000000000000000000000000000000000000000000040
      0040104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100000000000
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000C000C000C0000000
      8000800080000000800080008000000080108000001000008008800000080000
      8000800000000000800080000000000080008000800000008000800080000000
      80000000800000008001000100010000FF0F801F11FF0000FF87C03FF8FF0000
      FF87E67FFC7F0000FFCFF6FFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object List: TCSADOQuery
    Connection = dmData.adocon
    Parameters = <>
    SQL.Strings = (
      'device.usp_getpsnlcnslist')
    Left = 176
    Top = 124
    object Listsysid: TStringField
      FieldName = 'sysid'
    end
    object Listcertno: TStringField
      DisplayLabel = #35777#20070#32534#30721
      FieldName = 'certno'
    end
    object Listperson_sysid: TStringField
      FieldName = 'person_sysid'
    end
    object Listperson_sysid_name: TStringField
      DisplayLabel = #20154#21592#22995#21517
      FieldName = 'person_sysid_name'
      Size = 30
    end
    object Listlicns_category: TStringField
      FieldName = 'licns_category'
      Size = 4
    end
    object Listlicns_category_name: TStringField
      DisplayLabel = #36164#36136#31867#21035
      FieldName = 'licns_category_name'
      Size = 30
    end
    object Listlicns_kind: TStringField
      FieldName = 'licns_kind'
      Size = 4
    end
    object Listlicns_kind_name: TStringField
      DisplayLabel = #36164#36136#24615#36136
      FieldName = 'licns_kind_name'
      Size = 30
    end
    object Listorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object Listorgan_sysid_name: TStringField
      DisplayLabel = #21457#35777#26426#26500
      FieldName = 'organ_sysid_name'
      Size = 60
    end
    object Liststart_date: TStringField
      DisplayLabel = #24320#22987#26085#26399
      FieldName = 'start_date'
      Size = 10
    end
    object Listend_date: TStringField
      DisplayLabel = #25130#27490#26085#26399
      FieldName = 'end_date'
      Size = 10
    end
    object Liststate: TStringField
      FieldName = 'state'
      Size = 2
    end
    object Liststate_name: TStringField
      DisplayLabel = #36164#36136#29366#24577
      FieldName = 'state_name'
    end
  end
  object Listd: TDataSource
    DataSet = List
    Left = 204
    Top = 124
  end
  object ListFind: TCSDBdxGrdFind
    QuantumCtrl = grdList
    Left = 176
    Top = 152
  end
  object ListFilter: TCSADOdxGrdFilter
    QuantumCtrl = grdList
    Left = 204
    Top = 152
  end
  object ListColCtrl: TCSdxGrdColCtrl
    QuantumCtrl = grdList
    ColList = <>
    Left = 232
    Top = 152
  end
end
