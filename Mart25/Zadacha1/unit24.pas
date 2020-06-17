unit unit24;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus, unitModul;

type

  { TFormNazv }

  TFormNazv = class(TForm)
    Button1: TButton;
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
    SaveOtchet: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemOpenClick(Sender: TObject);
    procedure MenuItemSaveClick(Sender: TObject);
    procedure MenuItemSaveOtchetClick(Sender: TObject);
    procedure MenuItemSpravkaClick(Sender: TObject);
  private

  public

  end;

var
  FormNazv: TFormNazv;
  x1,y1,x2,y2:real;

implementation

{$R *.lfm}

{ TFormNazv }

procedure TFormNazv.MenuItemOpenClick(Sender: TObject);
var
  s,s1,s2,s3,NameFile:string;
f:text;
begin
If OpenFile.Execute then begin
   NameFile:=OpenFile.FileName;
   assignfile(f,NameFile);
   reset(f);
   s:='';
   s1:='';
   s2:='';
   s3:='';
   read_Param(s,s1,s2,s3,f);
   EditX1.text:=s;
   EditY1.text:=s1;
   EditX2.text:=s2;
   EditY2.text:=s3;
   closefile(f);
end;
end;

procedure TFormNazv.MenuItemSaveClick(Sender: TObject);
var NameFile,s,s1,s2,s3: string;
f:text;
begin
if SaveFile.Execute then begin
NameFile := SaveFile.FileName;
AssignFile(f,NameFile);
Rewrite(f);
If SaveFile.FileName = '' then showmessage('Название не введено, попробуйте снова');
s:=EditX1.text;
s1:=EditY1.text;
s2:=EditX2.text;
s3:=EditY2.text;
Save_Param(s,s1,s2,s3,f);
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
  x1:=StrToFloat(EditX1.text);
  y1:=StrToFloat(EditY1.text);
  x2:=StrToFloat(EditX2.text);
  y2:=StrToFloat(EditY2.text);
  s:=RezultRast(x1,x2,y1,y2);
  MemoRez.lines.add('Координаты первой точки: (' + FloatTostr(x1)+','+FloatTostr(y1)+') ');
  MemoRez.lines.add('Координаты второй точки: (' + FloatTostr(x2)+','+FloatTostr(y2)+') ');
  MemoRez.lines.add('Расстояние между точками: ' + FloatTostr(s));
  MemoRez.lines.add('-----------------------------');
end;

procedure TFormNazv.MenuItemExitClick(Sender: TObject);
begin
  formNazv.close;
end;

end.

