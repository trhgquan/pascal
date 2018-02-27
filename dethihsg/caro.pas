program Caro;
uses crt;

const x = 3;
      y = 5;
      thang = 3;

var {x,y : integer;}
    banco : array[1..100,1..100] of string;
    nguoithang, maythang, hoa : boolean;
    nx, ny, mx, my : integer;

procedure vebanco;
var i,j : integer;
begin
  for i := 1 to x do
    begin
      for j := 1 to y do write(banco[i,j]);
      writeln;
    end;
end;

procedure khoitaobanco;
var i,j : integer;
begin
  for i := 1 to x do
    for j := 1 to y do
      begin
        if j mod 2 = 0 then banco[i,j] := ' | '
        else banco[i,j] := 'z';
      end;

  vebanco;
end;

procedure ai;
begin
  repeat
    randomize;
    mx := random(x) + 1;
    my := random(y) + 1;
  until ((mx > 0) and (my mod 2 <> 0)) and (banco[mx,my] = 'z');
  banco[mx,my] := 'o';
end;

procedure kiemtra;
var i,j,nguoi,may : integer;
    hetco : boolean;
    a : byte;
begin
  i := 1; j := 1;
  while i <= x do
    begin
      if (banco[i,1] = banco[i,3]) and (banco[i,3] = banco[i,5]) then
        begin
          if banco[i,1] = 'x' then nguoithang := true
          else if banco[i,1] = 'o' then maythang := true;
        end;
      inc(i);
    end;
  while j <= y do
    begin
      if (banco[1,j] = banco[2,j]) and (banco[2,j] = banco[3,j]) then
        begin
          if banco[1,j] = 'x' then nguoithang := true
          else if banco[1,j] = 'o' then maythang := true;
        end;
      j := j + 2;
    end;

  hetco := true;
  for i := 1 to x do
    for j := 1 to y do
      if banco[i,j] = 'z' then hetco := false;
  if hetco and not nguoithang and not maythang then hoa := true;
end;

begin
  clrscr;
  khoitaobanco;
  repeat
    begin
      repeat
        writeln('Nhap toa do de danh: ');
        read(nx, ny);
      until (nx <> 0) and (ny mod 2 <> 0) and (banco[nx,ny] = 'z');
      banco[nx,ny] := 'x';
      kiemtra;
      if not nguoithang and not maythang and not hoa then ai;
      kiemtra;
      vebanco;
      writeln('----------------');
      readln
    end;
  until nguoithang or maythang or hoa;
  if nguoithang then writeln('Nguoi thang.')
  else if maythang then writeln('May thang.')
  else writeln('Hoa.');
  readln
end.
