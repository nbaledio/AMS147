%Nathan Baledio
%ID: 1574353
%Trapezoidal Rule

function [I]=int_trapezoidal_rule(fun,a,b,n)
    x = linspace(a,b,n);
    I = 0;
    for k = 1:n-1
        h = x(k+1) - x(k);
        I = I + (fun(x(k)) + fun(x(k+1)))/2 * h;
    end
end
