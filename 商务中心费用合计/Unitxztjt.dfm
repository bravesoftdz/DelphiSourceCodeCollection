object Formxztjt: TFormxztjt
  Left = 202
  Top = 409
  Width = 737
  Height = 541
  BorderIcons = [biSystemMenu]
  Caption = #36873#25321#26102#38388#37096#38376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 63
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 682
      Top = 9
      Width = 37
      Height = 42
      Caption = #25171#21360
      Flat = True
      OnClick = SpeedButton1Click
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 1
      Width = 271
      Height = 57
      Caption = #36873#25321#26085#26399
      TabOrder = 0
      object Label1: TLabel
        Left = 18
        Top = 15
        Width = 48
        Height = 12
        Caption = #24320#22987#26085#26399
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 18
        Top = 36
        Width = 48
        Height = 12
        Caption = #32467#26463#26085#26399
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object DTPks: TDateTimePicker
        Left = 78
        Top = 9
        Width = 186
        Height = 21
        Date = 39142.000000000000000000
        Time = 39142.000000000000000000
        TabOrder = 0
      end
      object DTPjs: TDateTimePicker
        Left = 78
        Top = 32
        Width = 186
        Height = 21
        Date = 39142.000000000000000000
        Time = 39142.000000000000000000
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 277
      Top = 8
      Width = 272
      Height = 48
      Caption = #36873#25321#37096#38376
      TabOrder = 1
      object Label3: TLabel
        Left = 27
        Top = 19
        Width = 24
        Height = 12
        Caption = #37096#38376
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object CBbm: TComboBox
        Left = 79
        Top = 14
        Width = 182
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object Button2: TButton
      Left = 569
      Top = 32
      Width = 109
      Height = 25
      Caption = #36864#20986
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 568
      Top = 6
      Width = 109
      Height = 25
      Caption = #30830#23450
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 63
    Width = 729
    Height = 451
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object DBChart1: TDBChart
      Left = 2
      Top = 2
      Width = 725
      Height = 447
      AnimatedZoom = True
      AnimatedZoomSteps = 22
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Gradient.Visible = True
      MarginBottom = 0
      MarginLeft = 0
      MarginRight = 0
      MarginTop = 0
      PrintProportional = False
      Title.Font.Charset = ANSI_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -19
      Title.Font.Name = #23435#20307
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        #21830#21153#20013#24515#37096#38376#26376#20221#32479#35745#37329#39069#22270)
      Legend.ShadowSize = 0
      Legend.TopPos = 11
      MaxPointsPerPage = 21
      View3DOptions.Elevation = 318
      View3DOptions.HorizOffset = 8
      View3DOptions.Perspective = 14
      View3DOptions.VertOffset = 2
      View3DOptions.Zoom = 97
      Align = alClient
      BevelWidth = 0
      TabOrder = 0
      object Series1: TBarSeries
        Marks.ArrowLength = 8
        Marks.Visible = True
        DataSource = DM.ADOTJ
        SeriesColor = clRed
        XLabelsSource = 'name'
        BarStyle = bsCilinder
        BarWidthPercent = 75
        OffsetPercent = -80
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'jie'
      end
    end
  end
end
