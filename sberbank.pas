{$H-}  // Char будет 1-байтовым AnsiChar


unit sberbank;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, CheckLst, Mask, RxToolEdit, ExtCtrls, RxAnimate,
  RxGIFCtrl, RxStrUtils;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    RichEdit1: TRichEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    DirectoryEdit1: TDirectoryEdit;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DirectoryEdit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   SaveDir:string;
  iFileHandle: Integer;
  FileHandle: Integer;
    FileHandle1: Integer;
  iFileLength: Integer;
  Buffer: PAnsiChar;
  s1:ansichar;s2:ansichar;s3:ansichar;
  s4:ansichar;s5:ansichar;s6:ansichar;
  i:Integer;
  count:integer;
  NFil:integer;
    Col:integer;


implementation

{$R *.DFM}

procedure TForm1.BitBtn1Click(Sender: TObject);

begin

RichEdit1.Lines.Clear;
Label3.visible:=False;RichEdit1.visible:=False;

if opendialog1.execute   then
try
      iFileHandle := FileOpen(OpenDialog1.FileName, fmOpenRead);
      iFileLength := FileSeek(iFileHandle,0,2);
      FileSeek(iFileHandle,0,0);
      Buffer := PAnsiChar(AllocMem(iFileLength + 1));
      for i:=0 to iFileLength do begin
      FileRead(iFileHandle, buffer[i], 1); end;
      FileClose(iFileHandle);
       BitBtn2.Enabled:=true;
      except
showmessage('Файл не открыт!');
 end;

end;
procedure TForm1.DirectoryEdit1Change(Sender: TObject);
var s:string;
begin
       SaveDir:=DirectoryEdit1.Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
       SaveDir:=DirectoryEdit1.Text;
end;



