% Factorial Function
% Nathan Baledio
% 1574354
% 1/14/19 

function [y] = matrix_times_vector(A,x)
msg = 'Incorrect dimensions for matrix multiplication. Check that the number of columns in the first matrix matches the number of rows in the second matrix. To perform elementwise multiplication, use ".*".';
y = [];
[a,b] = size(A);
[c,d] = size(x);
if(b ~= c)
  error(msg)
end
for i = 1:size(A,1)
  value = 0;
  for j = 1:length(x)
    value = value + (A(i,j)*x(j));
  end
y = [y;value];
end
end
