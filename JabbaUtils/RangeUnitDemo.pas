{$mode objfpc}{$H+}{$J-}

program RangeUnitDemo;

uses
  RangeUnit;


procedure Main();
var
  i: Integer;
begin
  // Count up
  for i in PyRange(0, 5) do
    write(i, ' ');
  WriteLn();

  // Count down
  for i in PyRange(10, 0, -2) do
    write(i, ' ');
  WriteLn();
end;

//---------------------------------------------------------------------------

begin
  WriteLn('---');
  Main();
end.
