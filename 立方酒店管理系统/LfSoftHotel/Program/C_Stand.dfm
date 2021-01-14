object StandForm: TStandForm
  Left = 179
  Top = 137
  Width = 544
  Height = 375
  Caption = 'StandForm'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 42
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    DesignSize = (
      536
      42)
    object lblTitle: TLabel
      Left = 210
      Top = 5
      Width = 125
      Height = 29
      Anchors = [akTop]
      Caption = #26631#20934#26631#39064
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Image1: TImage
      Left = 176
      Top = 5
      Width = 32
      Height = 32
      Anchors = [akTop]
      AutoSize = True
      Center = True
      Picture.Data = {
        055449636F6E0000010002002020100000000000E80200002600000010101000
        00000000280100000E0300002800000020000000400000000100040000000000
        8002000000000000000000000000000000000000000000000000800000800000
        0080800080000000800080008080000080808000C0C0C0000000FF0000FF0000
        00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000000000000000
        000000000000000000800000000000000000000000000000170FFFFFFFFFFFFF
        FF00000000000000170FFFFFFFFFFFFFFF00000000091910170777777777F707
        FF0000000091910017000000FFFF00FFFF000000091990FF00FFFFFF00001088
        8800000009990FFFFFFFFFFF88800FFFFF00000009990FFFFFFFFF0000008888
        8800000009990FFFFFFFF80F0B00FFFFF700000000990FFFFFFFF800B0808888
        88000000000000FFFFFFF80B08F0FFF77700000000000000FFFFF0B08F088888
        88000000000000000FFF0B08F0FFF77777000000000000001000B0FF08888888
        8800000000000000170B0000FFF77777770000000000000010B0888888888888
        88000000000000000B0FFFFFF77777777700000000000000B008888888888888
        880000000000000B070FFF000000000000000000000000B01708880999999999
        9999999000000000170FF0595959595959595900000000001708809595959595
        9595950000000000170F09595959595959595000000000001708059595959595
        9595900000000000170059595959595959590000000000001700959595959595
        9595000000000000180959595959595959500000000000000105001001001001
        0010000000000000011070070070070070000000000000000000000000000000
        0000000000000000000000000000000000000000FFFFFFFFFF80003FFF00001F
        E100001FC000001F8000001F0000001F0000001F0000001F0000001F8000001F
        C000001FFC00001FFF00001FFF00001FFF00001FFF00001FFF00001FFE00001F
        FC000000F8000000F9000001FF000001FF000003FF000003FF000007FF000007
        FF00000FFF80000FFF80001FFFF2493FFFFFFFFF280000001000000020000000
        0100040000000000C00000000000000000000000000000000000000000000000
        00008000008000000080800080000000800080008080000080808000C0C0C000
        0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000
        00000000000000FFFFFFF0000010770077008000010F0FFFF0BF7000090FFF80
        0B088000000FFF80BF07700000000F0BF0888000000000B00777700000000B88
        888880000000B0F000000000000B08809D9D9D9000000F09D9D9D9D00000000D
        9D9D9D00000000D9D9D9D00000000000000000000000000000000000F0070000
        8003000000030000000300000003000000030000E0030000F0030000F0030000
        E0000000C0000000F0000000F0010000F0030000F0070000FAAF0000}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 42
    Width = 536
    Height = 271
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 313
    Width = 536
    Height = 35
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      536
      35)
    object btnHelp: TBitBtn
      Left = 376
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #24110#21161'(&H)'
      TabOrder = 0
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888880088888888888888008888888888888008888444888088800888844
        4888008008888888888800000888884478880000000088447888000000088884
        4888000000888888447800000887448874470000888447888444000888844788
        8444008888884488744708888888844444788888888888888888}
    end
    object btnClose: TBitBtn
      Left = 456
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #20851#38381'(&E)'
      ModalResult = 1
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
  end
  object DosMove1: TDosMove
    Active = True
    Options = [moEnter]
    Left = 128
    Top = 8
  end
end
