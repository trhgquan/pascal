program hinhchunhat;
uses crt;

const input = '';
      output = '';

var f : text;
    a : array[1..4,1..100] of integer;
    b : array[1..4] of integer; {so luong thanh mau}
    max : array[1..2] of integer; {lon nhat}
    dientich : integer;
    xepduoc : boolean;

procedure docdulieu;
var i,j : byte;
begin
  assign(f,input);
  reset(f);
  for i := 1 to 4 do
    begin
      for j := 1 to 2 do
        read(f,a[i,j]);
      readln(f);
    end;
  close(f);
end;

procedure xuly;
var i,j,t : byte;
    k,l : integer;
begin
  xepduoc := true;
  for i := 1 to 2 do
    begin
      for j := 1 to a[i,1] do
        begin
          k := j * a[i,2];
          for t := 1 to a[i+2,2] do
            begin
              l := t * a[i+2,2];
              if (k = l) and (k > max[i]) then max[i] := k;
            end;
        end;
      if max[i] = 0 then xepduoc := false
      else
        begin
          b[i] := max[i] div a[i,2];
          b[i+2] := max[i] div a[i+2,2];
          dientich := max[1] * max[2];
        end;
    end;
end;

procedure ghidulieu;
var i,j : byte;
begin
  assign(f,output);
  rewrite(f);
  if xepduoc then
    begin
      write(f,dientich);
      writeln(f);
      for i := 1 to 4 do
        begin
          if i <> 1 then j := 4;
          write(f,b[i] , ' ');
        end;
    end
  else writeln(f,0);
  close(f);
end;

begin
  clrscr;
  docdulieu;
  xuly;
  ghidulieu;
  readln
end.
