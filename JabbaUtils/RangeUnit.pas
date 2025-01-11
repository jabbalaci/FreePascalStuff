{$mode objfpc}{$H+}{$J-}
{$modeswitch advancedrecords}

// This unit defines a range type that can be used to iterate over a range of integers.
// Based on a comment at https://forum.lazarus.freepascal.org/index.php?topic=35141.0
//
// Slow! Use it only for small ranges.

unit RangeUnit;

interface

uses
  JabbaTypes, sysutils;

type
  TIntRange = record
    private
      FCurrent: integer;
      FStart, FFinish, FStep: integer;
    public
      function getEnumerator: TIntRange;
      function moveNext: boolean; inline;
      property Current: integer read FCurrent;
  end;

function PyRange(start, finish: integer; step: integer=1): TIntRange;
function PyRangeList(start, finish: integer; step: integer=1): TIntArray;

//---------------------------------------------------------------------------

implementation

function PyRange(start, finish: integer; step: integer=1): TIntRange;
begin
  if step = 0 then
    raise Exception.Create('Step cannot be zero');

  result.FCurrent := start - step;
  result.FStart := start;
  result.FFinish := finish;
  result.FStep := step;
end;

function TIntRange.getEnumerator: TIntRange;
begin
  result := self;
end;

function TIntRange.moveNext: boolean;
begin
  FCurrent += FStep;
  if FStep > 0 then
    result := FCurrent < FFinish
  else
    result := FCurrent > FFinish;
end;


function PyRangeList(start, finish: integer; step: integer=1): TIntArray;
var
  n: Integer;
  idx: Integer = 0;
begin
  Result := [];
  for n in PyRange(start, finish, step) do
    begin
      SetLength(Result, Length(Result) + 1);
      Result[idx] := n;
      idx += 1;
    end;
end;

//---------------------------------------------------------------------------

end.