procedure TForm1.BitBtn2Click(Sender: TObject);
const gu='ГУ ЦЗН г.Новочеркасска|0040|';
var bufferc,buffers:array[1..115] of ansichar;
    zi,j,sdvig,z,lll:integer;
    dt,zzz,sss:string;
    dat:tdatetime;
    pov,ukaz:integer;
    sum,itog,prom:real;
    summa:string[7];
    vsego:string[50];
    gus:string[36];
    begin
      gus:=StrToOem(gu);
      s1:=buffer[0];s2:=buffer[1];s3:=buffer[2];
      s4:=buffer[0];s5:=buffer[1];s6:=buffer[2];
      dt:=datetostr(date);
      if dt[1]='0' then begin
      FileHandle := FileCreate(savedir+'\5'+'4'+'1'+'0'+'0401.s0'+dt[2]);
      FileHandle1 := FileCreate(savedir+'\5'+'4'+'1'+'0'+'0401.k0'+dt[2]);
      end else begin
      FileHandle := FileCreate(savedir+'\5'+'4'+'1'+'0'+'0401.s0'+dt[2]);
      FileHandle1 := FileCreate(savedir+'\5'+'4'+'1'+'0'+'0401.k0'+dt[2]);
      end;
      ukaz:=0; i:=0; count:=0;Nfil:=0;Col:=0;sdvig:=0;pov:=0;
      sum:=0;itog:=0;prom:=0;

 while pov*116<iFileLength do                                      begin

      for j:=1 to 114 do bufferc[j]:=buffer[(pov*116)+j-1];
      s1:=bufferc[1];s2:=bufferc[2];s3:=bufferc[3];
      Col:=col+1;ukaz:=1;

      buffers[1]:='5';buffers[2]:='4';
      buffers[3]:='1';buffers[4]:='0';
      buffers[5]:='|';
      //buffers[6]:='0';
      buffers[6]:=bufferc[ukaz+5];
      buffers[7]:=bufferc[ukaz+6];
      buffers[8]:=bufferc[ukaz+7];
      buffers[9]:=bufferc[ukaz+8];
      buffers[10]:='|';


      ukaz:=12; z:=11;
      while bufferc[ukaz]<>' ' do                       begin
      buffers[z]:=bufferc[ukaz]; ukaz:=ukaz+1; z:=z+1;
                                                        end;
      buffers[z]:='|';

      ukaz:=27;      z:=z+1;
      while bufferc[ukaz]<>' ' do                       begin
      buffers[z]:=bufferc[ukaz];
      ukaz:=ukaz+1;
      z:=z+1;
                                                        end;
      buffers[z]:='|';

      ukaz:=42; z:=z+1;
      while bufferc[ukaz]<>' ' do                       begin
      buffers[z]:=bufferc[ukaz];
      ukaz:=ukaz+1;  z:=z+1;
                                                        end;
      buffers[z]:='|';

      ukaz:=81; z:=z+1;
      while bufferc[ukaz]<>' ' do                       begin
      buffers[z]:=bufferc[ukaz];
      ukaz:=ukaz+1;z:=z+1;
                                                        end;
      buffers[z]:='|';buffers[z+1]:='3';buffers[z+2]:='9';
      buffers[z+3]:='|';buffers[z+4]:='1';buffers[z+5]:='|';
      z:=z+6;

      while bufferc[ukaz]=' ' do ukaz:=ukaz+1;

      if ukaz=108 then                                  begin
      buffers[z]:=bufferc[ukaz];      summa[1]:=bufferc[ukaz];
      buffers[z+1]:=bufferc[ukaz+1];  summa[2]:=bufferc[ukaz+1];
      buffers[z+2]:=bufferc[ukaz+2];  summa[3]:=bufferc[ukaz+2];
      buffers[z+3]:=bufferc[ukaz+3];  summa[4]:=bufferc[ukaz+3];
      buffers[z+4]:=bufferc[ukaz+4];  summa[5]:=',';
      buffers[z+5]:=bufferc[ukaz+5];  summa[6]:=bufferc[ukaz+5];
      buffers[z+6]:=bufferc[ukaz+6];  summa[7]:=bufferc[ukaz+6];
      buffers[z+7]:='|';
      buffers[z+8]:='8';buffers[z+9]:='1';buffers[z+10]:='0';
      buffers[z+11]:='|';buffers[z+12]:=#13;buffers[z+13]:=#10;
         lll:=Z+13;ukaz:=ukaz+8;
      prom:=StrToFloat(summa[1]+summa[2]+summa[3]+summa[4]+summa[5]+summa[6]+summa[7]);
      summa[1]:='0';summa[2]:='0';summa[3]:='0';summa[4]:='0';
      summa[5]:='0';summa[6]:='0';summa[7]:='0';
      sum:=sum+prom;
                                                        end;
      if ukaz=109 then                                  begin
      buffers[z]:=bufferc[ukaz];       summa[1]:=bufferc[ukaz];
      buffers[z+1]:=bufferc[ukaz+1];   summa[2]:=bufferc[ukaz+1];
      buffers[z+2]:=bufferc[ukaz+2];   summa[3]:=bufferc[ukaz+2];
      buffers[z+3]:=bufferc[ukaz+3];   summa[4]:=',';
      buffers[z+4]:=bufferc[ukaz+4];   summa[5]:=bufferc[ukaz+4];
      buffers[z+5]:=bufferc[ukaz+5];   summa[6]:=bufferc[ukaz+5];
      buffers[z+6]:='|';
      buffers[z+7]:='8';buffers[z+8]:='1';buffers[z+9]:='0';
      buffers[z+10]:='|';buffers[z+11]:=#13;buffers[z+12]:=#10;
      prom:=StrToFloat(summa[1]+summa[2]+summa[3]+summa[4]+summa[5]+summa[6]);
      summa[1]:='0';summa[2]:='0';summa[3]:='0';summa[4]:='0';
      summa[5]:='0';summa[6]:='0';summa[7]:='0';
      sum:=sum+prom;

                    lll:=Z+12; ukaz:=ukaz+7;
                                                        end;
            if ukaz=110 then                            begin
      buffers[z]:=bufferc[ukaz];       summa[1]:=bufferc[ukaz];
      buffers[z+1]:=bufferc[ukaz+1];   summa[2]:=bufferc[ukaz+1];
      buffers[z+2]:=bufferc[ukaz+2];   summa[3]:=',';
      buffers[z+3]:=bufferc[ukaz+3];   summa[4]:=bufferc[ukaz+3];
      buffers[z+4]:=bufferc[ukaz+4];   summa[5]:=bufferc[ukaz+4];
      buffers[z+5]:='|';
      buffers[z+6]:='8';buffers[z+7]:='1';buffers[z+8]:='0';
      buffers[z+9]:='|';buffers[z+10]:=#13;buffers[z+11]:=#10;
                  lll:=Z+11;   ukaz:=ukaz+6;
      prom:=StrToFloat(summa[1]+summa[2]+summa[3]+summa[4]+summa[5]);
      summa[1]:='0';summa[2]:='0';summa[3]:='0';summa[4]:='0';
      summa[5]:='0';summa[6]:='0';summa[7]:='0';
      sum:=sum+prom;
                                                        end;
      if ukaz=111 then                                  begin
      buffers[z]:=bufferc[ukaz];       summa[1]:=bufferc[ukaz];
      buffers[z+1]:=bufferc[ukaz+1];   summa[2]:=',';
      buffers[z+2]:=bufferc[ukaz+2];   summa[3]:=bufferc[ukaz+2];
      buffers[z+3]:=bufferc[ukaz+3];   summa[4]:=bufferc[ukaz+3];
      buffers[z+4]:='|';
      buffers[z+5]:='8';buffers[z+6]:='1';buffers[z+7]:='0';
      buffers[z+8]:='|';buffers[z+9]:=#13;buffers[z+10]:=#10;
      lll:=Z+10; ukaz:=ukaz+5;
      prom:=StrToFloat(summa[1]+summa[2]+summa[3]+summa[4]);
      summa[1]:='0';summa[2]:='0';summa[3]:='0';summa[4]:='0';
      summa[5]:='0';summa[6]:='0';summa[7]:='0';
      sum:=sum+prom;                                    end;

    for i:=1 to lll do                                  begin
    FileWrite(FileHandle,Buffers[i],1);                 end;
      count:=count+1; pov:=pov+1;
end;
 for i:=1 to 50 do vsego[I]:=' ';
   zzz:=FloatToStrF(sum,ffFixed , 9,2);
        zi:=1;
        while zzz[zi]<>',' do zi:=zi+1; zzz[zi]:='.';
        nfil:=nfil+1;
        vsego:=gus+IntToStr(count)+'|'+zzz+'|';
    for i:=1 to 50 do begin FileWrite(FileHandle1,vsego[I],1); end;
        for i:=1 to 50 do vsego[I]:=' ';

nfil:=nfil+1;   itog:=itog+sum;
zzz:=FloatToStrF(sum,ffFixed , 9,2);
        zi:=1; while zzz[zi]<>',' do zi:=zi+1; zzz[zi]:='.';
        RichEdit1.Lines.Add(S4+S5+S6+'   ---   '+IntToStr(count)+'   ---   '+zzz+' р.');

                FileClose(FileHandle);
                FileClose(FileHandle1);
                FreeMem(Buffer);
Label3.visible:=true;RichEdit1.visible:=true;
       BitBtn2.Enabled:=False;
end;
end.


