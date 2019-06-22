function [lambda,L]=compute_Lebesgue_function(xi,x)
%Gets dimensions of xi
[m,n] = size(xi);
g = @(x) 0;
%Summation for Lebesgue function
for k = 1:n
    %Temporary function holder
    y = @(x) 1;
    for j = 1:n
       %Skips to prevent divide by zero error 
       if(j == k)
           continue;
       end
       %Appends to l_k(x)
       y = @(x) y(x) .* (x-xi(j))/(xi(k)-xi(j));
    end
    %Appends to g(x), the Lebesgue function
    g = @(x) g(x) + abs(y(x));
end
%Evaluates Lebesgue function at x
lambda = g(x);
%Finds maximum value from lambda
L = max(lambda);

end

