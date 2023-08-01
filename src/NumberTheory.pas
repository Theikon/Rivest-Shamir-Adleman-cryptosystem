{$R+}
{$B+}
{$Q+}
{Copyright Niklas Simandi 2022. Alle Rechte vorbehalten.
 Eine Sammlung einiger Funktionen aus der elementaren Zahlentheorie}
unit NumberTheory;

interface

function PRIME(N: qword): boolean;
{prüft, ob N prim ist}

function GCD(A: qword; B: qword): qword;
{größter gemeinsamer Teiler von A und B}

function GCD(A: qword; B: qword; var S: int64; var T: int64): qword;
{erweiterter größter gemeinsamer Teiler von A und B}

function EXP(B: qword; E: qword; M: qword): qword;
{berechnet B^E kongruent modulo M}

function PHI(N: qword): qword;
{Eulersche Phi-Funktion}

implementation

function PRIME(N: qword) : boolean;
var
I : qword;
    
begin
    if N mod 2 = 0 then
        PRIME := N = 2
    else
    begin
        PRIME := TRUE;
        I := 3;
        while I <= TRUNC(SQRT(N)) do
        {for I := 3 to TRUNC(SQRT(N)) do}
        begin
            if N mod I = 0 then
            {ist I ein Teiler von N?}
            begin
                PRIME := FALSE;
                break
            end;
            I := I + 1
        end
    end
end;

function GCD(A: qword; B: qword): qword;
var
T : qword;

begin
    if A = 0 then
        GCD := 0
    else if B = 0 then
        GCD := A
    else
    begin
        while A mod B <> 0 do
        begin
            T := A mod B;
            A := B;
            B := T
            {ggT(A,B) = ggT(B,A mod B)}
        end;
        GCD := T
    end
end;

function GCD(A: qword; B: qword; var S: int64; var T: int64) : qword;
var
M, N : int64;

begin
    if B = 0 then
    begin
        S := 1;
        T := 0;
        GCD := A
    end
    else
    begin
        GCD := GCD(B, A mod B, M, N);
        S := N;
        T := M - A div B * N
    end
end;

function EXP(B: qword; E: qword; M: qword): qword;
var
C, I : qword;
    
begin
    if M = 1 then
        EXP := 0
    else
    begin
        C := 1;
        I := 0;
        while I < E do
        {for I := 0 to E - 1 do}
        begin
            C := (C * B) mod M;
            I := I + 1
        end;
        EXP := C
    end
end;

function PHI(N: qword): qword;
var
I : qword;

begin
    if N < 2 then
        PHI := N
    else if PRIME(N) then
        PHI := N - 1
    else
    begin
        PHI := 0;
        I := 2;
        while I <= N do
        {for I := 2 to N do}
        begin
            if GCD(I, N) = 1 then
            {ist I teilerfremd zu N?}
                PHI := PHI + 1;
            I := I + 1
        end
    end
end;

end.
