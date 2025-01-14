{$mode objfpc}{$H+}{$J-}{$C+}

// Don't forget to enable the assertions!
// You need this: {$C+}

program PairUnitTests;

uses
  PairUnit;

type
  PairIntInt = specialize Pair<Integer, Integer>;
  PairIntString = specialize Pair<Integer, String>;

procedure TestPair();
var
  p1: PairIntInt;
  p2: PairIntString;
begin
  WriteLn('Running TestPair...');
  p1 := PairIntInt.Create(1, 2);
  Assert(p1.a = 1);
  Assert(p1.b = 2);
  Assert(p1.ToString() = 'Pair(a: 1, b: 2)');
  //
  p2 := PairIntString.Create(1, 'One');
  Assert(p2.a = 1);
  Assert(p2.b = 'One');
  Assert(p2.ToString() = 'Pair(a: 1, b: ''One'')');
  WriteLn('OK');
end;

//---------------------------------------------------------------------------

begin
  WriteLn('---');
  TestPair();
end.
