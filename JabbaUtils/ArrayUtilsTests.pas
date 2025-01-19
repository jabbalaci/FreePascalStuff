{$mode objfpc}{$H+}{$J-}{$C+}

// Don't forget to enable the assertions!
// You need this: {$C+}

program ArrayUtilsTests;

uses
  ArrayUtils,
  JabbaTypes;

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


procedure TestSum();
begin
  WriteLn('Running TestSum...');
  Assert(Sum([]) = 0);
  Assert(Sum([1]) = 1);
  Assert(Sum([1, 2]) = 3);
  Assert(Sum([1, 2, 3]) = 6);
  Assert(Sum([2, -2]) = 0);
  WriteLn('OK');
end;

procedure TestProd();
begin
  WriteLn('Running TestProd...');
  Assert(Prod([]) = 1);
  Assert(Prod([1]) = 1);
  Assert(Prod([1, 2]) = 2);
  Assert(Prod([1, 2, 3]) = 6);
  Assert(Prod([2, -2]) = -4);
  WriteLn('OK');
end;


procedure TestPySlice();
begin
  WriteLn('Running TestPySlice...');
  Assert(ArraysEqual(PySlice([0, 1, 2, 3, 4, 5], 0, 3), [0, 1, 2]) = True);
  Assert(ArraysEqual(PySlice([0, 1, 2, 3, 4, 5], 1, 4), [1, 2, 3]) = True);
  Assert(ArraysEqual(PySlice([0, 1, 2, 3, 4, 5], 0), [0, 1, 2, 3, 4, 5]) = True);
  Assert(ArraysEqual(PySlice([0, 1, 2, 3, 4, 5], -3), [3, 4, 5]) = True);
  Assert(ArraysEqual(PySlice([0, 1, 2, 3, 4, 5], 1, -1), [1, 2, 3, 4]) = True);
  Assert(ArraysEqual(PySlice([0, 1, 2, 3, 4, 5], 0, -1), [0, 1, 2, 3, 4]) = True);
  //
  Assert(ArraysEqual(PySlice([0, 1, 2, 3, 4, 5], 0, 100), [0, 1, 2, 3, 4, 5]) = True);
  Assert(ArraysEqual(PySlice([0, 1, 2, 3, 4, 5], -3, 100), [3, 4, 5]) = True);
  WriteLn('OK');
end;


procedure TestArraysEqualInteger();
begin
  WriteLn('Running TestArraysEqualInteger...');
  Assert(specialize ArraysEqual<Integer>([], []) = True);
  Assert(ArraysEqual([1], [1]) = True);
  Assert(ArraysEqual([1], [2]) = False);
  Assert(ArraysEqual([1, 2], [1]) = False);
  Assert(ArraysEqual([1, 2], [2]) = False);
  Assert(ArraysEqual([1, 5, 7], [1, 5, 7]) = True);
  Assert(ArraysEqual([1, 5, 7], [1, 5]) = False);
  Assert(ArraysEqual([1, 5, 7], [1]) = False);
  Assert(ArraysEqual([1, 5, 7], []) = False);
  WriteLn('OK');
end;

procedure TestConcatArraysInteger();
var
  c: array of Integer;
begin
  WriteLn('Running TestConcatArraysInteger...');
  c := ConcatArrays([1, 2], [3, 4]);
  Assert(ArraysEqual(c, [1, 2, 3, 4]) = True);
  c := ConcatArrays([1, 2], []);
  Assert(ArraysEqual(c, [1, 2]) = True);
  c := ConcatArrays([], [1, 2]);
  Assert(ArraysEqual(c, [1, 2]) = True);
  c := ConcatArrays([1], [2]);
  Assert(ArraysEqual(c, [1, 2]) = True);
  WriteLn('OK');
end;

procedure TestConcatArraysString();
var
  c: array of String;
begin
  WriteLn('Running TestConcatArraysString...');
  c := ConcatArrays(['1', '2'], ['3', '4']);
  Assert(ArraysEqual(c, ['1', '2', '3', '4']) = True);
  c := ConcatArrays(['1', '2'], []);
  Assert(ArraysEqual(c, ['1', '2']) = True);
  c := ConcatArrays([], ['1', '2']);
  Assert(ArraysEqual(c, ['1', '2']) = True);
  c := ConcatArrays(['1'], ['2']);
  Assert(ArraysEqual(c, ['1', '2']) = True);
  WriteLn('OK');
end;


procedure TestMin();
var
  li: array of Integer;
  was_exception: Boolean;
  dummy: Integer = -1;
begin
  WriteLn('Running TestMin...');
  li := [3, 2, 1, 7, 8];
  Assert(Min(li) = 1);
  li := [3, 2, 1, -7, 8];
  Assert(Min(li) = -7);
  li := [];
  was_exception := False;
  try
    Assert(Min(li) = dummy);
  except
    on E: EValueError do
      begin
        was_exception := True;
      end;
  end;
  Assert(was_exception = True);
  WriteLn('OK');
end;

procedure TestMax();
var
  li: array of Integer;
  was_exception: Boolean;
  dummy: Integer = -1;
begin
  WriteLn('Running TestMax...');
  li := [3, 2, 1, 7, 8, 4];
  Assert(Max(li) = 8);
  li := [3, -2, 1, 99, 8];
  Assert(Max(li) = 99);
  li := [];
  was_exception := False;
  try
    Assert(Max(li) = dummy);
  except
    on E: EValueError do
      begin
        was_exception := True;
      end;
  end;
  Assert(was_exception = True);
  WriteLn('OK');
end;

procedure TestIsSortedInteger();
var
  li: array of Integer;
begin
  WriteLn('Running TestIsSortedInteger...');
  li := [];
  Assert(IsSorted(li) = True);
  li := [3, 2, 1, 7, 8, 4];
  Assert(IsSorted(li) = False);
  li := [1, 2, 2, 6];
  Assert(IsSorted(li) = True);
  //
  li := [3, 2, 1, -5];
  Assert(IsSorted(li, True) = True);
  li := [];
  Assert(IsSorted(li, True) = True);
  WriteLn('OK');
end;

procedure TestIsSortedString();
var
  li: array of String;
begin
  WriteLn('Running TestIsSortedString...');
  li := [];
  Assert(IsSorted(li) = True);
  li := ['dd', 'cc', 'aa', 'bb'];
  Assert(IsSorted(li) = False);
  li := ['aa', 'cc', 'dd'];
  Assert(IsSorted(li) = True);
  //
  li := ['gg', 'dd', 'cc', 'aa'];
  Assert(IsSorted(li, True) = True);
  li := [];
  Assert(IsSorted(li, True) = True);
  WriteLn('OK');
end;

//---------------------------------------------------------------------------

begin
  WriteLn('---');
  TestReverseOrder();
  TestSimpleSortInteger();
  TestSimpleSortString();
  TestSum();
  TestProd();
  TestPySlice();
  TestArraysEqualInteger();
  TestConcatArraysInteger();
  TestConcatArraysString();
  TestMin();
  TestMax();
  TestIsSortedInteger();
  TestIsSortedString();
end.
