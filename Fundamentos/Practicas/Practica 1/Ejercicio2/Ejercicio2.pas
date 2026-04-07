program Ejercicio2;
type
	archivo = file of integer;

procedure buscarMinimos(num: integer; var Cmin: integer);
begin
	if(num < 150) then begin
		Cmin:= Cmin+1;
	end;
end;

function promedio(total, cant: integer): real;
begin
	promedio:= total/cant;
end;
	
var
	arch: archivo;
	nomFis: string;
	Cmin, total, num: integer;
begin
	total:= 0;
	Cmin:=0;
	writeln('Ingrese el nombre del archivo');
	readln(nomFis);
	
	assign(arch, nomFis);
	
	reset(arch);
	
	while(not eof(arch)) do begin
		read(arch, num);
		
		total:= num + total;
		
		buscarMinimos(num, Cmin);
		
		writeln(num);	
	end;
	
	writeln;
	writeln('La cantidad total de numeros ingresados es ', fileSize(arch));
	writeln('El valor promedio de los numeros ingresados es ',promedio(total, fileSize(arch)):0:2);
	writeln('La cantidad de numeros menores a 150 es ', Cmin);
	
	close(arch);
end.
