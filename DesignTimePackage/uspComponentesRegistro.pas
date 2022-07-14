unit uspComponentesRegistro;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, uspQuery;

type
  TuspComponentesRegistro = class(TComponent)
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('spComponentes', [TspQuery]);
end;

end.
