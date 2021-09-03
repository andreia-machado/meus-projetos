program Contato;

uses
  Vcl.Forms,
  U_Cadastro in '..\Forms\U_Cadastro.pas' {Frm_cadastro},
  U_Pesquisa in '..\Forms\U_Pesquisa.pas' {Frm_pesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_cadastro, Frm_cadastro);
  Application.CreateForm(TFrm_pesquisa, Frm_pesquisa);
  Application.Run;
end.
