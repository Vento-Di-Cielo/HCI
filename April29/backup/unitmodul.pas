unit unitModul;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils;

type
    Calculation = record
                R1,R2,R3,R:real; //R - общее сопротивление
                end;
    Calculations = array[1..128] of calculation;
    fzap = file of calculation;

procedure Read_Param(var b:calculation;var t:fzap);
Procedure Save_Otchet(var b:calculations;m:integer;var t:text);
function RezultR(a,b,c:real):real;
Procedure Save_Param(var b:Calculation;var t:fzap);

implementation

procedure Read_Param(var b:calculation;var t:fzap); //Считать параметры с типизированного файла
var
   a:calculation;
begin
   seek(t,0);
   while not EOf(t) do begin
      read(t,a);
      b:=a;
   end;
end;


Procedure Save_Otchet(var b:calculations;m:integer;var t:text);//Сохранить параметры в текстовый файл
var
   i:integer;
begin
  for i:=1 to m do begin
     writeln(t,'n= '+ IntToStr(i) + ':');
     writeln(t,'Сопротивление R1 ' + b[i].R1);
     writeln(t,'Сопротивление R2 ' + b[i].R2);
     writeln(t,'Сопротивление R3 ' + b[i].R3);
     writeln(t,'Общее сопротивление проводника ' + b[i].R);
  end;
end;

Function RezultR(a,b,c:real):real;//Рассчитывает общее сопротивление проводника
var
   s:real;
begin
     s:=((a*b*c)/((a*b)+(b*c)+(a*c)));
     RezultR:=s;
end;

Procedure Save_Param(var b:Calculation;var t:fzap);//Сохранить параметры в типизированный файл
var
begin
     write(t,b);
end;

end.

