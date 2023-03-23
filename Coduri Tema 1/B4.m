clear
M = round(10*rand(10,10))
Maria_Maria4(M)
function S = Maria_Maria4(M1)
S=zeros(1,10);
for j = 1:10
    for i = 1:10
        S(j) = S(j) + M1(i,j);
    end
end
end