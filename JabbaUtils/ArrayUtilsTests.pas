{$mode objfpc}{$H+}{$J-}{$C+}

// Don't forget to enable the assertions!
// You need this: {$C+}

program ArrayUtilsTests;

uses
  ArrayUtils, JabbaTypes, JabbaUtils, sysutils;

procedure TestReverseOrder();
var
  li: array of Integer;
begin
  WriteLn('Running TestReverseOrder...');
  li := [0, 1, 2];
  ReverseOrder(li);
  Assert(ArraysEqual(li, [2, 1, 0]) = True);
  li := [0, 1];
  ReverseOrder(li);
  Assert(ArraysEqual(li, [1, 0]) = True);
  li := [2];
  ReverseOrder(li);
  Assert(ArraysEqual(li, [2]) = True);
  li := [];
  ReverseOrder(li);
  Assert(ArraysEqual(li, []) = True);
  WriteLn('OK');
end;

procedure TestSimpleSortInteger();
var
  li: array of Integer;
begin
  WriteLn('Running TestSimpleSortInteger...');
  li := [8, 5, 1, 3];
  SimpleSort(li);
  Assert(ArraysEqual(li, [1, 3, 5, 8]) = True);
  SimpleSort(li, True);
  Assert(ArraysEqual(li, [8, 5, 3, 1]) = True);
  li := [8];
  SimpleSort(li);
  Assert(ArraysEqual(li, [8]) = True);
  SimpleSort(li, True);
  Assert(ArraysEqual(li, [8]) = True);
  WriteLn('OK');
  li := [];
  SimpleSort(li);
  Assert(ArraysEqual(li, []) = True);
  SimpleSort(li, True);
  Assert(ArraysEqual(li, []) = True);
end;

procedure TestSimpleSortString();
var
  li: array of String;
begin
  WriteLn('Running TestSimpleSortString...');
  li := ['dd', 'aa', 'cc', 'bb'];
  SimpleSort(li);
  Assert(ArraysEqual(li, ['aa', 'bb', 'cc', 'dd']) = True);
  SimpleSort(li, True);
  Assert(ArraysEqual(li, ['dd', 'cc', 'bb', 'aa']) = True);
  li := ['aa'];
  SimpleSort(li);
  Assert(ArraysEqual(li, ['aa']) = True);
  SimpleSort(li, True);
  Assert(ArraysEqual(li, ['aa']) = True);
  WriteLn('OK');
  li := [];
  SimpleSort(li);
  Assert(ArraysEqual(li, []) = True);
  SimpleSort(li, True);
  Assert(ArraysEqual(li, []) = True);
end;


//---------------------------------------------------------------------------

begin
  WriteLn('---');
  TestReverseOrder();
  TestSimpleSortInteger();
  TestSimpleSortString();
end.
