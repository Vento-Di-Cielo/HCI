unit unit24;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus, unitModul;

type

  { TFormNazv }

  TFormNazv = class(TForm)//Класс формы
    Button1: TButton; //Поля классо начало
    EditX1: TEdit;
    EditY1: TEdit;
    EditX2: TEdit;
    EditY2: TEdit;
    Image1: TImage;
    LabelPT: TLabel;
    LabelVT: TLabel;
    LabelX1: TLabel;
    LabelY1: TLabel;
    LabelX2: TLabel;
    LabelY2: TLabel;
    LabelRez: TLabel;
    MainMenu1: TMainMenu;
    MemoRez: TMemo;
    MenuItemSpravka: TMenuItem;
    MenuItemSave: TMenuItem;
    MenuItemOpen: TMenuItem;
    MenuItemSaveOtchet: TMenuItem;
    MenuItemExit: TMenuItem;
    MenuItemFile: TMenuItem;
    OpenFile: TOpenDialog;
    SaveFile: TSaveDialog;
    SaveOtchet: TSaveDialog; //Поля класса конец
    procedure Button1Click(Sender: TObject); //Методы класса начало, а также их объявление
    procedure FormResize(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemOpenClick(Sender: TObject);
    procedure MenuItemSaveClick(Sender: TObject);
    procedure MenuItemSaveOtchetClick(Sender: TObject);
    procedure MenuItemSpravkaClick(Sender: TObject);
    procedure DataFromForm(); //Методы класса конец
  private

  public

  end;

var
  FormNazv: TFormNazv;//Объект класса
  x1,y1,x2,y2:real;

implementation

{$R *.lfm}

{ TFormNazv }

procedure TFormNazv.DataFromForm();  //Представления методов в разделе implementation. Имя класса указывается.
begin

  if TryStrToFloat(EditX1.text,x1) = false then
  begin
     EditX1.Color:=clRed;
     ShowMessage('Неправильно введён параметр m1');
     exit;
  end
  else EditX1.color:=clDefault;
  if TryStrToFloat(EditY1.text,y1) = false then
  begin
     EditY1.Color:=clRed;
     ShowMessage('Неправильно введён параметр m2');
     exit;
  end
  else EditY1.color:=clDefault;
  if TryStrToFloat(EditX2.text,x2) = false then
  begin
     EditX2.Color:=clRed;
     ShowMessage('Неправильно введён параметр m1');
     exit;
  end
  else EditX2.color:=clDefault;
  if TryStrToFloat(EditY2.text,y2) = false then
  begin
     EditY2.Color:=clRed;
     ShowMessage('Неправильно введён параметр m2');
     exit;
  end
  else EditY2.color:=clDefault;
end;

procedure TFormNazv.MenuItemOpenClick(Sender: TObject);
var
  NameFile:string;
  f:text;
begin

If OpenFile.Execute then begin
   NameFile:=OpenFile.FileName;
   assignfile(f,NameFile);
   reset(f);
   read_Param(x1,y1,x2,y2,f);
   EditX1.text:=FloatToStr(x1);
   EditY1.text:=FloatToStr(y1);
   EditX2.text:=FloatToStr(x2);
   EditY2.text:=FloatToStr(y2);
   closefile(f);
end;
end;

procedure TFormNazv.MenuItemSaveClick(Sender: TObject);
var NameFile: string;
f:text;
begin
datafromform();
if SaveFile.Execute then begin
NameFile := SaveFile.FileName;
AssignFile(f,NameFile);
Rewrite(f);
If SaveFile.FileName = '' then showmessage('Название не введено, попробуйте снова');
Save_Param(x1,y1,x2,y2,f);
OpenFile.FileName:=NameFile;
closeFile(f);
end;
end;

procedure TFormNazv.MenuItemSaveOtchetClick(Sender: TObject);
begin
   if SaveOtchet.execute then
   begin
     MemoRez.Lines.savetofile(SaveOtchet.FileName);
   end;
end;

procedure TFormNazv.MenuItemSpravkaClick(Sender: TObject);
begin
  showmessage('Задача 24'+ sLineBreak +'Условие: Вычислить расстояние между двумя точками с координатами x1, y1 и x2, y2.' + sLineBreak + 'Сделала Михалёва Елизавета ИВТ-19-2');
end;

procedure TFormNazv.Button1Click(Sender: TObject);
var
  s:real;
begin
  DataFromForm();
  if not((EditX1.color=clred) or (EditY1.color=clred) or (EditX2.color=clred) or (EditY2.color=clred)) then begin
  s:=RezultRast(x1,x2,y1,y2);
  MemoRez.lines.add('Координаты первой точки: (' + FloatTostr(x1)+','+FloatTostr(y1)+') ');
  MemoRez.lines.add('Координаты второй точки: (' + FloatTostr(x2)+','+FloatTostr(y2)+') ');
  MemoRez.lines.add('Расстояние между точками: ' + FloatTostr(s));
  MemoRez.lines.add('-----------------------------');
  end;
end;

procedure TFormNazv.FormResize(Sender: TObject);
begin
  EditX1.width:=FormNazv.width div 4;
  EditX2.width:=FormNazv.width div 4;
  EditY1.width:=FormNazv.width div 4;
  EditY2.width:=FormNazv.width div 4;
  MemoRez.width:=FormNazv.width-65;
  MemoRez.height:=FormNazv.height-200;
end;

procedure TFormNazv.MenuItemExitClick(Sender: TObject);
begin
  formNazv.close;
end;

end.

