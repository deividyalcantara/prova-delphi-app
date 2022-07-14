unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ufTarefa2, ufTarefa3;

type
  TfPrincipal = class(TForm)
    Tarefas: TMainMenu;
    miTarefa1: TMenuItem;
    miTarefa2: TMenuItem;
    miTarefa3: TMenuItem;
    procedure miTarefa1Click(Sender: TObject);
    procedure miTarefa2Click(Sender: TObject);
    procedure miTarefa3Click(Sender: TObject);
  private
    procedure AbrirFormulario(formulario_class: TFormClass; verificar_aberto: Boolean = True);
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses
  ufTarefa1;

{$R *.dfm}

procedure TfPrincipal.AbrirFormulario(formulario_class: TFormClass; verificar_aberto: Boolean = True);
var
  formulario: TForm;
  i: Integer;
  existe: Boolean;
begin
  formulario := nil;
  existe := False;

  if verificar_aberto then begin
    for i := 0 to MDIChildCount - 1 do begin
      if MDIChildren[i].ClassName = formulario_class.ClassName then begin
        formulario := MDIChildren[i];
        existe := True;
        Break;
      end;
    end;
  end;

  if existe then begin
    if formulario.WindowState = TWindowState.wsMinimized then
      formulario.WindowState := TWindowState.wsNormal;
  end
  else
    formulario := formulario_class.Create(Application);

  formulario.Show;
end;

procedure TfPrincipal.miTarefa1Click(Sender: TObject);
begin
  AbrirFormulario(TfTarefa1);
end;

procedure TfPrincipal.miTarefa2Click(Sender: TObject);
begin
  AbrirFormulario(TfTarefa2);
end;

procedure TfPrincipal.miTarefa3Click(Sender: TObject);
begin
  AbrirFormulario(TfTarefa3);
end;

end.
