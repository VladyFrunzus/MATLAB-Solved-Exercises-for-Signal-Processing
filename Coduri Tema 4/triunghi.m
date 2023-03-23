function functie = triunghi(t,n)
if t>=-5-3/n && t<-5
    functie = -4*n^2*t-20*n^2-12*n;
else
    if t>=-5 && t<-5+3/n
        functie = 4*n^2*t+20*n^2-12*n;
    else
        functie = 0;
    end
end
end