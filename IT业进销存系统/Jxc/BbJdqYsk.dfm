inherited frmBbJdqYsk: TfrmBbJdqYsk
  Left = -3
  Top = 128
  Caption = '将到期应收款'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = DataBb.sCqYsk
    Columns = <
      item
        Expanded = False
        FieldName = 'DJBH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XDRQ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YSJE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MSJE'
        PickList.Strings = ()
        Visible = True
      end>
  end
  inherited ControlBar1: TControlBar
    inherited ToolBar2: TToolBar
      Left = 617
    end
    inherited ToolBar1: TToolBar
      Width = 607
      ButtonWidth = 67
      inherited btnMx: TToolButton
        Caption = '查看单据'
      end
      inherited btnFxt: TToolButton
        Tag = 1
        Left = 551
      end
    end
  end
  inherited pnlFxt: TPanel
    inherited DBChart1: TDBChart
      AllowPanning = pmNone
      AllowZoom = False
      BackWall.Pen.Visible = False
      AxisVisible = False
      ClipPoints = False
      Frame.Visible = False
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      View3DWalls = False
      object Series1: TPieSeries
        Marks.ArrowLength = 8
        Marks.Style = smsPercent
        Marks.Visible = True
        DataSource = DataBb.KhXsHz
        SeriesColor = clRed
        XLabelsSource = 'cMC'
        OtherSlice.Text = 'Other'
        PieValues.DateTime = False
        PieValues.Name = 'Pie'
        PieValues.Multiplier = 1
        PieValues.Order = loNone
        PieValues.ValueSource = 'JEC'
      end
    end
  end
  inherited ActionList1: TActionList
    inherited aMx: TAction
      Tag = 0
      Caption = '查看单据(&E)'
    end
    inherited aFxt: TAction
      Tag = 1
    end
  end
end
