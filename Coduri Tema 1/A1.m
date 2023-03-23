clear
T = 5;
pas = 0.001;
t = -3*T:pas:3*T;
figure(1);
plot(t,Functie1(t,T));
function x = Functie1(t1,T1)
%functia de comutatie
for i = 1:length(t1)
    if mod(t1(i),T1)<T1/2
        x(i)=1;
    else
        x(i)=-1;
    end
end
end