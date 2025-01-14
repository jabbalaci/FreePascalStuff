{$mode objfpc}{$H+}{$J-}

program PairUnitDemo;

uses
  PairUnit,
  sysutils;

type
  PairIntInt = specialize Pair<Integer, Integer>;

procedure Main();
var
  p1: specialize Pair<Integer, String>;
  p3: PairIntInt;
begin
  p1 := specialize Pair<Integer, String>.Create(1, 'One');
  p3 := PairIntInt.Create(1, 2);
  WriteLn(p1.ToString());
  WriteLn(p3.ToString());
end;

begin
  WriteLn('---');
  Main();
end.
