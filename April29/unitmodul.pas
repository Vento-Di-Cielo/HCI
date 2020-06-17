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

procedure Read_Param(b:calculations;var t:fzap);
Procedure Save_Otchet(b:calculations;m:integer;var t:text);
function RezultR(a,b,c:real):real;
Procedure Save_Param(b:Calculations;m:integer;var t:fzap);

implementation

procedure Read_Param(b:calculations;var t:fzap); //Считать параметры с типизированного файла
var
   i:integer;
   a:calculation;
begin
   seek(t,0);
   i:=1;
   while not EOf(t) do begin
      read(t,a);
      b[i]:=a;
      inc(i);
   end;
end;


Procedure Save_Otchet(b:calculations;m:integer;var t:text);//Сохранить параметры в текстовый файл
var
   s,s1,s2,r:string;
   i:integer;
begin
  for i:=1 to m do begin
     writeln(t,'n= '+ IntToStr(i) + ':');
     s:=FloatToStr(b[i].R1);
     s1:=FloatToStr(b[i].R2);
     s2:=FloatToStr(b[i].R3);
     r:=FloatToStr(b[i].R);
     writeln(t,'Сопротивление R1 ' + s);
     writeln(t,'Сопротивление R2 ' + s1);
     writeln(t,'Сопротивление R3 ' + s2);
     writeln(t,'Общее сопротивление проводника ' + r);
  end;
end;

Function RezultR(a,b,c:real):real;//Рассчитывает общее сопротивление проводника
var
   s:real;
begin
     s:=((a*b*c)/((a*b)+(b*c)+(a*c)));
     RezultR:=s;
end;

Procedure Save_Param(b:Calculations;m:integer;var t:fzap);//Сохранить параметры в типизированный файл
var
   i:integer;
begin
  for i:=1 to m do begin
     write(t,b[i]);
  end;
end;

end.

