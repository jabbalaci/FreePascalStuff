{$mode objfpc}{$H+}{$J-}

program JabbaUtilsDemo;

// some demo, showing how to use the Jabba unit

uses
  ArrayUtils,
  JabbaUtils,
  sysutils;
  // JabbaUtils, sysutils;


procedure Main();
var
  line, s: String;
  chars: array of Char;
  numbers: array of Integer;
  strings: array of String;
  lines: array of String;
  c: Char;
begin
  // line := Input('Your name: ');
  // WriteLn(line);

  // Test with character array
  s := 'Hello';
  chars := s.ToCharArray();
  PrintArray(chars);

  // Test with integer array
  numbers := [2, 5, 7];
  PrintArray(numbers);

  // Test with string array
  strings := ['cat', 'dog', 'bird'];
  PrintArray(strings);
  WriteLn('---');
  WriteLn('''', ReadContent('text.txt'), '''');
  WriteLn('---');
  lines := ReadLines('text.txt');
  for line in lines do
    WriteLn('''' + line + '''');
  WriteLn('---');
  s := '   aa       bb       cc      ';
  PrintArray(PySplit(s));
  WriteLn('---');
  c := 'x';
  WriteLn(Times(c, 10));
  WriteLn(c * 10);
  WriteLn('AB' * 3);
  WriteLn('''' + Center('lac', 10) + '''');
  WriteLn('---');
  PrintArray(ReadLinesAsInts('numbers.txt'));
end;

//---------------------------------------------------------------------------

begin
  WriteLn('---');
  Main();
end.
