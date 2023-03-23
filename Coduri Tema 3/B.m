clear

    %construirea si afisarea functiei periodice 

    pas = 1/100;
    n=input("Nr de perioade pe care sa fie afisata functia = ");
    t = 0:pas:1-pas;
    T = 1;
    omega0 = 2*pi/T;
    f_2 = f2(t,T);
    for i=1:length(t)
        for j=0:n-1
            f_2(i+j*100)=f_2(i);
        end
    end 
    
    t2=0:pas:n-pas;

    figure(4);
    plot(t2,f_2);
    title("Functia f(t), cu perioada T=1, afisata pe " + n + " perioade");
    xlabel('Timp [s]');
    ylabel('Amplitudine');
    y_t = -0.5:0.5:1.5;
    yticks(y_t);
    axis([0 n-pas -0.5 1.5]);
    grid on;
    
    %seriile Fourier

    a0pe2 = 1/T*integral(@(t) f2(t,T),0,T);
    A0 = a0pe2;
    N=100;
    a = zeros(1,N);
    b = zeros(1,N);
    A = zeros(1,N+1);
    phi = zeros(1,N+1);
    A(1)=A0;
    phi(1)=0;
    AFC = zeros(1,2*N+1);
    AFC(101)=a0pe2;
    for k=1:N
        a(k)=2/T*integral(@(t)f2(t,T).*cos(k*omega0*t),0,T);
        b(k)=2/T*integral(@(t)f2(t,T).*sin(k*omega0*t),0,T);
        if abs(a(k))<10^-10
            a(k) = 0;
        end
        if abs(b(k))<10^-10
            b(k) = 0;
        end 
        A(k+1)=sqrt(a(k)^2+b(k)^2);
        if a(k)==0 && b(k)==0
        phi(k+1) = 0;
        else
        if a(k)>=0
        phi(k+1) = -atand(b(k)/a(k));
        else
        phi(k+1) = -atand(b(k)/a(k))-pi;
        end
        end
        AFC(k+N+1) = a(k) - 1j*b(k);
        AFC(N-k+1) = a(k) + 1j*b(k);
    end
    
    disp(' ')
    disp("Pentru SFT: ")
    a0pe2
    a
    b
    disp("Pentru SFA: ")
    A0
    A
    phi
    disp("Pentru SFC: ")
    AFC

    x1 = 0:omega0:100*omega0;
    x2 = -N*omega0:omega0:N*omega0;

    figure(5);
    subplot(2,1,1);
    stem(x1,A);
    xlabel('Frecventa \omega [rad/s]');
    ylabel('Amplitudini A_k');
    title('Spectrul de amplitudini - SFA')
    axis([-100 700 -0.1 max(A)+0.1]);
    subplot(2,1,2);
    stem(x1,phi);
    xlabel('Frecventa \omega [rad/s]');
    ylabel('Faze \phi_k');
    title('Spectrul de faze - SFA');
    axis([-100 700 min(phi)-20 max(phi)+20]);

    figure(6)
    subplot(2,1,1);
    stem(x2,abs(AFC));
    xlabel('Frecventa \omega [rad/s]');
    ylabel('Amplitudinea |C(n\omega_0)|');
    title('Spectrul de amplitudini - SFC');
    axis([-800 800 -0.1 max(abs(AFC))+0.1]);
    subplot(2,1,2);
    stem(x2,angle(AFC));
    xlabel('Frecventa \omega [rad/s]');
    ylabel('Faza arg\{C(n\omega_0)\}');
    title('Spectrul de faze - SFC');
    axis([-800 800 min(angle(AFC))-1 max(angle(AFC))+1]);
