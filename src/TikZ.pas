{$R+}
{$B+}
{$Q+}
{Copyright Niklas Simandi 2022. Alle Rechte vorbehalten.
 Erlaubt die Visualisierung von modularer Exponentiation in vollständigen Restklassensystemen}
unit TikZ;

interface

procedure VISUALIZE(N: cardinal; C: cardinal; var O: text);
{Visualisiert ein vollständiges Restklassensystem modulo N}

procedure VISUALIZE(N: cardinal; B: cardinal; E: cardinal; var O: text);
{Visualisiert eine modulare Exponentiation B^E im vollständigen Restklassensystem modulo N}

implementation

procedure VISUALIZE(N: cardinal; C: cardinal; var O: text);
var
F, U, V, X, Y : real;
I, J : cardinal;

begin
    if N > 1 then
    begin
        F := 2 * PI / N;
        for I := 0 to N - 1 do
        begin
            J := (I * C) mod N;
            if I <> J then
            begin
                X := COS(I * F);
                Y := SIN(I * F);
                U := COS(J * F);
                V := SIN(J * F);
                {projiziere I und J in Polarkoordinaten}
                WRITE(O, '\draw[thin] (', X:0:7, ',', Y:0:7, ') to (', U:0:7, ',', V:0:7, ');')       
            end
        end
    end;
    WRITELN(O, '\draw (0,0) circle (', 1, ');')
end;

procedure VISUALIZE(N: cardinal; B: cardinal; E: cardinal; var O: text);
var
F, X, Y, U, V : real;
I, C, K : cardinal;

begin
    if (N > 1) and (E > 1) then
    begin
        F := 2 * PI / N;
        C := 1;
        for I := 0 to E - 2 do
        begin
            C := (C * B) mod N;
            K := (C * B) mod N;
            if C <> K then
            begin
                X := COS(C * F);
                Y := SIN(C * F);
                U := COS(K * F);
                V := SIN(K * F);
                {projiziere C und K in Polarkoordinaten}
                WRITE(O, '\draw[thin,-latex] (', X:0:7, ',', Y:0:7, ') to (', U:0:7, ',', V:0:7, ');')     
            end
        end;
        WRITE(O, '\draw (0,0) circle (', 1, ');');
        X := COS(B * F);
        Y := SIN(B * F);
        U := COS(K * F);
        V := SIN(K * F);
        WRITE(O, '\fill (', X:0:7, ',', Y:0:7, ') circle (', 0.03, ');');
        WRITELN(O, '\fill (', U:0:7, ',', V:0:7, ') circle (', 0.03, ');')
    end
end;

end.
