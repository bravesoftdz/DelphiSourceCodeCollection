program TimeServer;

uses
  {$IFDEF Linux}
  QForms,
  {$ELSE}
  Forms,
  {$ENDIF}
  Main in 'Main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
