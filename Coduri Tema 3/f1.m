function f = f1(nume,t,T)

    nr = length(nume);
    f = zeros(1,length(t));
    for i=1:length(t)
        k=1;
        OK=0;
        while OK==0
            if (k-1)*T/nr <= mod(t(i),T) && mod(t(i),T) < k*T/nr
                OK=1;
                f(i)=nume(k)-64;
            else
                k=k+1;
            end
        end
    end
end