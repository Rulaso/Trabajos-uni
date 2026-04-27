program ejercicio3;
const 
	valorAlto=999;
type
	data = record
		cod: integer;
		gen: string[15];
		autor: string[40];
		paginas: integer;
		precio: real;
	end;
	
	archivo = file of data;

procedure leer (var d: data);
begin
	writeln('Ingrese el codigo de libro');
	readln(d.cod);
	
	writeln('Ingrese el genero');
	readln(d.gen);
	
	writeln('Ingrese el nombre del autor');
	readln(d.autor);
	
	writeln('Ingrese la cantidad de paginas que tiene');
	readln(d.paginas);
	
	writeln('Ingrese el precio de venta');
	readln(d.precio);
end;

procedure cargarArchivo(var a: archivo; var d: data);
var
	nuevoLibro, nuevoLugar: data;
	indice: integer;
begin
	leer(nuevoLibro);
	if(d.cod = 0) then begin
		seek(a, filesize(a));

		write(a, nuevoLibro);
	end else begin
		indice:= d.cod * -1;
		seek(a, indice);
		read(a, nuevoLugar);
		seek(a, indice);
		write(a, nuevoLibro);
		seek(a, 0);
		write(a, nuevoLugar);
		d:= nuevoLugar;
	end;
end;

procedure generarArchivo(var a: archivo);
var
	d: data;
	cant, i: integer;
begin
	reWrite(a);
	writeln('Cuantos libros desea ingresar?');
	read(cant);
	
	d.cod:= 0;
	write(a, d);
	for i:= 1 to cant do begin
		cargarArchivo(a, d);
	end;
	close(a);
end;

procedure darDeAlta(var a: archivo);
var
	d: data;
begin
	reset(a);	
	seek(a, 0);
	read(a, d);
	cargarArchivo(a, d);
	
	writeln('El libro se dio de alta correctamente');
	close(a);
end;

procedure leerArchivo(var a: archivo;var d: data);
begin
	if(not eof(a)) then begin
		read(a, d);
	end else begin
		d.cod:= valorAlto;
	end;
end;

procedure modificarLibro(var a: archivo);
var
	d: data;
	codigo: integer;
begin
	reset(a);
	
	writeln('Ingrese el codigo del libro');
	readln(codigo);
	
	leerArchivo(a, d);
	while(d.cod <> valorAlto) and (d.cod <> codigo) do begin
		leerArchivo(a, d);
	end;
	
	if(d.cod <> valorAlto) then begin
		leer(d);
		write(a, d);
		writeln('El libro fue actualizado correctamente');
	end else begin
		writeln('El libro no se encuentra dentro del archivo');
	end;
	close(a);
end;

procedure eliminar(var a: archivo);

var
	d: data;
	indice, codigo, posAct: integer;
begin
	reset(a);
	codigo:= 0;
	while(codigo <= 0) do begin
		writeln('Ingrese el codigo del libro a eliminar');
		readln(codigo);
	end;
	
	seek(a, 0);
	read(a, d);
	indice:= d.cod;
	
	leerArchivo(a, d);
	while(d.cod <> valorAlto) and (d.cod <> codigo) do begin
		leerArchivo(a, d);
	end;
	posAct:= filepos(a) -1;
	if(d.cod <> valorAlto) then begin
		d.cod:= indice;
		seek(a, posAct);
		write(a, d);
		seek(a, 0);
		d.cod:= posAct * -1;
		write(a, d);
		writeln('El libro se elimino correctamente');
	end else begin
		writeln('El libro no se encontro en el archivo');
	end;
	close(a);
end;

procedure exportarTexto(var a: archivo; var aTxt: Text);
var
	d: data;
begin
	reset(a);
	reWrite(aTxt);
		
	leerArchivo(a, d);
	while(d.cod <> valorAlto) do begin
		if(d.cod > 0) then begin
			writeln(aTxt, d.cod, ' ', d.precio,' ',d.paginas, ' ',d.autor);
			writeln(aTxt, d.gen);
		end;
		leerArchivo(a, d);
	end;
end;

var
	a: archivo;
	opcion: integer;
	nombre: string;
	aTxt: Text;
begin
	writeln('Ingrese el nombre del archivo');
	read(nombre);
	assign(a, nombre);
	assign(aTxt, 'libros.txt');

	writeln('Ingrese el numero de alguna de las siguientes opciones');
	writeln('1_ GenerarArchivo');
	writeln('2_ Dar de alta un libro');
	writeln('3_ Modificar un libro');
	writeln('4_ Eliminar un libro');
	writeln('5_ Exportar a texto');
	readln(opcion);
	
	case opcion of
		1: generarArchivo(a);
		2: darDeAlta(a);
		3: modificarLibro(a);
		4: eliminar(a);
		5: exportarTexto(a, aTxt);
	end;
	
end.
