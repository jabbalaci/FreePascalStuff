{$mode objfpc}{$H+}{$J-}

unit ArrayUtils;

//---------------------------------------------------------------------------

interface

generic procedure ReverseOrder<T>(var arr: array of T); overload;
procedure ReverseOrder(var arr: array of Integer); overload;
procedure ReverseOrder(var arr: array of String); overload;
//
generic procedure SimpleSort<T>(var arr: array of T; const desc: Boolean = False); overload;
procedure SimpleSort(var arr: array of Integer; const desc: Boolean = False); overload;
procedure SimpleSort(var arr: array of String; const desc: Boolean = False); overload;

//---------------------------------------------------------------------------

implementation

// reverse the order of the elements in-place
generic procedure ReverseOrder<T>(var arr: array of T);
var
  i, j: Integer;
  temp: T;
begin
  i := Low(arr);
  j := High(arr);
  while i < j do
    begin
      temp := arr[i];
      arr[i] := arr[j];
      arr[j] := temp;
      inc(i);
      dec(j);
    end;
end;

procedure ReverseOrder(var arr: array of Integer); overload;
begin
  specialize ReverseOrder<Integer>(arr);
end;

procedure ReverseOrder(var arr: array of String); overload;
begin
  specialize ReverseOrder<String>(arr);
end;

// sort the array in-place
// Slow! Use it for small arrays only.
generic procedure SimpleSort<T>(var arr: array of T; const desc: Boolean = False); overload;
var
  i, j: Integer;
  temp: T;
begin
  for i := 0 to High(arr) do
    for j := i + 1 to High(arr) do
      if arr[j] < arr[i] then
        begin
          temp := arr[i];
          arr[i] := arr[j];
          arr[j] := temp;
        end;
  if desc then
    begin
      i := Low(arr);
      j := High(arr);
      while i < j do
        begin
          temp := arr[i];
          arr[i] := arr[j];
          arr[j] := temp;
          inc(i);
          dec(j);
        end;
    end;
end;

procedure SimpleSort(var arr: array of Integer; const desc: Boolean = False); overload;
begin
  specialize SimpleSort<Integer>(arr, desc);
end;

procedure SimpleSort(var arr: array of String; const desc: Boolean = False); overload;
begin
  specialize SimpleSort<String>(arr, desc);
end;

//---------------------------------------------------------------------------

end.
