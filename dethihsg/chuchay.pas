uses crt;

const str = 'XFSL <3 IZTSL';

var i,j,n : byte;
    xau : string;

function decode (str : string; key : integer) : string;
var l: byte;
begin
  for l := 1 to length(str) do
    begin
      if (str[l] <> ' ')  and (str[l] >= 'A') and (str[l] <= 'Z') then
        decode := decode + chr(ord(str[l]) - key)
      else decode := decode + str[l];
    end;
end;

begin
  clrscr;
  randomize;
  n := random(255);
  xau := decode(str,5);
  for i := 1 to n do
    begin
      for j := 1 to i do write(' ');
      writeln(xau);
      delay(100);
      clrscr;
    end;
  writeln('Xong!');
  readln
end.
