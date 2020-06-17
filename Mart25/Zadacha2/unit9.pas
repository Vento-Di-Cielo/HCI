unit unit9;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, Buttons, unitmodul;

type

  { TFormR }

  TFormR = class(TForm)
    ButtonRez: TButton;
    EditR1: TEdit;
    EditR2: TEdit;
    EditR3: TEdit;
    Image1: TImage;
    LabelRez: TLabel;
    LabelR1: TLabel;
    LabelR2: TLabel;
    LabelR3: TLabel;
    MainMenu1: TMainMenu;
    MemoRezult: TMemo;
    MenuFile: TMenuItem;
    MenuSave: TMenuItem;
    MenuOpen: TMenuItem;
    MenuSaveOtchet: TMenuItem;
    MenuExit: TMenuItem;
    MenuSpravka: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    SaveOtchet: TSaveDialog;
    procedure ButtonRezClick(Sender: TObject);
    procedure MenuExitClick(Sender: TObject);
    procedure MenuOpenClick(Sender: TObject);
    procedure MenuSaveClick(Sender: TObject);
    procedure MenuSaveOtchetClick(Sender: TObject);
    procedure MenuSpravkaClick(Sender: TObject);
  private

  public

  end;

var
  FormR: TFormR;
  r1,r2,r3:real;

implementation

{$R *.lfm}

{ TFormR }

procedure TFormR.ButtonRezClick(Sender: TObject);
var
  s:real;
begin
  r1:=StrToFloat(EditR1.text);
  r2:=StrToFloat(EditR2.text);
  r3:=StrToFloat(EditR3.text);
  s:=RezultR(r1,r2,r3);
  MemoRezult.lines.add('Сопротивление R1: '+ floattostr(r1) );
  MemoRezult.lines.add('Сопротивление R2: '+ floattostr(r2) );
  MemoRezult.lines.add('Сопротивление R3: '+ floattostr(r3) );
  MemoRezult.lines.add('Сопротивление соединения: ' + FloatTostr(s));
  MemoRezult.lines.add('-----------------------------');
end;

procedure TFormR.MenuExitClick(Sender: TObject);
begin
  FormR.close;
end;

procedure TFormR.MenuOpenClick(Sender: TObject);
var
   s,s1,s2,NameFile:string;
   f:text;
begin
  If OpenDialog.Execute then begin
     NameFile:=OpenDialog.FileName;
     assignfile(f,NameFile);
     reset(f);
     s:='';
     s1:='';
     s2:='';
     read_Param(s,s1,s2,f);
     EditR1.text:=s;
     EditR2.text:=s1;
     EditR3.text:=s2;
     closefile(f);
  end;
end;

procedure TFormR.MenuSaveClick(Sender: TObject);
var
   NameFile,s,s1,s2: string;
   f:text;
begin
  if SaveDialog.Execute then begin
     NameFile := SaveDialog.FileName;
     AssignFile(f,NameFile);
     Rewrite(f);
     If SaveDialog.FileName = '' then showmessage('Название не введено, попробуйте снова');
     s:=EditR1.text;
     s1:=EditR2.text;
     s2:=EditR3.text;
     Save_Param(s,s1,s2,f);
     closeFile(f);
  end;
end;

procedure TFormR.MenuSaveOtchetClick(Sender: TObject);
  begin
   if SaveOtchet.execute then
   begin
     MemoRezult.Lines.savetofile(SaveOtchet.FileName);
   end;
end;

procedure TFormR.MenuSpravkaClick(Sender: TObject);
begin
  showmessage('Задача 9'+ sLineBreak +'Условие: Три сопротивления R1, R2, R3 соединены параллельно. Найти сопротивление соединения.' + sLineBreak + 'Сделала Михалёва Елизавета ИВТ-19-2');
end;

end.

