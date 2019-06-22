% Factorial Function
% Nathan Baledio
% 1574354
% 1/13/19 

function[b] = compute_factorial(n)
b = n;
if (n == 0)
  b = 1;
else
	while (n-1 ~= 0)
    b = b*(n-1);
    n = n-1;
    end
end
end
	