unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait;

type
  TspQuery = class(TFDQuery)
  private
    FSPCONDICOES: TStringList;
    FSPCOLUNAS: TStringList;
    FSPTABELAS: TStringList;

    function GetFSPCOLUNAS: TStringList;
    function GetFSPCONDICOES: TStringList;
    function GetFSPTABELAS: TStringList;
    procedure SetFSPCOLUNAS(const Value: TStringList);
    procedure SetFSPCONDICOES(const Value: TStringList);
    procedure SetFSPTABELAS(const Value: TStringList);

  public
    constructor Create; reintroduce; overload;
    destructor Destroy; override;
    function GeraSQL: string;

  published
     property spCondicoes: TStringList read GetFSPCONDICOES write SetFSPCONDICOES;
     property spColunas: TStringList read GetFSPCOLUNAS write SetFSPCOLUNAS;
     property spTabelas: TStringList read GetFSPTABELAS write SetFSPTABELAS;
  end;

implementation

{ TspQuery }

constructor TspQuery.Create;
begin
  inherited Create(nil);
  FSPCONDICOES := TStringList.Create;
  FSPCOLUNAS := TStringList.Create;
  FSPTABELAS := TStringList.Create;
  FSPTABELAS.StrictDelimiter
end;

destructor TspQuery.Destroy;
begin
  FSPCONDICOES.Free;
  FSPCOLUNAS.Free;
  FSPTABELAS.Free;
  inherited;
end;

function TspQuery.GeraSQL: string;
var
 //tab: Integer;
 col: Integer;
 cod: Integer;
 linha: string;

 function EspacoEQuebraDeLinha: string;
 begin
   Result := ' ' + #13;
 end;
begin
  // VALIDAÇÕES....

  Result := 'select' + EspacoEQuebraDeLinha;

  for col := 0 to spColunas.Count - 1 do begin
    linha := AnsiUpperCase(Trim(spColunas.Strings[col]));

    if linha = '' then
      Continue;

    Result := Result + '  ' + linha;

    if col <> spColunas.Count - 1 then
      Result := Result + ',';

     Result := Result + EspacoEQuebraDeLinha;
  end;

  // CASO NÃO SEJA DEFINIDO NENHUMA COLUNA, BUSCAR TODOS
  if spColunas.Count = 0 then
    Result := Result + '  *' + EspacoEQuebraDeLinha;

  Result := Result + 'from' + EspacoEQuebraDeLinha;

  if spTabelas.Count > 0 then
    Result := Result + '  ' + AnsiUpperCase(spTabelas.Strings[0]) + EspacoEQuebraDeLinha
  else
    Result := Result + '  DUAL' + EspacoEQuebraDeLinha; // DUAL É UMA "TABELA VIRTUAL", CASO O USUÁRIO NÃO ADICIONE NENHUMA TABELA

  // AQUI É UMA DÚVIDA SE JÁ DEVERIA ADICIONAR O WHERE POR PADRÃO, NÃO SEI, DEPENTE DA REGRA DE NEGÓCIO AÍ
  for cod := 0 to spCondicoes.Count - 1 do begin
    linha := Trim(spCondicoes.Strings[cod]);
    Result := Result + linha + EspacoEQuebraDeLinha;
  end;

  SQL.Add(Result);
end;

function TspQuery.GetFSPCOLUNAS: TStringList;
begin
  Result := FSPCOLUNAS;
end;

function TspQuery.GetFSPCONDICOES: TStringList;
begin
  Result := FSPCONDICOES;
end;

function TspQuery.GetFSPTABELAS: TStringList;
begin
  Result := FSPTABELAS;
end;

procedure TspQuery.SetFSPCOLUNAS(const Value: TStringList);
begin
  FSPCOLUNAS := Value;
end;

procedure TspQuery.SetFSPCONDICOES(const Value: TStringList);
begin
  FSPCONDICOES := Value;
end;

procedure TspQuery.SetFSPTABELAS(const Value: TStringList);
begin
  FSPTABELAS := Value;
end;

end.
