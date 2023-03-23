clear
T = 5;
pas = 0.001;
t = -3*T:pas:3*T;
figure(3)
plot(t,Functie3(t,T))
function x = Functie3(t1,T1)
%sinus redresat mono-alternanta
omega0=2*pi/T1;
for i = 1:length(t1)
    if mod(t1(i),T1)<T1/2
        x(i)=sin(omega0*t1(i));
    else
        x(i)=0;
    end
end
end