%Nathan Baledio
%ID:1574354
%tridiag_solver function

function [x] = tridiag_solver(e,a,c,b)
    [f,n] = size(a);
    x = zeros(1,n);
    %Forward Elimination Phase
    for k = 2:n
        m = e(k-1)/a(k-1);
        a(k) = a(k) - m*c(k-1);
        b(k) = b(k) - m*b(k-1);
    end
    x(n) = b(n)/a(n);
    %Backward substitution phase
    for k = n-1:-1:1
        x(k) = (b(k)-c(k)*x(k+1))/a(k);
    end 
    x = x';
    
end

