unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TArrayOfThread = Array of TThread;

  TfTarefa2 = class(TForm)
    pbThread1: TProgressBar;
    lbTempoThread1: TLabel;
    pbThread2: TProgressBar;
    btIniciar: TButton;
    lbTempoThread2: TLabel;
    edTempoThread1: TEdit;
    edTempoThread2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btIniciarClick(Sender: TObject);
    procedure edTempoThread1KeyPress(Sender: TObject; var Key: Char);
    procedure edTempoThread2KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    private
      lista_thread: TArrayOfThread;
      thread_progresso_finalizadas: Integer;

      procedure AceitarSomenteNumero(var Key: Char);
      procedure IniciarProgressoBar(progresso_bar: TProgressBar; edit_tempo_ms: TEdit);
      procedure FinalizacaoThread(Sender: TObject);
  end;

implementation

const
  cThread_Concluida = 0;

{$R *.dfm}

procedure TfTarefa2.AceitarSomenteNumero(var Key: Char);
begin
  if ((not CharInSet(key, ['0'..'9'])) and (word(key) <> VK_BACK)) then
    key := #0;
end;

procedure TfTarefa2.btIniciarClick(Sender: TObject);
begin
  btIniciar.Enabled := False;

  IniciarProgressoBar(pbThread1, edTempoThread1);
  IniciarProgressoBar(pbThread2, edTempoThread2);
end;

procedure TfTarefa2.edTempoThread1KeyPress(Sender: TObject; var Key: Char);
begin
  AceitarSomenteNumero(key);
end;

procedure TfTarefa2.edTempoThread2KeyPress(Sender: TObject; var Key: Char);
begin
  AceitarSomenteNumero(key);
end;

procedure TfTarefa2.FinalizacaoThread(Sender: TObject);
begin
  thread_progresso_finalizadas := thread_progresso_finalizadas + 1;

  if thread_progresso_finalizadas = 2 then begin
    btIniciar.Enabled := True;
    thread_progresso_finalizadas := 0;
  end;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  Release;
end;

procedure TfTarefa2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i: Integer;
begin
  for i := Low(lista_thread) to High(lista_thread) do begin
    if Assigned(lista_thread[i]) then begin
       lista_thread[i].Terminate;
       lista_thread[i].DisposeOf;
    end;
  end;

  CanClose := True;
end;

procedure TfTarefa2.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfTarefa2.IniciarProgressoBar(progresso_bar: TProgressBar; edit_tempo_ms: TEdit);
var
  thread_bar: TThread;
begin
  thread_bar := TThread.CreateAnonymousThread(procedure
  var
    i: Integer;
    tempo: Integer;
  begin
    SetLength(lista_thread, Length(lista_thread) + 1);
    lista_thread[High(lista_thread)] := thread_bar;

    tempo := StrToIntDef(edit_tempo_ms.Text, 10);

    for i := 0 to 100 do begin
      thread_bar.Synchronize(nil, procedure
      begin
        progresso_bar.Position := i;
      end);

      Sleep(tempo);
    end;
  end);

  thread_bar.OnTerminate := FinalizacaoThread;
  thread_bar.FreeOnTerminate := False;
  thread_bar.Start;
end;

end.
