clear
M = round(10*rand(10,10))
Maria_Maria2(M)
function S = Maria_Maria2(M1)
S=0;
for i = 1:10
    for j = 1:10
        S = S + M1(i,j);
    end
end
end