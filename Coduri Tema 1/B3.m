clear
prompt = "m = ";
m = input(prompt);
prompt = "n = ";
n = input(prompt);
Maria_Maria3(m,n)
function M = Maria_Maria3(m1,n1)
if m1 ~= n1
    M = "Nu poti avea o matrice identitate cu numar diferit de linii si coloane";
else
    for i = 1:n1
        for j = 1:m1
            if i==j
                M(i,j) = 1;
            else
                M(i,j) = 0;
            end
        end
    end
end
end