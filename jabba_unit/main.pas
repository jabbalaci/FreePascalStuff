{$mode objfpc}{$H+}{$J-}

program Main;

// some demo, showing how to use the Jabba unit


uses
  Jabba, sysutils;

procedure Main();
var
  line, s: String;
  chars: array of Char;
  numbers: array of Integer;
  strings: array of String;
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
end;

//---------------------------------------------------------------------------

begin
  WriteLn('---');
  Main();
end.
