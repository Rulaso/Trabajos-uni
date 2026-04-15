program ejercicio10;
const 
	valorAlto = 999;
type
	data = record
		codProv: integer;
		codLoc: integer;
		mesa: integer;
		votos: integer;
	end;
	
	maestro = file of data;
	
procedure gestionarReporte(var mae: maestro);
	procedure leerArchivo(var mae: maestro; var d: data);
	begin
		if(not eof(mae)) then begin
			read(mae, d);
		end else begin
			d.codProv:= valorAlto;
		end;
	end;
var
	d: data;
	actProv, actLoc: integer;
	totalLoc, totalProv, totalPais: integer;

begin
	reset(mae);
	leerArchivo(mae, d);
	totalPais:= 0;
	while(d.codProv <> valorAlto) do begin
		actProv:= d.codProv;
		totalProv:= 0;
		
		while(d.codProv = actProv) do begin
			actLoc:= d.codLoc;
			totalLoc:= 0;
			
			while(d.codProv <> valorAlto) and (actProv = d.codProv) and (actLoc = d.codLoc) do begin
				totalLoc:= totalLoc + d.votos;
				leerArchivo(mae, d);
			end;
			
			totalProv:= totalProv + totalLoc;
			writeln('El total de la localidad ', actLoc, ' es ', totalLoc);
		end;
		
		totalPais:= totalPais + totalProv;
		writeln('El total de la provincia ', actProv, ' es ', totalProv);
	end;
	
	writeln('El total de votos es ', totalPais);
	close(mae);
end;
	
var
	mae: maestro;
begin
	assign(mae, 'mestro');
	
	gestionarReporte(mae);

end.
