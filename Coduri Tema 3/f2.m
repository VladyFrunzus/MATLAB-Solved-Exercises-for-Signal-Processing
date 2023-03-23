function f = f2(t,T)

    f = zeros(1,length(t));
    for i=1:length(t)
        if t(i)<=T/2
            f(i) = 2/T*t(i);
        else
            break;
        end
    end
end