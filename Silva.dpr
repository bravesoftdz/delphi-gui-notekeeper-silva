program silva;

uses
  madExcept,
  madLinkDisAsm,
  Forms,
  sysutils,
  dialogs,
  main;

{$R *.RES}

begin
  try
    Application.Initialize;
    Application.ShowMainForm := False;
    Application.CreateForm(TForm1, Form1);
    Application.Run;
  except on E: Exception do
    showmessage(E.message);
  end;
end.
