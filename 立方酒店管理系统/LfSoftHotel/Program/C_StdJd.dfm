object StdJdForm: TStdJdForm
  Left = 140
  Top = 107
  Width = 544
  Height = 375
  Caption = 'StdJdForm'
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
    object lblTitile: TLabel
      Left = 192
      Top = 5
      Width = 145
      Height = 29
      Anchors = [akTop]
      Caption = 'lblTitile'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Image1: TImage
      Left = 152
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
        0000000000011111111111111111111111000000011877777777777777777777
        77000000010000000000000000000000008000000050FFFFFFFFFFFFFF777777
        7F00000007050FFFFFFFFFFF777777FFFF00000000095088888888888888888F
        FF0000000015950FFFFF7777777FFFFFFF00000007095950888888888888888F
        FF000000000595990777777777FFFFFFFF00000000195959088888888888888F
        FF0000000705959907777777FFFFFFFFFF00000000095959088888888888888F
        FF00000000159599077777FFFFFFFFFFFF00000007095959080888888888888F
        F0D9D9000005959907F00FFFF000000FF00D9D9000195959088050000FFFFF80
        0880D9D0070595990FFF00FFFFFFFFFFFFFF0D9000095959088880000008FFFF
        FFFF09D0001595990FFFF00D0F08FFFFFFFF0D900709595908888080D008FFFF
        FFFF09D0000995990FFFF0F80D08FFFFFFF00000000099590000000F80D0FFFF
        F00000000000099900000000F80D0FFF0000000000000099000000000FF0D000
        00000000000000090000000000000D00000000000000000000000000000000D0
        0000000000000000000000000000000D00000000000000000000000000000000
        D00000000000000000000000000000000D000000000000000000000000000000
        00D0000000000000000000000000000000000000FFFFFFFFE000003F8000001F
        8000000F8000000F0000000F0000000F8000000F0000000F0000000F8000000F
        0000000F0000000F800000030000000100000000800000000000000000000000
        800000000000000000000001E000001FF07E007FF87F00FFFC7F81FFFE7FF8FF
        FFFFFC7FFFFFFE3FFFFFFF1FFFFFFF8FFFFFFFCF280000001000000020000000
        0100040000000000C00000000000000000000000000000000000000000000000
        00008000008000000080800080000000800080008080000080808000C0C0C000
        0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0001111111
        11111000000000000000000000FFFFFF77777000000888888888F00009D0FF77
        7FFFF000009D08888888F00009D9077FFFFFF000009D0888000FF09009D90000
        0FF000D0009D080000FFF09009D90F0FD0FFF000009D000FFD0F000000090000
        00D0000000000000000D0000000000000000D000000000000000000080070000
        8003000000030000800300000003000080030000000100008000000000000000
        800000000000000080030000C60F0000E7C70000FFE30000FFF30000}
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
    object Bevel1: TBevel
      Left = 5
      Top = 5
      Width = 526
      Height = 261
      Align = alClient
      Shape = bsFrame
    end
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
    object btnOK: TBitBtn
      Left = 376
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #30830#23450'(&O)'
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCanc: TBitBtn
      Left = 456
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #21462#28040'(&C)'
      ModalResult = 1
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object DosMove1: TDosMove
    Active = True
    Options = [moEnter]
    Left = 104
    Top = 8
  end
end
