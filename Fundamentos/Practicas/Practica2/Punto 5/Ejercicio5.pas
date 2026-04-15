program Ejercicio5;
const 
	valorAlto = 999;
type
	data = record
		cod: integer;
		fecha: integer;
		tiempo: integer;
	end;
	
	archivo = file of data;
	
	vector = array[1..5] of data;
	
procedure generarDetalle(var a: archivo);
	procedure leer(var d: data);
	begin
		writeln('Ingrese el codigo de empleado');
		readln(d.cod);
		
		writeln('Ingrese la fecha de inicio');
		readln(d.fecha);
		
		writeln('Ingrese el tiempo que duro la sesion');
		readln(d.tiempo);
	end;
var
	d: data;
	i: integer;
begin
	reWrite(a);
	for i:= 1 to 5 do begin
		leer(d);
		
		write(a, d);
	end;
	close(a);
end;
	
procedure imprimirRegistro(d: data);
begin
	writeln('Codigo ', d.cod);
	writeln('Fecha ', d.fecha);
	writeln('Tiempo ', d.tiempo);
end;
	
procedure leerArchivo(var a: archivo; var d: data);
begin
	if(not eof(a)) then begin
		read(a, d);
	end else begin
		d.cod:= valorAlto;
	end;
end;


procedure actualizarMaestro(var mae, det1, det2, det3, det4, det5: archivo);

	procedure minimo(var det1, det2, det3, det4, det5: archivo; var d1, d2, d3, d4, d5, min: data; var v: vector);
		procedure cargarVector(var v: vector;d1, d2, d3, d4, d5: data);
		begin
			v[1]:= d1;
			v[2]:= d2;
			v[3]:= d3;
			v[4]:= d4;
			v[5]:= d5;
		end;
	var
		i, aux: integer;
	begin
		cargarVector(v, d1, d2, d3, d4, d5);
		min.cod:= valorAlto;
	
		for i:=1 to 5 do begin
			if (v[i].cod <> valorAlto) and (v[i].cod <= min.cod) then begin
				imprimirRegistro(v[i]);
				min:= v[i];
				aux:= i;
			end;
		end;

		
		case aux of
			1: leerArchivo(det1, d1);
			2: leerArchivo(det2, d2);
			3: leerArchivo(det3, d3);
			4: leerArchivo(det4, d4);
			5: leerArchivo(det5, d5);
		end;

	end;
	

var
	d, regd1, regd2, regd3, regd4, regd5, min: data;
	v: vector;
	act, codAct: integer;
begin
	reWrite(mae);
	reset(det1);
	reset(det2);
	reset(det3);
	reset(det4);
	reset(det5);
	leerArchivo(det1, regd1);
	leerArchivo(det2, regd2);
	leerArchivo(det3, regd3);
	leerArchivo(det4, regd4);
	leerArchivo(det5, regd5);

	minimo(det1, det2, det3, det4, det4, regd1, regd2, regd3, regd4, regd5, min, v);
	while(min.cod <> valorAlto) do begin
		act:= min.fecha;
		d:= min;

		while(act = min.fecha) do begin
			codAct:= min.cod;

			while(min.cod <> valorAlto) and (act = min.fecha) and (codAct= min.cod) do begin
				d.tiempo:= d.tiempo + min.tiempo;
				minimo(det1, det2, det3, det4, det5, regd1, regd2, regd3, regd4, regd5, min, v);
				
			end;
			
		end;
		
	
		write(mae, d);
		
	end;
	writeln('sali de un while');
	close(det1);
	close(det2);
	close(det3);
	close(det4);
	close(det5);
	close(mae);
end;

procedure imprimirArchivo(var mae: archivo);
var
	d: data;
begin
	reset(mae);
	leerArchivo(mae, d);
	while(d.cod <> valorAlto) do begin
		imprimirRegistro(d);
		leerArchivo(mae, d);
	end;
	close(mae);
end;
				
var
	mae: archivo;
	det1, det2, det3, det4, det5: archivo;
begin
	assign(mae, 'maestro');
	assign(det1, 'detalle1');
	assign(det2, 'detalle2');
	assign(det3, 'detalle3');
	assign(det4, 'detalle4');
	assign(det5, 'detalle5');

	{writeln('---SE GENERA EL 1ER DETALLE---');
	generarDetalle(det1);
	writeln('---SE GENERA EL 2DO DETALLE---');
	generarDetalle(det2);
	writeln('---SE GENERA EL 3ER DETALLE---');
	generarDetalle(det3);
	writeln('---SE GENERA EL 4TO DETALLE---');
	generarDetalle(det4);
	writeln('---SE GENERA EL 5TO DETALLE---');
	generarDetalle(det5);}
	
	actualizarMaestro(mae, det1, det2, det3, det4, det5);
	writeln('Imprimo los datos guardados en el mae');
	imprimirArchivo(mae);
end.
