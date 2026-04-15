program ejercicio9;
const 
	valorAlto = 999;
type
	data = record
		codCliente: integer;
		nombre: string[30];
		apellido: string[30];
		ano: integer;
		mes: integer;
		dia: integer;
		monto: real;
	end;

	maestro = file of data;

procedure generarReporte(var mae: maestro);
	procedure leerArchivo(var mae: maestro; var d: data);
	begin
		if(not eof(mae)) then begin
			read(mae, d);
		end else begin
			d.codCliente:= valorAlto;
		end;
	end;
var
	totalMes, totalAno, total: real;
	actMes, actAno, actCod: integer;
	d: data;
begin
	reset(mae);
	leerArchivo(mae, d);
	total:= 0;
	while(d.codCliente <> valorAlto) do begin
		actCod:= d.codCliente;

		writeln('Los datos del cliente son');
		writeln('Codigo: ', d.codCliente);
		writeln('Nombre: ', d.nombre);
		writeln('Apellido: ', d.apellido);
		while (actCod = d.codCliente) do begin
			actAno:= d.ano;
			totalAno:= 0;
		
			while(actCod = d.codCliente) and (actAno = d.ano) do begin
				actMes:= d.mes;
				totalMes:= 0;
				while(actCod = d.codCliente) and (actAno = d.ano) and (actMes = d.mes) do begin
					totalMes:= totalMes+d.monto;
					leerArchivo(mae, d);
				end;
			
				writeln('El total del mes ', actMes,' es ', totalMes);
				totalAno:= totalAno + totalMes;
			end;
		
			writeln('El total del año ', actAno, ' es ', totalAno);
			total:= total + totalAno;
		end;
	end;
	writeln('El total de la empresa es ', total);
	close(mae);
end;

var
	mae: maestro;
begin
	assign(mae, 'maestro');

	generarReporte(mae);

end.
