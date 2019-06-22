%Nathan Baledio
%ID: 1574353
%Midpoint Rule

function [I]=int_midpoint_rule(fun,a,b,n)
    x = linspace(a,b,n);
    I = 0;
    for k = 1 : n-1
        h = x(k+1) - x(k);
        kbar = (x(k) + x(k+1))/2 ;
        I = I + fun(kbar)*h;
    end
end
