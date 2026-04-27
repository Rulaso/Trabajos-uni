Program ejercicio5;
const
	valorAlto = 999;
type
	data = record
		cod_prenda: integer;
		descripcion: string[50];
		colores: string[10];
		tipo_prenda: string[30];
		stock: integer;
		precio_unitario: real;
	end;
	
	maestro = file of data;
	
	detalle = file of integer;
procedure leerMaestro(var mae: maestro; var d: data);
begin
	if(not eof(mae)) then begin
		read(mae, d);
	end else begin
		d.cod_prenda:= valorAlto;
	end;
end;	

procedure gestionarBajas(var mae: maestro; var det: detalle);	
	procedure leerDetalle(var det: detalle; var d: integer);
	begin
		if(not eof(det)) then begin
			read(det, d);
		end else begin
			d:= valorAlto;
		end;
	end;
var
	d: data;
	cod: integer;
	
begin
	reset(mae);
	reset(det);
	leerDetalle(det, cod);
	
	while(cod <> valorAlto) do begin
		leerMaestro(mae, d);
		
		while(d.cod_prenda <> valorAlto) and (d.cod_prenda <> cod) do begin
			leerMaestro(mae, d);
		end;
		
		if(d.cod_prenda = cod) then begin
			d.stock:= -1;
			seek(mae, filepos(mae) -1);
			write(mae, d);
			seek(mae, 0);
		end;
		
		leerDetalle(det, cod);
	end;
	close(mae);
	close(det);
end;

procedure efectuarBajas(var mae, aux: maestro);
var
	d: data;
begin
	reset(mae);
	reWrite(aux);
	
	leerMaestro(mae, d);
	while(d.cod_prenda <> valorAlto) do begin
		
		if(d.stock >= 0) then begin
			write(aux, d);
		end;
		
		leerMaestro(mae, d);
	end;
	close(mae);
	close(aux);
	erase(mae);
	rename(aux, 'maestro');
end;
	
var
	mae, nuevoMaestro: maestro;
	det: detalle;
begin
	assign(mae, 'maestro');
	assign(det, 'detalle');
	assign(nuevoMaestro, 'maestroAux');
	gestionarBajas(mae, det);
	
	efectuarBajas(mae, nuevoMaestro);
end.
