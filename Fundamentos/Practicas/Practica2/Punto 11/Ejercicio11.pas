program ejercicio11;
const
	valorAlto = '999';
type
	data = record
		depto: string[30];
		division: string[30];
		num: integer;
		cat: integer;
		horasExtra: real;
	end;
	
	valores = array[1..15] of real;
	
	maestro = file of data;
	
procedure cargarVector(var val: valores; var arch: Text);
var
	i, cat: integer;
	precio: real;
begin
	reset(arch);
	
	for i:=1 to 15 do begin
		readln(arch, cat, precio);
		
		val[cat]:= precio;
	end;

	close(arch);
end;

procedure gestionarReporte(var mae: maestro; var v: valores);
	procedure leerArchivo(var mae: maestro; var d: data);
	begin
		if(not eof(mae)) then begin
			read(mae, d);
		end else begin
			d.depto:= valorAlto;
		end;
	end;
	
	function calcularCobro(v: valores; total: real; i: integer): real;
	begin
		calcularCobro := v[i] * total;
	end;

var
	actDepto, actDiv: string;
	actNum, actCat: integer;
	horasDiv, horasDepto, horasEmp: real;
	totalDiv, totalDepto, totalEmp: real;
	d: data;
begin
	reset(mae);
	leerArchivo(mae, d);

	while(d.depto <> valorAlto) do begin
		horasDepto:= 0;
		totalDepto:= 0;
		actDepto:= d.depto;
		writeln('Departamento ', d.depto);
		while(d.depto <> valorAlto) and(d.depto = actDepto) do begin
			horasDiv:= 0;
			totalDiv:= 0;
			actDiv:= d.division;
			writeln('Division ', d.division);
			while(d.depto <> valorAlto) and(d.depto = actDepto) and (actDiv = d.division) do begin
				horasEmp:= 0;
				totalEmp:= 0;
				actNum:= d.num;
				actCat:= d.cat;
				
				write('Numero de empleado ', d.num);
				while(d.depto <> valorAlto) and(d.depto = actDepto) and (actDiv = d.division) and (d.num = actNum) do begin
					horasEmp:= horasEmp + d.horasExtra;
					leerArchivo(mae, d);
				end;
				totalEmp:= calcularCobro(v, horasEmp, actCat);
				write('	Total de horas extra ', horasEmp);
				writeln('	Importe a cobrar ', totalEmp);
				totalDiv:= totalDiv + totalEmp;
				horasDiv:= horasEmp + horasDiv;
			end;
			
			writeln('Total de horas division ', horasDiv);
			writeln('Monto total por division ', totalDiv);
			horasDepto:= horasDepto + horasDiv;
			totalDepto:= totalDepto + totalDiv;
		end;
		
		
		writeln('Total de horas por departamento ', horasDepto);
		writeln('Monto total por departamento ', totalDepto);
		
	end;
end;
var
	archivo: Text;
	val: valores;
	mae: maestro;
begin
	assign(archivo, 'valorHoras');
	assign(mae, 'maestro');
	
	cargarVector(val, archivo);
	
	gestionarReporte(mae, val);

end.
