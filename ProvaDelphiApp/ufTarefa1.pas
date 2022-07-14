unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uspQuery;

type
  TfTarefa1 = class(TForm)
    meColunas: TMemo;
    lbColunas: TLabel;
    meTabelas: TMemo;
    lbTabelas: TLabel;
    meCondicoes: TMemo;
    lbCondicoes: TLabel;
    btGeraSQL: TButton;
    meSQLGerado: TMemo;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btGeraSQLClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

implementation

{$R *.dfm}

procedure TfTarefa1.btGeraSQLClick(Sender: TObject);
var
  query: TspQuery;
begin
  if meTabelas.Lines.Count > 1 then // FOI PEDIDO PARA INSERIR UM "EXCE��O" AO INVES DE UMA MENSAGEM AMIGAVEL, POR�M N�O FICOU CLARO ONDE
    raise Exception.Create('� permitido informar apenas uma tabela para a gera��o do SQL!');

  query := TspQuery.Create;
  try
    // UM OUTRO PONTO QUE N�O FICOU CLARO, � SE SERIA DIGITADO POR EXEMPLO AS COLUNAS COM ',' ou ESPACO
    // CLARO QUE TUDO ISSO PODERIA SER TRATADO NO METODOS DE ENCAPSULAMENTO DE CADA ATRIBUTO,
    // MAS COMO N�O TEM NADA SOBRE NA AVALIA��O DEIXAREI DESSA FORMA
    query.spCondicoes.AddStrings(meCondicoes.Lines);
    query.spColunas.AddStrings(meColunas.Lines);
    query.spTabelas.AddStrings(meTabelas.Lines);
    meSQLGerado.Lines.Text := query.GeraSQL; // Ou meSQLGerado := query.SQL.Text;
  finally
    query.Free;
  end;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  Release;
end;

procedure TfTarefa1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
