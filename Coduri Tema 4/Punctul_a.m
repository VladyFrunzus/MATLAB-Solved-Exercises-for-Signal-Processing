clear
clc
close
pas = 0.001;
tau = 4:pas:14;
amplitudine = 1;
N = 10;
for n = 1:N+1
    hold on;
    fn = [];
    for val = 4:pas:14
        gate_1 = sigma(val-7, -2*n*amplitudine);
        gate_2 = sigma(val-7-4/n, 2*n*amplitudine);
        fn(end+1) = gate_1 + gate_2;
    end
    figure(1);
    plot(tau,fn);
    axis([5.5,12,-24,1]);
    xlabel("Timp [s]");
    ylabel("Amplitudine");
    pause(0.5);
end

% se poate observa ca graficele tind catre graficul
% denaturat al distributiei Dirac delta, singura 
% diferenta fiind ca este centrat in 7 si ca este  
% oglindid fata de axa Ox

% din calcul (facut pe algoritmul prezentat in seminar
% ce foloseste relatia de definitie a sirului reprezentativ 
% si teorema de medie), se observa ca, intr-adevar, sirul
% de functii este reprezentativ pentru distributia
% -8*delta(t-7)
