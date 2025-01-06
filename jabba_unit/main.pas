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
  // With quotes
  PrintCharArray(chars, True);
  // Without quotes
  PrintCharArray(chars);

  // Test with integer array
  numbers := [2, 5, 7];
  PrintIntArray(numbers);

  // Test with string array
  strings := ['cat', 'dog', 'bird'];
  PrintStrArray(strings, True);
  PrintStrArray(strings);
end;

//---------------------------------------------------------------------------

begin
  WriteLn('---');
  Main();
end.
