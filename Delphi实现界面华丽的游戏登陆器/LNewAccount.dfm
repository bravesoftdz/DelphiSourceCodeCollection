object frmNewAccount: TfrmNewAccount
  Left = 571
  Top = 201
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #26032#24314#30331#24405#24080#21495
  ClientHeight = 324
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Label14: TLabel
    Left = 13
    Top = 304
    Width = 66
    Height = 12
    Caption = #26381#21153#22120#29366#24577':'
  end
  object LabelStatus: TLabel
    Left = 80
    Top = 304
    Width = 6
    Height = 12
    Font.Charset = GB2312_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 417
    Height = 289
    Caption = #24080#21495#20449#24687
    TabOrder = 0
    object Label9: TLabel
      Left = 8
      Top = 20
      Width = 54
      Height = 12
      Caption = #30331#24405#24080#21495':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 44
      Width = 54
      Height = 12
      Caption = #29992#25143#23494#30721':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 68
      Width = 54
      Height = 12
      Caption = #30830#35748#23494#30721':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 92
      Width = 54
      Height = 12
      Caption = #29992#25143#21517#31216':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 116
      Width = 54
      Height = 12
      Caption = #36523#20221#35777#21495':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 140
      Width = 54
      Height = 12
      Caption = #20986#29983#26085#26399':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 164
      Width = 42
      Height = 12
      Caption = #38382#39064#19968':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 188
      Width = 42
      Height = 12
      Caption = #31572#26696#19968':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 236
      Width = 42
      Height = 12
      Caption = #31572#26696#20108':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 212
      Width = 42
      Height = 12
      Caption = #38382#39064#20108':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 208
      Top = 164
      Width = 54
      Height = 12
      Caption = #32852#31995#30005#35805':'
    end
    object Label12: TLabel
      Left = 208
      Top = 188
      Width = 54
      Height = 12
      Caption = #25163#26426#21495#30721':'
    end
    object Label13: TLabel
      Left = 8
      Top = 260
      Width = 54
      Height = 12
      Caption = #37038#31665#22320#22336':'
    end
    object Label15: TLabel
      Left = 216
      Top = 220
      Width = 180
      Height = 29
      AutoSize = False
      Caption = #27880#24847#65306#26631#26126#20026#32418#33394#30340#20026#24517#38656#35201#22635#20889#30340#20869#23481#12290
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object EditPassword: TEdit
      Left = 64
      Top = 40
      Width = 89
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      OnEnter = EditEnter
    end
    object EditAccount: TEdit
      Left = 64
      Top = 16
      Width = 89
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      OnEnter = EditEnter
    end
    object EditConfirm: TEdit
      Left = 64
      Top = 64
      Width = 89
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      OnEnter = EditEnter
    end
    object EditYourName: TEdit
      Left = 64
      Top = 88
      Width = 89
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      OnEnter = EditEnter
    end
    object EditSSNo: TEdit
      Left = 64
      Top = 112
      Width = 89
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 4
      Text = '123456789'
      OnEnter = EditEnter
    end
    object EditBirthDay: TEdit
      Left = 64
      Top = 136
      Width = 89
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 5
      OnEnter = EditEnter
    end
    object EditQuiz1: TEdit
      Left = 64
      Top = 160
      Width = 137
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 6
      OnEnter = EditEnter
    end
    object EditAnswer1: TEdit
      Left = 64
      Top = 184
      Width = 137
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 7
      OnEnter = EditEnter
    end
    object EditQuiz2: TEdit
      Left = 64
      Top = 208
      Width = 137
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 8
      OnEnter = EditEnter
    end
    object EditAnswer2: TEdit
      Left = 64
      Top = 232
      Width = 137
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 9
      OnEnter = EditEnter
    end
    object MemoHelp: TMemo
      Left = 168
      Top = 16
      Width = 241
      Height = 137
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Ctl3D = True
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 13
    end
    object EditPhone: TEdit
      Left = 264
      Top = 160
      Width = 137
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 11
      OnEnter = EditEnter
    end
    object EditMobPhone: TEdit
      Left = 264
      Top = 184
      Width = 137
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 12
      OnEnter = EditEnter
    end
    object EditEMail: TEdit
      Left = 64
      Top = 256
      Width = 137
      Height = 20
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 10
      OnEnter = EditEnter
    end
    object ButtonOK: TRzButton
      Left = 320
      Top = 249
      Width = 81
      Height = 33
      Caption = #30830#23450'(&O)'
      HotTrack = True
      TabOrder = 14
      OnClick = ButtonOKClick
    end
  end
end
