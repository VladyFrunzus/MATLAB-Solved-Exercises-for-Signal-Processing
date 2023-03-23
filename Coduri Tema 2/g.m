function y=g(t)
y=zeros(1,length(t));
prag=0.0001;
for i=1:length(t)
    if t(i) - prag > 3 && t(i) + prag < 8
        y(i) = t(i) - 5;
    else
        y(i) = 0;
    end
end
end