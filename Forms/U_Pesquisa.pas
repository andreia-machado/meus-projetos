unit U_Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrm_pesquisa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ed_pesquisa: TEdit;
    Label1: TLabel;
    bt_pesquisar: TBitBtn;
    cb_opcao: TComboBox;
    Label2: TLabel;
    procedure bt_pesquisarClick(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_pesquisa: TFrm_pesquisa;

implementation

{$R *.dfm}

uses U_Cadastro;



procedure TFrm_pesquisa.bt_pesquisarClick(Sender: TObject);
begin
  Frm_cadastro.Q_Cadastro.Close;
  Frm_cadastro.Q_Cadastro.Parameters.Clear;
  Frm_cadastro.Q_Cadastro.SQL.Add('');
  Frm_cadastro.Q_Cadastro.SQL.Clear;
  Frm_cadastro.Q_Cadastro.SQL.Add('select *from CadastroCompanhiaAerea2');

  case cb_opcao.ItemIndex of
  0:begin
    Frm_cadastro.Q_Cadastro.SQL.Add('WHERE codigo = :cod');
    Frm_cadastro.Q_Cadastro.Parameters.ParamByName('cod').Value:=StrToint(ed_pesquisa.Text);
  end;

  1:begin
    Frm_cadastro.Q_Cadastro.SQL.Add('WHERE cidadeSede = :pcidadeSede');
    Frm_cadastro.Q_Cadastro.Parameters.ParamByName('pcidadeSede').Value:=(ed_pesquisa.Text);
  end;

  end;
end;


end.


