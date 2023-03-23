clear
clc
close
pas = 0.001;
tau = -9:pas:-1;
N = 10 ;
for n = 1:N+1
    hold on;
    fn = [];
    for val = -9:pas:-1
        f_val = triunghi(val, n);
        fn(end+1) = f_val;
    end
    figure(3);
    plot(tau,fn);
    axis([-9,-1,-12*(n+0.5),5]);
    xlabel("Timp [s]");
    ylabel("Amplitudine");
    pause(0.5);
end

% se observa ca sirul de functii tinde grafic, 
% chiar daca in forma de triunghi, tot la graficul
% denaturat al unei distributii Dirac

% din calcul (facut pe algoritmul prezentat in seminar
% ce foloseste relatia de definitie a sirului reprezentativ 
% si teorema de medie), se observa ca, intr-adevar, sirul
% de functii este reprezentativ pentru distributia
% -72*delta(t+5)