program pwdgen;

uses
  Forms,
  main in 'main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '��������� ������� �������';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
