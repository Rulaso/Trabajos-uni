Program ejercicio7;
const
	valorAlto = 999;
type
	data = record
		 codAlumno: integer;
		 apelldio: string[50];
		 nombre: string[50];
		 cursadas: integer;
		 finales: integer;
	end;
	
	dataCurs = record
		codAlumno: integer;
		codMate: integer;
		anoCursado: integer;
		result: boolean;
	end;
	
	dataFinal = record
		codAlumno: integer;
		codMate: integer;
		anoRendido: integer;
		nota: integer;
	end;
	
	maestro = file of data;
	detalleCurs = file of dataCurs;
	detalleFinal = file of dataFinal;

procedure actualizarMaestro(var mae: maestro; var detC: detalleCurs; var detF: detalleFinal);
	procedure leerCursada(var detC: detalleCurs;var regC: dataCurs);
	begin
		if(not eof(detC)) then begin
			read(detC, regC);
		end else begin
			regC.codAlumno:= valorAlto;
		end;
	end;
	
	procedure leerFinal(var detF: detalleFinal;var regF: dataFinal);
	begin
		if(not eof(detF)) then begin
			read(detF, regF);
		end else begin
			regF.codAlumno:= valorAlto;
		end;
	end;
	
	procedure minimo(var regC: dataCurs; var regF: dataFinal; var min: integer);
	begin
		min:= valorAlto;
		
		if(regC.codAlumno < regF.codAlumno) then begin
			min:= regC.codAlumno;
		end else begin
			min:= regF.codAlumno;
		end;
	end;
var
	d: data;
	regC: dataCurs;
	regF: dataFinal;
	min, codAct: integer;
begin
	reset(mae);
	reset(detC);
	reset(detF);
	leerCursada(detC, regC);
	leerFinal(detF, regF);
	minimo(regC, regF, min);
	while(min <> valorAlto) do begin
		read(mae, d);
		codAct:= min;
		
		while(codAct = min) do begin
			while(d.codAlumno <> min) do begin
				read(mae, d);
			end;
			
			while(regC.codAlumno = min) do begin
				if(regC.result) then begin
					d.cursadas:= d.cursadas+1;
				end;	
				leerCursada(detC, regC);
			end;
			while(regF.codAlumno = min) do begin
				if (regF.nota >= 4) then begin
					d.finales:= d.finales+1;
				end;
				leerFinal(detF, regF);
			end;
			minimo(regC, regF, min);
		end;
		seek(mae, filepos(mae)-1);
		write(mae, d);
	end;
	close(detC);
	close(detF);
	close(mae);
end;
		

var
	mae: maestro;
	detCurs: detalleCurs;
	detFinal: detalleFinal;
begin
	assign(mae, 'maestro');
	assign(detCurs, 'cursadas');
	assign(detFinal, 'finales');
	
	actualizarMaestro(mae, detCurs, detFinal);
end.
	
