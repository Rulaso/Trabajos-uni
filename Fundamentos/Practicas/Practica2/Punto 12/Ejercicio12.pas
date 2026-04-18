program ejercicio12;
const 
	valorAlto = 999;
type
	meses = array[1..30] of integer;
	data = record
		ano: integer;
		mes: integer;
		dia: integer;
		id: integer;
		tiempo: real;
	end;
	
	maestro = file of data;
	
procedure gestionarReporte(var mae: maestro);
	procedure leerArchivo(var mae: maestro;var d: data);
	begin
		if(not eof(mae)) then begin
			read(mae, d);
		end else begin
			d.ano:= valorAlto;
		end;
	end;

var
	d: data;
	ano, actDia, actMes, actId: integer;
	totalDia, totalMes, totalAno, totalID: real;
begin
	reset(mae);
	leerArchivo(mae, d);
	
	writeln('Ingrese el año ');
	readln(ano);
	
	while(d.ano <> valorAlto) and (d.ano < ano) do begin
		
		leerArchivo(mae, d);
	end;
	if(d.ano <> ano) then begin
		writeln('el año ingresado no coincide con ninguno dentro del archivo');
	end else begin
		writeln('año ',d.ano);
		totalAno:= 0;
		while(d.ano = ano) do begin
			writeln('mes ', d.mes);
			actMes:= d.mes;
			totalMes:= 0;
		
			while(d.ano = ano) and(d.mes = actMes) do begin
				writeln('dia ', d.dia);
				actDia:= d.dia;
				totalDia:= 0;
			
				while(d.ano = ano) and (d.mes = actMes) and (d.dia = actDia) do begin
					write('ID ', d.id);
					actId := d.id;
					totalId:= 0;
				
					while(d.ano = ano) and (d.mes = actMes) and (d.dia = actDia) and (d.id = actId) do begin
						totalId:= totalId + d.tiempo;
						leerArchivo(mae, d);
					end;
					
					writeln('	Tiempo de uso ', totalId, ' en el dia ',actDia,' en el mes ',actMes);
					totalDia:= totalDia + totalId;
				end;
				writeln('Tiempo total de uso dia ',actDia,' mes ',actMes,' es: ',totalDia);
				totalMes:= totalMes + totalDia;
			end;
			writeln('Tiempo total de uso del mes ',actMes,' es: ',totalMes);
			totalAno:= totalAno + totalMes;
		end;
		writeln('Tiempo total de uso del año ',ano,' es: ',totalAno);
	end;
end;
var
	mae: maestro;
begin
	assign(mae, 'maestro');
	
	gestionarReporte(mae);

end.
