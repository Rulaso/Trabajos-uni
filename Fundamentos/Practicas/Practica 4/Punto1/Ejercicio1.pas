program ejercicio1;
const
	M = 5;
type
	dataD = record
		cod: longint;
		nombre: string[50];
	end;
	
	nodo = record
		cantClaves: integer;
		claves: array[1..M-1] of longint;
		enlaces: array [1..M-1] of integer;
		hijos: array[1..M] of integer;
	end;
	
	archivo = file of dataD;
	arbol = file of nodo;

var
	arch: archivo;
	indice: arbol;
	i: integer;
begin

	i:= 2;


end.
