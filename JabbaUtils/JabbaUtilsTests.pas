{$mode objfpc}{$H+}{$J-}{$C+}

// Don't forget to enable the assertions!
// You need this: {$C+}

program JabbaUtilsTests;

uses
  JabbaUtils, sysutils;

procedure TestPySlice();
begin
  WriteLn('Running TestPySlice...');
  Assert(PySlice('batman', 0, 3) = 'bat');
  Assert(PySlice('batman', 1, 4) = 'atm');
  Assert(PySlice('batman', 0) = 'batman');
  Assert(PySlice('batman', -3) = 'man');
  Assert(PySlice('batman', 1, -1) = 'atma');
  Assert(PySlice('batman', 0, -1) = 'batma');
  //
  Assert(PySlice('batman', 0, 100) = 'batman');
  Assert(PySlice('batman', -3, 100) = 'man');
  WriteLn('OK');
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


procedure TestToDigitChar();
var
  was_exception: Boolean;
begin
  WriteLn('Running TestToDigitChar...');
  Assert(ToDigit('0') = 0);
  Assert(ToDigit('1') = 1);
  Assert(ToDigit('2') = 2);
  Assert(ToDigit('3') = 3);
  Assert(ToDigit('4') = 4);
  Assert(ToDigit('5') = 5);
  Assert(ToDigit('6') = 6);
  Assert(ToDigit('7') = 7);
  Assert(ToDigit('8') = 8);
  Assert(ToDigit('9') = 9);
  was_exception := False;
  try
    Assert(ToDigit('x') = 9);
  except
    on E: EValueError do
          begin
            was_exception := True;
          end;
  end;
  Assert(was_exception = True);
  WriteLn('OK');
end;

//---------------------------------------------------------------------------

begin
  WriteLn('---');
  TestPySlice();
  TestSum();
  TestProd();
  TestToDigitChar();
end.
