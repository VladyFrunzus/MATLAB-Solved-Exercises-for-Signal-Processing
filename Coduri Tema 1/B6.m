clear
err = sqrt(12) - pi;
prompt = "Eroarea absoluta maxima dorita = ";
input_err = input(prompt);
[pi_aprox, nr_de_termeni] = Maria_Maria6(err,input_err)
function [pi_app,k] = Maria_Maria6(err2,input_err2)
pi_app = sqrt(12);
k = 1;
while err2 > input_err2
    pi_app = pi_app + sqrt(12) * (-3)^(-k)/(2*k+1);
    k = k + 1;
    err2 = abs(pi - pi_app);
end
end
