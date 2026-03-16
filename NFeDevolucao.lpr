program NFeDevolucao;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}cthreads,{$ENDIF}
  Interfaces,
  Forms,
  uConstantes in 'src/uConstantes.pas',
  uSeguranca  in 'src/uSeguranca.pas',
  uBancoDados in 'src/uBancoDados.pas',
  uXmlNFe     in 'src/uXmlNFe.pas',
  uJson       in 'src/uJson.pas',
  frmLogin    in 'src/frmLogin.pas',
  frmMain     in 'src/frmMain.pas';

{$R *.res}

var
  Usuario: TUsuario;

begin
  Application.Initialize;
  Application.Title := APP_TITLE;
  RequireDerivedFormResource := True;

  InitDB;

  if not TemUsuarios then
  begin
    with TfPrimeiroAcesso.Create(nil) do
    try
      if ShowModal = mrOk then
        Usuario := UsuarioCriado
      else begin Application.Terminate; Exit; end;
    finally Free; end;
  end
  else
  begin
    with TfLogin.Create(nil) do
    try
      if ShowModal = mrOk then
        Usuario := UsuarioLogado
      else begin Application.Terminate; Exit; end;
    finally Free; end;
  end;

  Application.CreateForm(TfMain, fMain);
  fMain.Inicializar(Usuario);
  Application.Run;
end.
