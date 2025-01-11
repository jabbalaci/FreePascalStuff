{$mode objfpc}{$H+}{$J-}{$C+}

// Don't forget to enable the assertions!
// You need this: {$C+}

program RangeUnitTests;

uses
  JabbaUtils, RangeUnit, sysutils;

procedure TestPyRange();
var
  li: TIntArray;
begin
  WriteLn('Running TestPyRange...');
  Assert(ArraysEqual(PyRangeList(0, 5), [0, 1, 2, 3, 4]) = True);
  Assert(ArraysEqual(PyRangeList(0, 5, 2), [0, 2, 4]) = True);
  Assert(ArraysEqual(PyRangeList(0, 5, 10), [0]) = True);
  Assert(ArraysEqual(PyRangeList(10, 5, -1), [10, 9, 8, 7, 6]) = True);
  Assert(ArraysEqual(PyRangeList(10, 5, -2), [10, 8, 6]) = True);
  Assert(ArraysEqual(PyRangeList(10, 5, -20), [10]) = True);
  WriteLn('OK');
end;

//---------------------------------------------------------------------------

begin
  WriteLn('---');
  TestPyRange();
end.
