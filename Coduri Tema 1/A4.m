clear
T = 5;
pas = 0.001;
t = -3*T:pas:3*T;
figure(4)
plot(t,Functie4(t,T))
function x = Functie4(t1,T1)
%sinus redresat dubla alternanta
omega0=2*pi/T1;
for i = 1:length(t1)
    x(i)=abs(sin(omega0*t1(i)));
end
end