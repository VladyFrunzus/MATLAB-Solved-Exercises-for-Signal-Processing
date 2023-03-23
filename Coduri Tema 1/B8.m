clear
prompt = "n = ";
n = input(prompt);
prompt = "t = ";
t = input(prompt);
Maria_Maria8(n,t)
function r = Maria_Maria8(n1,t1)
k = 1;
r = 0;
while k<=n1
    r = r + sin((2*k-1)*t1)/(2*k-1);
    k =  k+1;
end
end