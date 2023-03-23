clear
M = round(10*rand(10,10))
prompt = "Valoarea veche = ";
a = input(prompt);
prompt = "Valoarea noua = ";
b = input(prompt);
S = 0;
[Matricea_noua, Nr_de_schimbari] = Maria_Maria5(M,a,b)
function [M1,S] = Maria_Maria5(M1,a1,b1)
S=0;
if a1==b1
    S = "Bro, e acelasi numar";
else
for i = 1:10
    for j = 1:10
        if M1(i,j)==a1
            M1(i,j)=b1;
            S = S+1;
        end
    end
end
end
end