program bai1;
uses crt;

const input = {Duong dan input};
      output = {Duong dan output};

var f : text;
    a : array[1..2] of integer;
    b : array[1..2,1..100] of integer;
    tong : integer; {ket qua}

function kiemtra (n,i : integer) : boolean;
var j : byte;
begin
  for j := 1 to 100 do
    if b[i,j] = n then
      begin
        kiemtra := false;
        break;
      end;
end;

procedure docdulieu;
var i,j : byte;
begin
  assign(f,input);
  reset(f);
  for i := 1 to 2 do readln(f,a[i]);
  for i := 1 to 2 do
    for j := 1 to 100 do b[i,j] := 0;
  close(f);
end;

procedure xuly;
var i,k,l,m,n : byte;
    j : integer;

    c,d : integer; { chia a ra }
    g,h : integer; { chia d ra }
begin
  tong := 0;
  for i := 1 to 2 do
    begin
      j := 1;
      k := 1;
      c := 0;
      d := 0;
      g := 0;
      h := 0;
      while (a[i] div j <> 0) do
        begin
          c := a[i] div j;
          if kiemtra(c,i) then
            begin
              tong := tong + c;
              b[i,k] := c;
              inc(k);
            end;
          d := a[i] mod j;
          if kiemtra(d,i) then
            begin
              tong := tong + d;
              b[i,k] := d;
              inc(k);
            end;
          if d <> 0 then
            begin
              g := d div (j div 10);
              if kiemtra(g,i) then
                begin
                  tong := tong + g;
                  b[i,k] := g;
                  inc(k);
                end;
              h := d mod (j div 10);
              if kiemtra(h,i) then
                begin
                  tong := tong + h;
                  b[i,k] := h;
                  inc(k);
                end;
            end;
          writeln(c:4,d:4,g:4,h:4);
          j := j * 10;
          inc(k);
          writeln('Tong: ',tong);

        end;
      writeln('----------------');
    end;
    writeln('Tong: ', tong);
end;

procedure ghidulieu;
begin
  assign(f,output);
  rewrite(f);
  writeln(f,tong);
  close(f);
end;

begin
  clrscr;
  docdulieu;
  xuly;
  ghidulieu;
  readln
end.
