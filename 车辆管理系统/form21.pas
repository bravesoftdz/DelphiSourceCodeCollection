unit form21;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, DB, DBTables;

type
  Tform1_1 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form1_1: Tform1_1;

implementation

{$R *.dfm}

procedure Tform1_1.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure Tform1_1.FormShow(Sender: TObject);
begin
table1.Open;
end;

procedure Tform1_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
table1.close;
action:=cafree;

end;

end.
