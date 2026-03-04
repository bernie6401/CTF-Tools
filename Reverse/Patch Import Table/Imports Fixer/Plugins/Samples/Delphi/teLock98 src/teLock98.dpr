library teLock98;

uses Windows;

function Resolve(hProcess:DWORD;ImageBase:DWORD;Size:DWORD;VA:DWORD;Value:DWORD):DWORD;StdCall;
var hFile:DWORD;
    X,IATVA,hf2:DWORD;
    MBI:MEMORY_BASIC_INFORMATION;
    a:Byte;

function Assign(Address:DWORD;Length:DWORD):DWORD;
var NOBR:DWORD;  // NOBR = Number Of Bytes Read
begin
  Result:=DWORD(VirtualAlloc(nil,Length,MEM_COMMIT,PAGE_EXECUTE_READWRITE));
  ReadProcessMemory(hProcess,Ptr(Address),Ptr(Result),Length,NOBR);
end;

begin
  hFile:=Assign(ImageBase,Size);
  // Your code here
  X:=Value;
  VirtualQueryEx(hProcess,Ptr(X),MBI,SizeOf(MBI));
  IATVA:=Cardinal(MBI.AllocationBase);
  hf2:=Assign(IATVA,MBI.RegionSize);
  Dec(X,IATVA);
  a:=0;
  while (PWord(hf2+X+a)^<>$30FF) and (X+a<MBI.RegionSize) do Inc(a);
  if (X+a<MBI.RegionSize) and (PByte(hf2+X+a-1)^=$40) then
  begin
    Dec(a,5);
    Result:=PDWORD(hf2+(PDWORD(hf2+X+a)^-IATVA)+1)^;
  end
  else
    Result:=0;
  VirtualFree(Ptr(hf2),0,MEM_RELEASE);
  // Code end
  VirtualFree(Ptr(hFile),0,MEM_RELEASE);
end;

exports Resolve;

begin
end.
