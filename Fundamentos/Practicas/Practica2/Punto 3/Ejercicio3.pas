program Ejercicio3;
const 
	valorAlto = '999';
type
	data = record
		provincia: string[50];
		totalAlfa: integer;
		totalEncuesta: integer;
	end;
	
	dataD = record
		provincia: string[50];
		cod: integer;
		totalAlfa: integer;
		totalEncuesta: integer;
	end;
	
	maestro = file of data;
	
	detalle = file of dataD;
	
procedure generarMaestro(var mae: maestro);
	procedure leer(var d: data);
	begin
		writeln('Ingrese el nombre de la provincia');
		readln(d.provincia);
		
		writeln('Ingrese el total alfabetizado');
		readln(d.totalAlfa);
		
		writeln('Ingrese el total encuestado');
		readln(d.totalEncuesta);
	end;
var
	d: data;
	i: integer;
begin
	reWrite(mae);
	
	for i:=1 to 7 do begin
		leer(d);
		
		write(mae, d);
	end;
	
	close(mae);
end;

procedure generarDetalle(var det: detalle);
	procedure leer(var d: dataD);
	begin
		writeln('Ingrese el nombre de la provincia');
		readln(d.provincia);
		
		writeln('Ingrese el codigo de localidad');
		readln(d.cod);
		
		writeln('Ingrese el total alfabetizado');
		readln(d.totalAlfa);
		
		writeln('Ingrese el total encuestado');
		readln(d.totalEncuesta);
	end;
var
	d: dataD;
	i: integer;
begin
	reWrite(det);
	
	for i:=1 to 5 do begin 
		leer(d);
		write(det, d);
	end;
	
	close(det);
end;

procedure imprimirMaestro(var mae: maestro);
	procedure leerMaestro(var mae: maestro; var d: data);
	begin
		if(not eof(mae)) then begin
			read(mae, d);
		end else begin
			d.provincia:= valorAlto;
		end;
	end;
var
	d: data;
begin
	reset(mae);
	
	leerMaestro(mae, d);
	
	while(d.provincia <> valorAlto) do begin
		writeln('Provincia: ', d.provincia);
		writeln('Cantidad alfabetizados: ', d.totalAlfa);
		writeln('Total encuestados: ', d.totalEncuesta);
		writeln;
		leerMaestro(mae, d);
	end;
	close(mae);
end;

procedure leerDetalle(var det: detalle;var d: dataD);
begin
	if(not eof(det)) then begin
		read(det, d);
	end else begin
		d.provincia:= valorAlto;
	end;
end;

procedure imprimirDetalle(var det: detalle); 
var
	d: dataD;
begin
	reset(det);
	
	leerDetalle(det, d);
	
	while(d.provincia <> valorAlto) do begin
		writeln('Provincia: ', d.provincia);
		writeln('Codigo: ', d.cod);
		writeln('Total alfabetizados: ', d.totalAlfa);
		writeln('Total encuestados: ',d.totalEncuesta);
		writeln;
		leerDetalle(det, d);
	end;
	close(det);
end;

procedure actualizarMaestro(var mae: maestro; var det1, det2: detalle);
	procedure minimo(var det1, det2: detalle; var r1, r2, min: dataD);
	begin
		if(r1.provincia <= r2.provincia) then begin
			min:= r1;
			leerDetalle(det1, r1);
		end else begin
			min:= r2;
			leerDetalle(det2, r2);
		end;
	end;
var
	d: data;
	regd1, regd2, min: dataD;
begin
	reset(mae);
	reset(det1);
	reset(det2);
	leerDetalle(det1, regd1);
	leerDetalle(det2, regd2);
	minimo(det1, det2, regd1, regd2, min);
	while(min.provincia <> valorAlto) do begin
		read(mae, d);
		while(d.provincia <> min.provincia) do begin
			read(mae, d);
		end;
		while(min.provincia = d.provincia) do begin
			d.totalAlfa:= d.totalAlfa + min.totalAlfa;
			d.totalEncuesta:= d.totalEncuesta + min.totalEncuesta;
			minimo(det1, det2, regd1, regd2, min);
		end;
		seek(mae, filepos(mae)-1);
		write(mae, d);
	end;
	close(mae);
	close(det1);
	close(det2);
end;

var
	mae: maestro;
	det1, det2: detalle;
begin
	assign(mae, 'maestro');
	assign(det1, 'detalle1');
	assign(det2, 'detalle2');

	{writeln('---SE GENERA EL MAESTRO---');
	generarMaestro(mae);
	writeln('---SE GENERA EL DETALLE---');
	generarDetalle(det1);
	writeln('---SE GENERA EL DETALLE---');
	generarDetalle(det2);}
	
	{imprimirMaestro(mae);
	imprimirDetalle(det1);
	imprimirDetalle(det2);}
	
	actualizarMaestro(mae, det1, det2);
	imprimirMaestro(mae);
end.
