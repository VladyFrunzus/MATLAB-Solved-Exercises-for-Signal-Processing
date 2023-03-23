clear
prompt = "n = ";
n = input(prompt);
t = linspace(0,4*pi,1001);
v = Maria_Maria9(n,t);
figure(5)
plot(t,v)
function r = Maria_Maria9(n1,t1)
k = 1;
r = 0;
while k<=n1
    r = r + sin((2*k-1)*t1)/(2*k-1);
    k =  k+1;
end
end
