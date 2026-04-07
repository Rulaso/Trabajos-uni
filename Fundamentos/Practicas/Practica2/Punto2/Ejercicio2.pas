Program ejercicio2;
const 
	valorAlto=999;
type
	
	data = record
		cod: integer;
		nombre: string[30];
		precio: real;
		stockActual: integer;
		stockMinimo: integer;
	end;
	
	archivo = file of data;
	
	dataD = record
		cod: integer;
		cant: integer;
	end;
	
	archivoD = file of dataD;
	
procedure generarArchivo(var a: archivo);
	procedure leer(var d: data);
	begin
		writeln('Ingrese el codigo de prodcuto');
		readln(d.cod);
		
		writeln('Ingrese el nombre comercial del prodcuto');
		readln(d.nombre);
		
		writeln('Ingrese el precio');
		readln(d.precio);
		
		writeln('Ingrese el stock actual');
		readln(d.stockActual);
		
		writeln('Ingrese el stock minimo');
		readln(d.stockMinimo);
	end;
var
	i: integer;
	d: data;
begin
	reWrite(a);
	
	for i:=1 to 10 do begin
		leer(d);
		
		write(a, d);
	end;
	
	close(a);
end;

procedure generarArchivoDet(var a: archivoD);
	procedure leer(var d: dataD);
	begin
		writeln('Ingrese el codigo de producto');
		readln(d.cod);
		
		writeln('Ingrese la cantidad de ventas');
		readln(d.cant);
	end;
var
	i: integer;
	d: dataD;
begin
	reWrite(a);
	
	for i:=1 to 15 do begin
		leer(d);
		
		write(a, d);
	end;
	close(a);
end;

procedure leerMaestro(var a: archivo; var d: data);
begin
	if(not eof(a)) then begin
		read(a, d);
	end else begin
		d.cod:= valorAlto;
	end;
end;

procedure imprimirArchivo(var a: archivo);

var
	d: data;
begin
	reset(a);
	leerMaestro(a, d);
	
	while(d.cod <> valorAlto) do begin
		writeln('El codigo de prodcuto es ', d.cod);
		writeln('El stock actual es ', d.stockActual);
		writeln('El stock minimo es ', d.stockMinimo);
		writeln;
		leerMaestro(a, d);
	end;
	close(a);
end;

procedure actualizarMaestro(var mae: archivo; var det: archivoD);
	procedure leerDetalle(var a: archivoD; var d: dataD);
	begin
		if(not eof(a))then begin
			read(a, d);
		end else begin
			d.cod:= valorAlto;
		end;
	end;
var
	d: data;
	dd: dataD;
	total, act: integer;
begin
	reset(mae);
	reset(det);
	read(mae, d);
	leerDetalle(det, dd);
	
	while(dd.cod <> valorAlto) do begin
		act:= dd.cod;
		total:= 0;
		
		while(act = dd.cod) do begin
			total:= dd.cant + total;
			leerDetalle(det, dd);
		end;
		
		while(d.cod <> act) do begin
			read(mae, d);
		end;
		
		d.stockActual:= d.stockActual - total;
		seek(mae, filePos(mae)-1);
		write(mae, d);
	end;
	close(det);
	close(mae);
end;

procedure importarATexto(var mae: archivo; var pocoStock: Text);
var
	d: data;
begin
	reset(mae);
	reWrite(pocoStock);
	
	leerMaestro(mae, d);
	
	while(d.cod <> valorAlto) do begin
		if(d.stockActual < d.stockMinimo) then begin
			writeln(pocoStock, d.cod, ' ', d.stockActual, ' ', d.stockMinimo);
		end;
		
		leerMaestro(mae, d);
	end;
	
	close(mae);
	close(pocoStock);
end;

var
	mae: archivo;
	det: archivoD;
	pocoStock: Text;
begin
	assign(mae, 'maestro');
	assign(det, 'detalle');
	assign(pocoStock, 'stock_minimo');
	
	{writeln('---SE GENERA EL ARCHIVO MAESTRO---');
	generarArchivo(mae);
	writeln('---SE GENERA EL ARCHIVO DETALLE---');
	generarArchivoDet(det);}
	
	imprimirArchivo(mae);

	//actualizarMaestro(mae, det);
	
	writeln;
	writeln('---SE MUESTRA EL ARCHIVO ACTUALIZADO---');
	writeln;
	imprimirArchivo(mae);
	
	importarATexto(mae, pocoStock);
end.
