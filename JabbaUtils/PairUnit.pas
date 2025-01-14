{$mode objfpc}{$H+}{$J-}
{$MODESWITCH ADVANCEDRECORDS}

unit PairUnit;

//---------------------------------------------------------------------------

interface

uses
  sysutils,
  TypeUtils;

type
  generic Pair<T, U> = record
    a: T;
    b: U;
    constructor Create(const first: T; const second: U);
    function ToString(): String;
    // procedure Print();
  end;

//---------------------------------------------------------------------------

implementation

constructor Pair.Create(const first: T; const second: U);
begin
  self.a := first;
  self.b := second;
end;

// procedure Pair.Print();
// begin
  // WriteLn('Pair(a: ', self.a, ', b: ', self.b, ')');
// end;

function Pair.ToString(): String;
begin
  Result := Format('Pair(a: %s, b: %s)', [
    ToStr(self.a, TypeInfo(self.a)),
    ToStr(self.b, TypeInfo(self.b))
  ]);
end;

//---------------------------------------------------------------------------

end.
