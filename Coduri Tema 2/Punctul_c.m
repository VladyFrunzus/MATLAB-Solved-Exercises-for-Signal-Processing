close all;
clear;
clc;
pas = 0.1;
tau = -6:pas:10;

figure(1);
subplot(2,1,1);
plot(tau,f(tau));
axis([min(tau),max(tau),-1,4]);
xlabel('Timp \tau [s]');
ylabel('Amplitudine');
title('f(\tau)');
grid on;

subplot(2,1,2);
plot(tau,g(tau));
axis([min(tau),max(tau),-3,4]);
xlabel('Timp \tau [s]');
ylabel('Amplitudine');
title('g(\tau)');
grid on;

tmin = -3;
tmax = 8;
t = tmin:pas:tmax;
for index_t=1:length(t)
    subplot(2,1,1);
    figure(2);
    plot(tau,f(tau),'b');
    xlabel('Timp \tau [s]');
    ylabel('Amplitudine');
    title('Semnalele f(\tau) si g(t-\tau)');
    hold on;
    plot(tau,g(t(index_t)-tau),'r');
    prod = f(tau).*g(t(index_t)-tau);
    stem(tau, prod,'g');
    axis([min(tau),max(tau),-7,13]);
    hold off;
    grid on;
    conv(index_t) = integral(@(tau) f(tau).*g(t(index_t)-tau),-inf,inf);
    subplot(2,1,2);
    plot(t(1:length(conv)),conv);
    xlabel('Timp t [s]');
    ylabel('Amplitudine');
    title('Convoluția (f*g)(t)');
    axis([-5,10,-7,13]);
    grid on;
end