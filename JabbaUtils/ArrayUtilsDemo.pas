{$mode objfpc}{$H+}{$J-}

program ArrayUtilsDemo;

uses
  ArrayUtils, JabbaUtils, sysutils;

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
end;

//---------------------------------------------------------------------------

begin
  WriteLn('---');
  Main();
end.
