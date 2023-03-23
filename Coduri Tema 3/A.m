clear

    %decizie legata de tipul datelor de intrare
    
    disp("Pentru functia step, puteti alege daca doriti sa fie facuta pe numele VLADIMIR " + ...
    "sau pe un nume introdus de la tastatura");
    decizie = input("\nIntroduceti 1 pentru optiunea cu VLADIMIR sau 2 pentru optiunea cu numele de la tastatura: ", 's');
    if strcmp(decizie, "1")==1
    nume_str = "VLADIMIR";
    nume = double(char(nume_str));
    else 
        if strcmp(decizie, "2")==1
        nume_str = input("\nNumele care doriti sa fie transformat in functie (majuscule, fara spatii): ", 's');
        nume = double(char(nume_str));
        else
    disp("Ati introdus input-ul gresit.");

        end
    end

    %inceputul problemei efective

    if strcmp(decizie, "1")==1 || strcmp(decizie, "2")==1

    pas = 1/(length(nume)*100);
    n=input("\nNr de perioade pe care sa fie afisat semnalul (functia step) = ");
    t = 0:pas:1-pas;
    T = 1;
    omega0 = 2*pi/T;

    %seriile Fourier
      
    a0pe2 = 1/T*integral(@(t) f1(nume,t,T),0,T);
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
        a(k)=2/T*integral(@(t)f1(nume,t,T).*cos(k*omega0*t),0,T,"AbsTol",0.00001);
        b(k)=2/T*integral(@(t)f1(nume,t,T).*sin(k*omega0*t),0,T,"AbsTol",0.00001);
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

    %afisarea graficului functiei pe n perioade
    
    f_1 = f1(nume,t,T);
    for i=1:length(t)
        for j=1:n-1
            f_1(i+j*length(nume)*100)=f_1(i);
        end
    end 
    
    t2=0:pas:n-pas;

    figure(1);
    plot(t2,f_1);
    title("Functia generata de numele "+ nume_str);
    xlabel('Timp [s]');
    ylabel('Amplitudine');
    y_t = 0:2:26;
    yticks(y_t);
    axis([0 n-pas 0 27]);
    grid on;

    %afisarea spectrelor de amplitudine si faza
    
    x1 = 0:omega0:100*omega0;
    x2 = -N*omega0:omega0:N*omega0;

    figure(2);
    subplot(2,1,1);
    stem(x1,A);
    xlabel('Frecventa \omega [rad/s]');
    ylabel('Amplitudini A_k');
    title('Spectrul de amplitudini - SFA')
    axis([-100 700 -1 max(A)+2]);
    subplot(2,1,2);
    stem(x1,phi);
    xlabel('Frecventa \omega [rad/s]');
    ylabel('Faze \phi_k');
    title('Spectrul de faze - SFA');
    axis([-100 700 min(phi)-15 max(phi)+15]);

    figure(3)
    subplot(2,1,1);
    stem(x2,abs(AFC));
    xlabel('Frecventa \omega [rad/s]');
    ylabel('Amplitudinea |C(n\omega_0)|');
    title('Spectrul de amplitudini - SFC');
    axis([-800 800 -1 max(abs(AFC))+2]);
    subplot(2,1,2);
    stem(x2,angle(AFC));
    xlabel('Frecventa \omega [rad/s]');
    ylabel('Faza arg\{C(n\omega_0)\}');
    title('Spectrul de faze - SFC');
    axis([-800 800 min(angle(AFC))-1 max(angle(AFC))+1]);

    end
    