clear
clc
close
pas = 0.001;
tau = -10:pas:4;
amplitudine = 1;
N = 10;
for n = 1:N+1
    hold on;
    fn = [];
    for val = -10:pas:4
        gate_1 = sigma(val+3+3/n, -n^2*amplitudine);
        gate_2 = sigma(val+3, 2*n^2*amplitudine);
        gate_3 = sigma(val+3-3/n, -n^2*amplitudine);
        fn(end+1) = gate_1 + gate_2 + gate_3;
    end
    figure(2);
    plot(tau,fn);
    axis([-7,1,-(n+0.3)^2,(n+0.3)^2]);
    xlabel("Timp [s]");
    ylabel("Amplitudine");
    pause(0.5);
end


% din calcul (facut pe algoritmul prezentat in seminar
% ce foloseste relatia de definitie a sirului reprezentativ 
% si teorema de medie), se observa ca sirul
% de functii este reprezentativ pentru distributia
% 9*delta'(t+3)
