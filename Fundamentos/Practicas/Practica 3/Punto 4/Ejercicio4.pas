program ejercicio4;
const
	valorAlto = 999;
type
	reg_flor = record
		nombre: String[45];
		codigo: integer;
	end;
	
	tArchFlores = file of reg_flor;
	
	lista = ^nodo;
	
	nodo = record
		sig: lista;
		d: reg_flor;
	end;

procedure agregarFlor (var a: tArchFlores; nombre: string; codigo: integer);

var
	punteroLista, nuevaFlor: reg_flor;
	indice: integer;
 begin
	reset(a);
	nuevaFlor.codigo:= codigo;
	nuevaFlor.nombre:= nombre;
	seek(a, 0);
	read(a, punteroLista);
	
	if(punteroLista.codigo = 0) then begin
		seek(a, filesize(a));
		write(a, nuevaFlor);
	end else begin
		indice:= punteroLista.codigo * -1;
		seek(a, indice);
		read(a, punteroLista);
		seek(a, indice);
		write(a, nuevaFlor);
		seek(a, 0);
		write(a, punteroLista);
	end;
	close(a);
end;

procedure leerArchivo(var a: tArchFlores; var d: reg_flor);
begin
	if(not eof(a)) then begin
		read(a, d);
	end else begin
		d.codigo:= valorAlto;
	end;
end;

procedure listarFlores(var a: tArchFlores; var l: lista);
	procedure agregarElemento(var l: lista; var d: reg_flor);
	var
		nue: lista;
	begin
		new(nue);
		nue^.d:= d;
		nue^.sig:= l;
		l:= nue;
	end;
var
	d: reg_flor;
begin
	reset(a);
	leerArchivo(a, d);
	while(d.codigo <> valorAlto) do begin
		if(d.codigo > 0) then begin
			agregarElemento(l, d);
		end;
		leerArchivo(a, d);
	end;
end;

procedure gestionarBaja(var a: tArchFlores);
	procedure eliminarFlor (var a: tArchFlores; flor:reg_flor);
	var
		punteroLista, d, viejaFlor: reg_flor;
		posAct: integer;
	begin
		reset(a);
		leerArchivo(a, punteroLista);
		leerArchivo(a, d);
		while(d.codigo <> valorAlto) and (d.codigo <>flor.codigo) do begin
			leerArchivo(a, d);
		end;
		if(d.codigo <> valorAlto) then begin
			posAct:= filepos(a) -1;
			viejaFlor:= punteroLista;
			viejaFlor.codigo:= posAct * -1;
			seek(a, posAct);
			write(a, punteroLista);
			seek(a, 0);
			write(a, viejaFlor);
		end;
		close(a);
	end;	
var
	d: reg_flor;
begin
	
	writeln('Ingrese el codigo de la flor');
	readln(d.codigo);
	
	eliminarFlor(a, d);
end;

var
	a: tArchFlores;
	l: lista;
	nombre: string;
	cod, opcion: integer;
begin
	assign(a, 'archivo');
	l:= nil;
	
	writeln('Ingrese el nombre de la flor');
	readln(nombre);
	
	writeln('Ingrese el codigo de la flor');
	readln(cod);
	
	writeln('Ingrese el numero de opcion elegido');
	writeln('1_ Agregar flor');
	writeln('2_ Listar flores');
	writeln('3_ Eliminar flor');
	read(opcion);

	case opcion of
		1: agregarFlor(a, nombre, cod);
		2:listarFlores(a, l);
		3:gestionarBaja(a);
	end;
end.
