Program ejercicio6;
const 
	valorAlto = 999;
type
	data = record
		cod: integer;
		nombreEspecie: string[50];
		familia: string[50];
		descripcion: string[100];
		zona: string[50];
	end;
	
	maestro = file of data;

procedure leerMaestro(var mae: maestro; var d: data);
begin
	if(not eof(mae)) then begin
		read(mae, d);
	end else begin
		d.cod:= valorAlto;
	end;
end;
procedure efectuarBajas(var mae: maestro);
begin
	seek(mae, filesize(mae) -1);
	truncate(mae);
end;
	
procedure gestionarBajas(var mae: maestro);
var
	d: data;
	cod, posAct: integer;
begin
	reset(mae);
	writeln('Ingrese el codigo de la especie');
	readln(cod);
	leerMaestro(mae, d);
		
	while(d.cod <> valorAlto) and (d.cod <> cod) do begin
		leerMaestro(mae, d);
	end;
		
	if(d.cod = cod) then begin
		posAct:= filepos(mae) -1;
		seek(mae, filesize(mae) -1);
		read(mae, d);
		seek(mae, posAct);
		write(mae, d);
		efectuarBajas(mae);
	end;
	close(mae);
end;
		
var
	mae: maestro;
begin
	assign(mae, 'maestro');
	
	gestionarBajas(mae);
end.
