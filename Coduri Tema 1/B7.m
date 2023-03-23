clear
A = [];
prompt = "Nr de linii: ";
n = input(prompt);
prompt = "Nr de coloane: ";
m = input(prompt);
for i = 1:n
    for j = 1:m
        A(i,j) = input("");
    end
end
[vector_pare, vector_impare] = Maria_Maria7(A)
function [v00,v01] = Maria_Maria7(A1)
v00=[];
v01=[];
for i = 1:size(A1,1)
    for j = 1:size(A1,2)
        if mod(A1(i,j),2)==0
            v00(end+1) = A1(i,j);
        else
            v01(end+1) = A1(i,j);
        end
    end
end
end