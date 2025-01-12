{$mode objfpc}{$H+}{$J-}

program ArrayUtilsDemo;

uses
  ArrayUtils;

procedure Main();
var
  li: array of Integer;
  words: array of String;
begin
  li := [8, 5, 1, 3];
  words := ['cc', 'aa', 'dd', 'bb'];
  WriteLn('Unordered:');
  PrintArray(li);
  PrintArray(words);
  WriteLn('Reversed order:');
  ReverseOrder(li);
  ReverseOrder(words);
  PrintArray(li);
  PrintArray(words);
  WriteLn('Ascending:');
  SimpleSort(li);
  SimpleSort(words);
  PrintArray(li);
  PrintArray(words);
  WriteLn('Descending:');
  SimpleSort(li, True);
  SimpleSort(words, True);
  PrintArray(li);
  PrintArray(words);
  WriteLn('---');
  li := [8, 5, 1, 3];
  PrintArray(PySlice(li, -2));  // [1, 3]
  WriteLn('---');
  PrintArray(ConcatArrays([1, 2], [3, 4]));
  PrintArray(ConcatArrays(['one', 'two'], ['three', 'four']));
end;

//---------------------------------------------------------------------------

begin
  WriteLn('---');
  Main();
end.
