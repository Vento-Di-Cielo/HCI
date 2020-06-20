unit unit9;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, Buttons, Grids, unitmodul;

type

  { TFormR }

  TFormR = class(TForm) //Класс формы
    ButtonRez: TButton; //Объекты класса начало
    EditR1: TEdit;
    EditR2: TEdit;
    EditR3: TEdit;
    Image1: TImage;
    LabelRez: TLabel;
    LabelR1: TLabel;
    LabelR2: TLabel;
    LabelR3: TLabel;
    MainMenu1: TMainMenu;
    MenuFile: TMenuItem;
    MenuSave: TMenuItem;
    MenuOpen: TMenuItem;
    MenuSaveOtchet: TMenuItem;
    MenuExit: TMenuItem;
    MenuSpravka: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    SaveOtchet: TSaveDialog;//Объекты класса конец
    Tab: TStringGrid;
    procedure ButtonRezClick(Sender: TObject);//Методы класса начало, а также объявление методов
    procedure FormCreate(Sender: TObject);
    procedure MenuExitClick(Sender: TObject);
    procedure MenuOpenClick(Sender: TObject);
    procedure MenuSaveClick(Sender: TObject);
    procedure MenuSaveOtchetClick(Sender: TObject);
    procedure MenuSpravkaClick(Sender: TObject);
    procedure DataFromForm(); //Методы класса Конец
  private

  public

  end;

var
  FormR: TFormR;
  m:integer;//Счётчик для массива
  CalcArray:calculations;
  a:calculation;
  f:fzap;

implementation

{$R *.lfm}

{ TFormR }

procedure TFormR.DataFromForm();  //Представления методов в разделе implementation. Имя класса указывается.
begin
  if TryStrToFloat(EditR1.text,a.R1) = false then
  begin
     EditR1.Color:=clRed;
     ShowMessage('Неправильно введён параметр m1');
     exit;
  end
  else EditR1.color:=clDefault;
  if TryStrToFloat(EditR2.text,a.R2) = false then
  begin
     EditR2.Color:=clRed;
     ShowMessage('Неправильно введён параметр m2');
     exit;
  end
  else EditR2.color:=clDefault;
  if TryStrToFloat(EditR3.text,a.R3) = false then
  begin
     EditR3.Color:=clRed;
     ShowMessage('Неправильно введён параметр m1');
     exit;
  end
  else EditR3.color:=clDefault;
end;

procedure TFormR.ButtonRezClick(Sender: TObject);
var
  s:real;
begin
  m:=m+1;
  DataFromForm();
  if not((EditR1.color=clred) or (EditR2.color=clred) or (EditR3.color=clred)) then begin
  s:=RezultR(a.r1,a.r2,a.r3);
  a.R:=s;
  calcarray[m]:=a;
  Tab.RowCount:=Tab.rowcount+1;
  tab.cells[0,m]:=FloatToStr(m);
  tab.cells[1,m]:=FloatTostr(calcarray[m].R1);
  tab.cells[2,m]:=FloatToStr(calcarray[m].R2);
  tab.cells[3,m]:=FloatToStr(calcarray[m].R3);
  tab.cells[4,m]:=FloatToStr(calcarray[m].R);
  end;
end;

procedure TFormR.FormCreate(Sender: TObject);
begin
  m:=0;
end;

procedure TFormR.MenuExitClick(Sender: TObject);
begin
  FormR.close;
end;

procedure TFormR.MenuOpenClick(Sender: TObject);
var
   NameFile:string;
begin
  If OpenDialog.Execute then begin
     NameFile:=OpenDialog.FileName;
     assignfile(f,NameFile);
     reset(f);
     Read_Param(a,f);
     EditR1.text:=FloatToStr(a.R1);
     EditR2.text:=FloatToStr(a.R2);
     EditR3.text:=FloatToStr(a.R3);
     closefile(f);
  end;
end;

procedure TFormR.MenuSaveClick(Sender: TObject);
var
   NameFile:string;
begin
  if SaveDialog.Execute then begin
     NameFile := SaveDialog.FileName;
     AssignFile(f,NameFile);
     Rewrite(f);
     If SaveDialog.FileName = '' then showmessage('Название не введено, попробуйте снова');
     Save_Param(a,f);
     closeFile(f);
  end;
end;

procedure TFormR.MenuSaveOtchetClick(Sender: TObject);
var
   NameFile:string;
   ftxt:text;
begin
     if not SaveOtchet.execute then exit;
     NameFile:=SaveOtchet.FileName;
     assignfile(ftxt,namefile);
     append(ftxt);
     Save_Otchet(calcarray,m,ftxt);
     closefile(ftxt);
end;

procedure TFormR.MenuSpravkaClick(Sender: TObject);
begin
  showmessage('Задача 9'+ sLineBreak +'Условие: Три сопротивления R1, R2, R3 соединены параллельно. Найти сопротивление соединения.' + sLineBreak + 'Сделала Михалёва Елизавета ИВТ-19-2');
end;

end.

