%Nathan Baledio
%ID: 1574353
%Simpson Rule

function [I]=int_Simpson_rule(fun,a,b,n)
    x = linspace(a,b,n);
    I = 0;
    for k = 1:n-1
        h = x(k+1) - x(k);
        kbar = (x(k+1) + x(k))/2;
        I = I + (fun(x(k)) + fun(x(k+1)) + 4*fun(kbar))*(h/6);
    end    
end

