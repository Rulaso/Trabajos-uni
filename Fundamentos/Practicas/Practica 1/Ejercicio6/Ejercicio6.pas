program punto6;
const 
	valorAlto=9999;
type
	data = record
		codigo: integer;
		nombre: string;
		desc: string;
		marca: string;
		precio: real;
		stockMinimo: integer;
		stockActual: integer;
	end;
	
	archivo = file of data;
	
	
procedure leer(var d: data);
begin
	writeln('Ingrese el codigo del celular');
	readln(d.codigo);
		
	writeln('Ingrese el precio del celular');
	readln(d.precio);
		
	writeln('Ingrese la marca del celular');
	readln(d.marca);
		
	writeln('Ingrese el stock actual');
	readln(d.stockActual);
		
	writeln('Ingrese el stock minimo');
	readln(d.stockMinimo);
		
	writeln('Ingrese la descripcion');
	readln(d.desc);
		
	writeln('Ingrese el nombre del modelo');
	readln(d.nombre);
end;
	
procedure crearTexto(var archTxt: Text);	
var
	d: data;
	i: integer;
begin
	reWrite(archTxt);
	
	for i:=1 to 5 do begin
		leer(d);
		
		writeln(archTxt, d.codigo,' ', d.precio,' ', d.marca);
		writeln(archTxt, d.stockActual,' ', d.stockMinimo, ' ', d.desc);
		writeln(archTxt, d.nombre);
	end;
	
	close(archTxt);
end;

procedure crearArchivo(var arch: archivo; var archTxt: Text);
	procedure leerArchivoTexto(var txt: Text; var d: data);
	begin
		if(not eof(txt)) then begin
			readln(archTxt, d.codigo, d.precio, d.marca);
			readln(archTxt, d.stockActual, d.stockMinimo, d.desc);
			readln(archTxt, d.nombre);
		end else begin
			d.codigo:= valorAlto;
		end;
	end;
var
	d: data;
begin
	reWrite(arch);
	reset(archTxt);
	

	
	leerArchivoTexto(archTxt, d);
	
	while(d.codigo <> valorAlto) do begin
		write(arch, d);
		
		
		leerArchivoTexto(archTxt, d);
	end;
	
	close(arch);
	close(archTxt);
end;

procedure leerArchivo(var arch: archivo; var d: data);
begin
	if(not eof(arch)) then begin
		read(arch, d);
	end else begin
		d.codigo:= valorAlto;
	end;
end;

procedure mostrarPocoStock(var arch: archivo);
var
	d: data;
begin
	reset(arch);
	
	leerArchivo(arch, d);
	
	while(d.codigo <> valorAlto) do begin
		if(d.stockActual < d.stockMinimo) then begin
			writeln;
			writeln('El siguiente modelo tiene poco stock');
			writeln(d.codigo,' ',d.precio:0:2,' ',d.marca);
			writeln(d.stockActual,' ',d.stockMinimo,' ',d.desc);
			writeln(d.nombre);
			writeln;
		end;
	
		leerArchivo(arch, d);
	end;
	writeln('---SE PROCESARON TODOS LOS CELULARES---');
	close(arch);
end;

procedure mostrarDescripciones(var arch: archivo);
var
	d: data;
begin
	reset(arch);
	
	leerArchivo(arch, d);
	
	while(d.codigo <> valorAlto) do begin
		writeln;
		writeln('La descripcion del producto es: ');
		writeln(d.desc);
		writeln;
	
		leerArchivo(arch, d);
	end;
	
	writeln('---SE PROCESARON TODOS LOS CELULARES---');
	close(arch)
end;

procedure exportarArchivo(var arch: archivo; var archTxt: Text);
var
	d: data;
begin
	reWrite(archTxt);
	reset(arch);
	
	leerArchivo(arch, d);
	
	while(d.codigo <> valorAlto) do begin
		writeln(archTxt, d.codigo, ' ',d.precio,' ',d.marca);
		writeln(archTxt, d.stockActual,' ',d.stockMinimo,' ',d.desc);
		writeln(archTxt, d.nombre);
	
		leerArchivo(arch, d);
	end;
	
	writeln('---SE EXPORTARON TODOS LOS CELULARES---');
	close(arch);
	close(archTxt);
end;

procedure anadirCelulares(var arch: archivo);
var
	d: data;
begin
	reset(arch);
	seek(arch, fileSize(arch));
	leer(d);
	
	while(d.codigo <> -1) do begin
		write(arch, d);
		
		leer(d);
	end;
	
	close(arch);
end;

procedure modificarStock(var arch: archivo);
var
	d: data;
	aux: string;
	
begin
	reset(arch);
	
	writeln('Ingrese el nombre del celular');
	readln(aux);
	
	leerArchivo(arch, d);
	
	while(d.codigo <> valorAlto) and (d.nombre <> aux) do begin
		leerArchivo(arch, d);
	end;
	
	if(d.codigo <> valorAlto) and (d.nombre = aux) then begin
		writeln('Ingrese el stock actual del celular');
		readln(d.stockActual);
		
		seek(arch, filePos(arch)-1);
		write(arch, d);
		
		writeln;
		writeln('---EL STOCK FUE ACTUALIZADO EXITOSAMENTE---');
		writeln;
	end else begin
		writeln;
		writeln('---EL MODELO INGRESADO NO EXISTE DENTRO DEL ARCHIVO---');
		writeln;
	end;

	close(arch);
end;
	
procedure exportarSinStock(var arch: archivo; var sinStock: Text);
var
	d: data;
begin
	reWrite(sinStock);
	reset(arch);
	
	leerArchivo(arch, d);
	
	while(d.codigo <> valorAlto) do begin
		if(d.stockActual = 0) then begin
			writeln(sinStock, d.codigo,' ', d.precio,' ', d.marca);
			writeln(sinStock, d.stockActual,' ', d.stockMinimo, ' ', d.desc);
			writeln(sinStock, d.nombre);
		end;
		
		leerArchivo(arch, d);
	end;
	
	writeln('---TODOS LOS CELULARES FUERON PROCESADOS---');
	close(sinStock);
	close(arch);
end;

var
	arch: archivo;
	archTxt, sinStock: Text;
	opcion: integer;
begin
	assign(arch, 'RegistroCelulares');
	assign(archTxt, 'celulares');
	assign(sinStock, 'SinStock');
	//crearTexto(archTxt);
	
	writeln('Ingrese el numero de la opcion seleccionada');
	writeln('1_ Crear Archivo');
	writeln('2_ Mostrar celulares con poco stock');
	writeln('3_ Mostrar descripciones de celulares');
	writeln('4_ Exportar a texto');
	writeln('5_ Añadir celulares');
	writeln('6_ Modificar stock');
	writeln('7_ Exportar los sin stock');
	readln(opcion);
	
	case opcion of
		1: crearArchivo(arch, archTxt);
		2: mostrarPocoStock(arch);
		3: mostrarDescripciones(arch);
		4: exportarArchivo(arch, archTxt);
		5: anadirCelulares(arch);
		6: modificarStock(arch);
		7: exportarSinStock(arch, sinStock);
	else
		writeln('La opcion seleccionada esta fuera del rango');
	end;
	
end.
