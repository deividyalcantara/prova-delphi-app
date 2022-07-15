unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Comp.Client, System.Generics.Collections;

type
  WebComponentesDados = record
    data_set: TFDMemTable;
    data_source: TDataSource;
  end;

  TfTarefa3 = class(TForm)
    lbTituloGrid: TLabel;
    btObeterTotal: TButton;
    btObterTotalDivisoes: TButton;
    edTotal: TEdit;
    edTotalDivisoes: TEdit;
    lbTotal: TLabel;
    lbTotalDivisoes: TLabel;
    dgProjeto: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btObeterTotalClick(Sender: TObject);
    procedure btObterTotalDivisoesClick(Sender: TObject);
    private
      componentes_dados: WebComponentesDados;

      procedure BuscarProjetos;
      procedure RecuperarPosicaoQuery(posicao: Integer);
  end;


implementation

{$R *.dfm}

procedure TfTarefa3.btObeterTotalClick(Sender: TObject);
var
  total_projeto: Double;
  posicao_inicial: Integer;
begin
  total_projeto := 0;
  componentes_dados.data_source.Enabled := False;

  with componentes_dados.data_set do begin
    posicao_inicial := FieldByName('idProjeto').AsInteger;

    First;
    while not Eof do begin
      total_projeto := total_projeto + FieldByName('Valor').AsCurrency;
      Next;
    end;
  end;

  RecuperarPosicaoQuery(posicao_inicial);
  edTotal.Text :=  FormatFloat('#,##0.00', total_projeto);
  componentes_dados.data_source.Enabled := True;
end;

procedure TfTarefa3.btObterTotalDivisoesClick(Sender: TObject);
var
  total_projeto_divisoes: Double;
  posicao_inicial: Integer;
  final_query: Integer;
  valor_proximo: Double;
begin
  total_projeto_divisoes := 0;
  componentes_dados.data_source.Enabled := False;

  with componentes_dados.data_set do begin
    posicao_inicial := FieldByName('idProjeto').AsInteger;

    Last;
    final_query := FieldByName('idProjeto').AsInteger;

    First;
    while not Eof do begin
      if final_query <> FieldByName('idProjeto').AsInteger then  begin
        Next;
        valor_proximo := FieldByName('Valor').AsCurrency;

        Prior;
        total_projeto_divisoes := total_projeto_divisoes + (valor_proximo / FieldByName('Valor').AsCurrency);
      end;

      Next;
    end;
  end;

  RecuperarPosicaoQuery(posicao_inicial);
  edTotalDivisoes.Text := FormatFloat('#,##0.00', total_projeto_divisoes);
  componentes_dados.data_source.Enabled := True;
end;

procedure TfTarefa3.BuscarProjetos;
  var
    i: Integer;
    novo_field: TField;
    detalhes_dataset: TList<TDataSet>;

  procedure AdicionarField(nome: string; tipo: TFieldType; tamanho: Integer = -1);
  begin
    with componentes_dados.data_set.FieldDefs.AddFieldDef do begin
      Name := nome;
      DataType := tipo;
      DisplayName := nome;

      if tamanho <> -1 then
        Size := tamanho;
    end;
  end;
begin
  AdicionarField('idProjeto', TFieldType.ftInteger);
  AdicionarField('Projeto', TFieldType.ftString, 70);
  AdicionarField('Valor', TFieldType.ftCurrency);

  componentes_dados.data_set.Open;

  for i := 10 downto 1 do begin
    componentes_dados.data_set.Insert;

    for novo_field in componentes_dados.data_set.Fields do begin
      if novo_field.DisplayName = 'idProjeto' then begin
        novo_field.AsInteger := i;
        novo_field.Alignment := TAlignment.taRightJustify;
      end
      else if novo_field.DisplayName = 'Valor' then begin
        novo_field.AsString := IntToStr(i * 10);
        novo_field.Alignment := TAlignment.taRightJustify;
      end
      else if novo_field.DisplayName = 'Projeto' then
        novo_field.AsString := 'Projeto ' + IntToStr(i);
    end;

    componentes_dados.data_set.Post;

    detalhes_dataset := TList<TDataSet>.Create;
    try
      componentes_dados.data_set.GetDetailDataSets(detalhes_dataset);
    finally
      detalhes_dataset.Free;
    end;
  end;

  componentes_dados.data_set.First;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  Release;
end;

procedure TfTarefa3.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfTarefa3.FormShow(Sender: TObject);
  procedure InicializarComponentesDados;
  var
    clienteDataSet: TFDMemTable;
    dataSource: TDataSource;
  begin
    clienteDataSet := TFDMemTable.Create(Self);
    with clienteDataSet do begin
      Parent := Self;
      Name := 'spProjetos';
    end;

    dataSource := TDataSource.Create(Self);
    with dataSource do begin
      Parent := Self;
      Name := 'dsProjetos';
      DataSet := clienteDataSet;
    end;

    dgProjeto.DataSource := dataSource;

    componentes_dados.data_set := clienteDataSet;
    componentes_dados.data_source := dataSource;
  end;
begin
  InicializarComponentesDados;
  BuscarProjetos;
end;

procedure TfTarefa3.RecuperarPosicaoQuery(posicao: Integer);
begin
  with componentes_dados.data_set do begin
    First;
    while not Eof do begin
      if posicao <> FieldByName('idProjeto').AsInteger then begin
        Next;
        Continue;
      end;

      Break;
    end;
  end;
end;

end.
