program ejercicio12;
const 
	valorAlto = 999;
type
	data = record
		ano: integer;
		mes: integer;
		dia: integer;
		id: integer;
		tiempo: real;
	end;
	
	maestro = file of data;
	
procedure gestionarReporte(var mae: maestro);

var
	d: data;
begin
	reset(mae);
	
var
	mae: maestro;
begin
	assign(mae, 'maestro');
	
	gestionarReporte(mae);
	
end.
