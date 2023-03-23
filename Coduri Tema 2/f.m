function y=f(t)
y=zeros(1,length(t));
prag=0.0001;
for i=1:length(t)
    if t(i) - prag > -5 && t(i) + prag < -1
        y(i) = -t(i)^2 - 6*t(i) - 6;
    else
        y(i) = 0;
    end
end
end