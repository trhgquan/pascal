program SoSieuNguyenTo;
uses crt;

const input   = 'D:\New folder\Code\pascal\dethihsg\input\sosieunt.inp';
      output  = 'D:\New folder\Code\pascal\dethihsg\output\sosieunt.out';

var f                       : text;
    sodong, tongso          : integer;
    sodau, sosau            : array[1..10000] of integer;


function sont (var so_kiemtra : integer) : boolean;
var sodem, tongnt, sochiahet  : integer;
begin
  sochiahet := 0;
  tongnt    := 0;

  for sodem := 1 to so_kiemtra do
    if (so_kiemtra mod sodem = 0) then inc(sochiahet);

  if sochiahet > 2 then sont := false
  else sont := true;
end;

function max (var i : integer) : integer;
var j   : byte;
    res : string;
    int : integer;
begin
  res := '';

  for j := 1 to i do
    res := res + '9';

  val(res, int);

  max := int;
end;

function min (var i : integer) : integer;
var j   : byte;
    res : string;
    int : integer;

begin
  res := '1';
  j   := 1;

  while j <= i - 1 do
    begin
      res := res + '0';
      inc(j);
    end;

  val(res, int);

  min := int;
end;

procedure doc;
var i : byte;
begin
  assign(f, input);
  reset(f);
  readln(f, sodong);
  close(f);
end;

procedure xuly;
var k     : byte;
    so,i  : integer;
begin
  k := 1;
  for i := min(sodong) to max(sodong) do
    begin
      so := i;
      if sont(so) and (so <> 1) then
        begin
          sosau[k] := so;
          inc(k);
        end;
      end;
  tongso := k;
end;

procedure ghi;
var i : byte;
begin
  assign(f, output);
  rewrite(f);
  for i := 1 to tongso - 1 do
    writeln(f,sosau[i]);
  writeln(f, '----------');
  writeln(f, tongso - 1);
  close(f);
end;

begin
  clrscr;
  doc;
  xuly;
  ghi;
  readln
end.
