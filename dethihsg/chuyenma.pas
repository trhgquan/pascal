program chuyenma;
uses crt;

const input = 'D:\New folder\Code\pascal\dethihsg\input\chuyenma.inp';
const output = 'D:\New folder\Code\pascal\dethihsg\input\chuyenma.out';

var f : text;
    k : integer;
    s,s1 : string;

procedure docdulieu;

begin
  assign(f,input);
  reset(f);
  readln(f,k);
  readln(f,s);
  close(f);
end;

procedure xuly;
var i,j : byte;
begin
  s1 := '';
  for i := 1 to length(s) do
    begin
      j := ord(s[i]) + k;
      if ((j >= 65) and (j <= 90)) or ((j >= 97) and (j <= 122)) then
        s1 := s1 + chr(j)
      else if ((j > 90) and (j < 97))  or (j > 122) then
        begin
          j := j - 26;
          s1 := s1 + chr(j);
        end
      else if s[i] = ' ' then s1 := s1 + ' ';
    end;
end;

procedure ghidulieu;
begin
  assign(f,output);
  rewrite(f);
  writeln(f,s1);
  close(f);
end;

begin
  clrscr;
  docdulieu;
  xuly;
  ghidulieu;
  readln
end.
