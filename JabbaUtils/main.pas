{$mode objfpc}{$H+}{$J-}

program Main;

// some demo, showing how to use the Jabba unit

uses
  JabbaUtils, sysutils;


procedure Main();
var
  line, s: String;
  chars: array of Char;
  numbers: array of Integer;
  strings: array of String;
  content: String;
  lines, parts: array of String;
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
  WriteLn('''', JabbaUtils.Read('text.txt'), '''');
  WriteLn('---');
  lines := JabbaUtils.Readlines('text.txt');
  for line in lines do
    WriteLn('''' + line + '''');
  WriteLn('---');
  s := '   aa       bb       cc      ';
  PrintArray(PySplit(s));
end;

//---------------------------------------------------------------------------

begin
  WriteLn('---');
  Main();
end.
