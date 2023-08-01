{$R+}
{$B+}
{$Q+}
{Copyright Niklas Simandi 2022. Alle Rechte vorbehalten.
 Eine interaktive Implementierung des Rivest-Shamir-Adleman-Kryptosystems}
program RivestShamirAdleman;

uses
TikZ,
NumberTheory;

const
RED: string = CHR(27) + '[1;31m';
GREEN: string = CHR(27) + '[1;32m';
BLUE: string = CHR(27) + '[1;34m';
RESET: string = CHR(27) + '[0m';

var
P, Q, N, E, D : qword;
C, K, S, T : int64;

procedure ASSERT(B: boolean; S: string);
begin
    if not B then
    begin
        WRITELN(RED, ':> ', RESET, S);
        HALT(1);
    end
end;

procedure GENERATE;
{Schlüsselgenerierung mit beliebigen Primzahlen P, Q und Exponent E}
begin
    WRITELN(BLUE, ':> ', RESET, 'generate');
    WRITE('P Q', GREEN, ' << ', RESET);
    READLN(P, Q);
    ASSERT(PRIME(P) and PRIME(Q), 'P or Q not prime');
    N := P * Q;
    P := (P - 1) * (Q - 1);
    {ASSERT(PHI(N) = P, 'Phi(N) <> P');}
    WRITELN('N', BLUE, ' >> ', RESET, N);
    WRITELN('Phi(N)', BLUE, ' >> ', RESET, P);
    WRITE('E', GREEN, ' << ', RESET);
    READLN(E);
    ASSERT(E < P, 'E >= Phi(N)');
    ASSERT(GCD(E, P, S, T) = 1, 'E not coprime to Phi(N)');
    if S < 0 then
        while True do
        begin
            S := S + P;
            {Satz von Euler}
            if S >= 0 then
            begin
                D := S;
                break
            end
        end
    else
        D := S;
    WRITELN('D', BLUE, ' >> ', RESET, D);
    WRITELN('E N', BLUE, ' >> ', RESET, E, ' ', N);
    WRITELN('D N', BLUE, ' >> ', RESET, D, ' ', N)
end;

procedure ENCRYPT;
{Verschlüsselung einer Zahlenkette}
begin
    WRITELN(BLUE, ':> ', RESET, 'encrypt');
    while True do
    begin
        WRITE('K', GREEN, ' << ', RESET);
        READLN(K);
        if (K < 0) or (K >= N) then
            break
        else
        begin
            C := EXP(K, E, N);
            WRITELN('C', BLUE, ' >> ', RESET, C)
        end
    end
end;

procedure DECRYPT;
{Entschlüsselung einer Zahlenkette}
begin
    WRITELN(BLUE, ':> ', RESET, 'decrypt');
    while True do
    begin
        WRITE('C', GREEN, ' << ', RESET);
        READLN(C);
        if (C < 0) or (C >= N) then
            break
        else
        begin
            K := EXP(C, D, N);
            WRITELN('K', BLUE, ' >> ', RESET, K)
        end
    end;
    WRITELN(BLUE, ':> ', RESET, 'done')
end;

begin
    GENERATE;
    ENCRYPT;
    DECRYPT;
end.
