object frmYfsz: TfrmYfsz
  Left = 247
  Top = 181
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '月份设置'
  ClientHeight = 100
  ClientWidth = 252
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = '宋体'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object labRq: TLabel
    Left = 31
    Top = 18
    Width = 60
    Height = 15
    Caption = '统计月份'
    Transparent = True
  end
  object btnCancel: TBitBtn
    Left = 133
    Top = 54
    Width = 90
    Height = 31
    Caption = '取消(&C)'
    TabOrder = 2
    Kind = bkCancel
  end
  object dtpRq: TDateTimePicker
    Left = 98
    Top = 14
    Width = 107
    Height = 23
    CalAlignment = dtaLeft
    Date = 36153.3852850694
    Time = 36153.3852850694
    DateFormat = dfLong
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object btnOk: TBitBtn
    Left = 31
    Top = 54
    Width = 90
    Height = 31
    Caption = '确定(&O)'
    TabOrder = 1
    OnClick = btnOkClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
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
end
