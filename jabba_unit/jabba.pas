{$mode objfpc}{$H+}{$J-}

unit Jabba;

//---------------------------------------------------------------------------

interface

uses sysutils;


function Input(const prompt: String = ''): String;
function PySlice(const s: string;
                 const startIndex: Integer;
                 const endIndex: Integer = MaxInt): string;
generic procedure PrintArray<T>(const arr: array of T; quote: Boolean = False);
procedure PrintCharArray(const arr: array of Char; quote: Boolean = False);
procedure PrintIntArray(const arr: array of Integer; quote: Boolean = False);
procedure PrintStrArray(const arr: array of String; quote: Boolean = False);
function Sum(const arr: array of Integer): Int64;
function Prod(const arr: array of Integer): Int64;

//---------------------------------------------------------------------------

implementation


function Input(const prompt: String = ''): String;
var
  line: String;
begin
  Write(prompt);
  ReadLn(line);
  result := line;
end;


function PySlice(const s: string;
                 const startIndex: Integer;
                 const endIndex: Integer = MaxInt): string;
var
  actualStart, actualEnd, len: Integer;
begin
  len := Length(s);

  // Handle negative indices for startIndex
  if startIndex < 0 then
    actualStart := len + startIndex
  else
    actualStart := startIndex;

  // Handle negative or default endIndex
  if endIndex = MaxInt then
    actualEnd := len  // Default to the end of the string (exclusive)
  else if endIndex < 0 then
    actualEnd := len + endIndex  // Handle negative endIndex
  else
    actualEnd := endIndex;

  // Ensure bounds are within valid range
  if actualStart < 0 then
    actualStart := 0;
  if actualEnd > len then
    actualEnd := len;

  // If start < end, return the substring; otherwise, return empty string
  if actualStart < actualEnd then
    Result := Copy(s, actualStart + 1, actualEnd - actualStart)
              // Adjust for 1-based indexing
  else
    Result := '';
  // Return empty string for invalid slices
end;


generic procedure PrintArray<T>(const arr: array of T; quote: Boolean = False);
var
  i: Integer;
begin
  Write('[');
  for i := 0 to High(arr) do
    begin
      if quote then
        Write('''', arr[i], '''')
      else
        Write(arr[i]);

      if i < High(arr) then
        Write(', ');
    end;
  WriteLn(']');
end;

procedure PrintCharArray(const arr: array of Char; quote: Boolean = False);
begin
  specialize PrintArray<Char>(arr, quote);
end;

procedure PrintIntArray(const arr: array of Integer; quote: Boolean = False);
begin
  specialize PrintArray<Integer>(arr, quote);
end;

procedure PrintStrArray(const arr: array of String; quote: Boolean = False);
begin
  specialize PrintArray<String>(arr, quote);
end;


function ToDigit(const c: Char): Integer;
begin
  result := ord(c) - ord('0');
end;


function Sum(const arr: array of Integer): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := Low(arr) to High(arr) do
    Result += arr[i];
end;


function Prod(const arr: array of Integer): Int64;
var
  i: Integer;
begin
  Result := 1;
  for i := Low(arr) to High(arr) do
    Result *= arr[i];
end;

//---------------------------------------------------------------------------

end.
