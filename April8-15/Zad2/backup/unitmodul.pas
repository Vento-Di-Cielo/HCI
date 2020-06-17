unit unitModul;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils;

procedure Read_Param(Var a,a1,a2:string;var t:text);
Procedure Save_Param(Var a,a1,a2:string; var t:text);
function RezultR(a,b,c:real):real;
implementation
procedure Read_Param(Var a,a1,a2:string;var t:text);
var
s,s1,s2,s3:string;
begin

readln(t,s);
a:=s;
readln(t,s1);
a1:=s1;
readln(t,s2);
a2:=s2;
readln(t,s3);
a3:=s3;

end;


Procedure Save_Param(Var a,a1,a2:string;var t:text);
var
s,s1,s2,s3:string;
begin
s:=a;
s1:=a1;
s2:=a2;
s3:=a3;
writeln(t,s);
writeln(t,s1);
writeln(t,s2);
writeln(t,s3);

end;

Function RezultR(a,b,c:real):real;
var
   s:real;
begin
s:=((a*b*c)/((a*b)+(b*c)+(a*c)))
RezultR:=s;
end;

end.

