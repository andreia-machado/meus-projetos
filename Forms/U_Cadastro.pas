unit U_Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.NumberBox, Data.Bind.ObjectScope, Data.Bind.DBScope, Data.Bind.DBXScope;

type
  TFrm_cadastro = class(TForm)
    Conexao: TADOConnection;
    Q_Cadastro: TADOQuery;
    Ds_cadastro: TDataSource;
    Q_Cadastrocodigo: TIntegerField;
    Q_CadastrocidadeSede: TStringField;
    Q_CadastroaeroportoSede: TStringField;
    Q_CadastroquantidadeDeAvioes: TIntegerField;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    bt_novo: TBitBtn;
    bt_editar: TBitBtn;
    bt_deletar: TBitBtn;
    bt_gravar: TBitBtn;
    bt_cancelar: TBitBtn;
    bt_atualizar: TBitBtn;
    bt_sair: TBitBtn;
    DBNavigator1: TDBNavigator;
    db_cod: TDBEdit;
    bt_pesquisar: TBitBtn;
    Label6: TLabel;
    id: TDBEdit;
    Q_Cadastroid: TIntegerField;
    ParamsAdapter1: TParamsAdapter;

    procedure bt_editarClick(Sender: TObject);
    procedure bt_deletarClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_atualizarClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure bt_pesquisarClick(Sender: TObject);
    procedure bt_novoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetupConnection(DataBase:String);





  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_cadastro: TFrm_cadastro;

implementation

{$R *.dfm}

uses U_Pesquisa;



const
//the connection string
StrConnection='Driver={SQL Server Native Client 11.0};Server=127.0.0.1;Database=bd_simulador_v2.0.0.9;User_Name=sa; Password=deia;';

var
Conexao : TADOConnection;

procedure TFrm_cadastro.SetupConnection(DataBase:String);//Open a connection
begin
  Writeln('Connecting to SQL');
  Conexao:=TADOConnection.Create(nil);
  Conexao.LoginPrompt:=False;//dont ask for the login parameters
  Conexao.ConnectionString:=Format(StrConnection,['127.0.0.1',DataBase,'sa','deia']);
  Conexao.Connected:=True; //open the connection
  Writeln('Connected');
end;





procedure TFrm_cadastro.bt_atualizarClick(Sender: TObject);
begin
//Configuração do botão de atualizar
  Q_cadastro.Refresh;
  Messagedlg('Registro atualizado com sucesso!',mtInformation,[mbOK],0);
end;

procedure TFrm_cadastro.bt_cancelarClick(Sender: TObject);
begin
//Configuração do botão de cancelar
  Q_cadastro.Cancel;
end;

procedure TFrm_cadastro.bt_deletarClick(Sender: TObject);
begin
//Configuração do botão de deletar
  if messagedlg('Deseja excluir este registro?' ,mtConfirmation, [mbOK, mbNo],0)=mrOK then
  begin
    Q_cadastro.Delete;
  end
  else
  abort;
end;

procedure TFrm_cadastro.bt_editarClick(Sender: TObject);
begin
//configuração do botão de editar
   if messagedlg('Deseja alterar este registro?',mtConfirmation,[mbOK, mbNo],0)=mrOK then
   begin
      Q_cadastro.Edit;
   end
   else
   abort;
end;

procedure TFrm_cadastro.bt_gravarClick(Sender: TObject);
begin
//configuração do botão de gravar/salvar
  Q_cadastro.Post;
  Messagedlg('Registro salvo com sucesso!',mtInformation,[mbOK],0);
end;


//configuração bor=tão novo + auto increment de id
procedure TFrm_cadastro.bt_novoClick(Sender: TObject);
var prox:Integer;
begin
  Ds_cadastro.DataSet.Open;
  Q_Cadastro.Open;
  Q_Cadastro.last;
  prox:=Q_Cadastroid.AsInteger + 1;
  Q_Cadastro.Append;
  Q_Cadastroid.AsInteger:=prox;
  db_cod.SetFocus;
end;

procedure TFrm_cadastro.bt_pesquisarClick(Sender: TObject);
begin
Frm_pesquisa:=Tfrm_pesquisa.Create(self);
Frm_pesquisa.ShowModal;
try

finally
 Frm_pesquisa.Free;
 Frm_pesquisa:=nil;
end;
end;

procedure TFrm_cadastro.bt_sairClick(Sender: TObject);
begin
  //código do botão sair
 if messagedlg('Deseja sair do sistema?' ,mtConfirmation, [mbOK, mbNo],0)=mrOK then
  begin
    Application.Terminate;
  end
  else
  abort;
end;





procedure TFrm_cadastro.FormCreate(Sender: TObject);
begin
  SetupConnection('bd_simulador_v2.0.0.9');
end;

end.
