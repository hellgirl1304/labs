unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    XPManifest1: TXPManifest;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button18Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a,b,c,d:extended;
  znak:char;

implementation

{$R *.dfm}

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
{ case Key of
'0'..'9': ;
 #8: ;
 ',': ;
 #13: Edit2.SetFocus;
else Key:=Chr(0);
end;}
key:=chr(0);
 end;
procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
'0'..'9': ;
 #8: ;
 #42: ;
 #43: ;
 #44: ;
 #45: ;
 #47: ;
 #13: Edit2.SetFocus;
else Key:=Chr(0);
end;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
 Edit1.Text:=Edit1.Text+'7';
 if edit2.Text<>'' then
 begin
 label1.Caption:='';
 edit1.Text:='';
 edit2.Text:='7';
 end else
 if edit2.Text='0' then edit2.Text:='7' else
 Edit2.Text:=Edit2.Text+'7';
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
Edit1.Text:=Edit1.Text+'8';
 if edit2.Text<>'' then
 begin
 label1.Caption:='';
 edit1.Text:='';
 edit2.Text:='8';
 end else
if edit2.Text='0' then edit2.Text:='8' else
Edit2.Text:=Edit2.Text+'8';
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
Edit1.Text:=Edit1.Text+'9';
 if edit2.Text<>'' then
 begin
 label1.Caption:='';
 edit1.Text:='';
 edit2.Text:='9';
 end else
if edit2.Text='0' then edit2.Text:='9' else
Edit2.Text:=Edit2.Text+'9';
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
Edit1.Text:=Edit1.Text+'4';
 if edit2.Text<>'' then
 begin
 label1.Caption:='';
 edit1.Text:='';
 edit2.Text:='4';
 end else
if edit2.Text='0' then edit2.Text:='4' else
Edit2.Text:=Edit2.Text+'4';
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
Edit1.Text:=Edit1.Text+'5';
 if edit2.Text<>'' then
 begin
 label1.Caption:='';
 edit1.Text:='';
 edit2.Text:='5';
 end else
if edit2.Text='0' then edit2.Text:='5' else
Edit2.Text:=Edit2.Text+'5';
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
Edit1.Text:=Edit1.Text+'6';
 if edit2.Text<>'' then
 begin
 label1.Caption:='';
 edit1.Text:='';
 edit2.Text:='6';
 end else
if edit2.Text='0' then edit2.Text:='6' else
Edit2.Text:=Edit2.Text+'6';
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
Edit1.Text:=Edit1.Text+'1';
 if edit2.Text<>'' then
 begin
 label1.Caption:='';
 edit1.Text:='';
 edit2.Text:='1';
 end else
if edit2.Text='0' then edit2.Text:='1' else
Edit2.Text:=Edit2.Text+'1';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
Edit1.Text:=Edit1.Text+'2';
 if edit2.Text<>'' then
 begin
 label1.Caption:='';
 edit1.Text:='';
 edit2.Text:='2';
 end else
if edit2.Text='0' then edit2.Text:='2' else
Edit2.Text:=Edit2.Text+'2';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
Edit1.Text:=Edit1.Text+'3';
 if edit2.Text<>'' then
 begin
 label1.Caption:='';
 edit1.Text:='';
 edit2.Text:='3';
 end else
if edit2.Text='0' then edit2.Text:='3' else
Edit2.Text:=Edit2.Text+'3';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
Edit1.Text:=Edit1.Text+'0';
 if edit2.Text<>'' then
 begin
 label1.Caption:='';
 edit1.Text:='';
 edit2.Text:='0';
 end else
if edit2.Text='0' then edit2.Text:='0' else
Edit2.Text:=Edit2.Text+'0';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Edit1.Text:=Edit1.Text+',';
 if edit2.Text<>'' then
 begin
 label1.Caption:='';
 edit1.Text:='';
 edit2.Text:=',';
 end else
if edit2.Text='0' then edit2.Text:=',' else
Edit2.Text:=Edit2.Text+',';
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
if (label1.Caption=floattostr(d)) or (label1.Caption=floattostr(c)) then
a:=strtofloat(label1.Caption) else
 a:=strtofloat(edit2.Text);
 edit2.Text:='';
 znak:='/';
  if (label1.Caption=floattostr(d)) or (label1.Caption=floattostr(c)) then
 edit1.Text:=label1.Caption+'/' else
 edit1.text:=edit1.text+'/';

end;

procedure TForm1.Button11Click(Sender: TObject);
begin
if (label1.Caption=floattostr(d)) or (label1.Caption=floattostr(c)) then
a:=strtofloat(label1.Caption) else
 a:=strtofloat(edit2.Text);
 edit2.Text:='';
 znak:='*';
  if (label1.Caption=floattostr(d)) or (label1.Caption=floattostr(c)) then
 edit1.Text:=label1.Caption+'*' else
 edit1.text:=edit1.text+'*';


end;

procedure TForm1.Button7Click(Sender: TObject);
begin
if (label1.Caption=floattostr(d)) or (label1.Caption=floattostr(c)) then
a:=strtofloat(label1.Caption) else
 a:=strtofloat(edit2.Text);
 edit2.Text:='';
 znak:='-';
  if (label1.Caption=floattostr(d)) or (label1.Caption=floattostr(c)) then
 edit1.Text:=label1.Caption+'-' else
 edit1.text:=edit1.text+'-';


end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if (label1.Caption=floattostr(d)) or (label1.Caption=floattostr(c)) then
a:=strtofloat(label1.Caption) else
 a:=strtofloat(edit2.Text);
 edit2.Text:='';
 znak:='+';
  if (label1.Caption=floattostr(d)) or (label1.Caption=floattostr(c)) then
 edit1.Text:=label1.Caption+'+' else
 edit1.text:=edit1.text+'+';


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
{if label1.Caption='' then
begin
a:=strtofloat(edit2.Text);
if edit1.Text<>'' then
b:=strtofloat(edit2.Text);
end else }
if (label1.Caption=floattostr(d)) or (label1.Caption=floattostr(c)) then
a:=strtofloat(label1.Caption) else

 if edit1.Text<>' ' then b:=strtofloat(edit2.Text);
 case znak of
 '/':d:=a/b;
 '*':d:=a*b;
 '-':d:=a-b;
 '+':d:=a+b;
 end;
 label1.Caption:=floattostr(d)
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
c:=strtofloat(edit2.Text);
c:=c*(-1);
edit2.Text:=floattostr(c);
//label1.Caption:=floattostr(c);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
a:=0;
b:=0;
c:=0;
d:=0;
edit1.Text:='';
label1.Caption:='';
edit2.Text:='0';
end;

end.
