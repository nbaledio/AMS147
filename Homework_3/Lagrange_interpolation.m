function [y] = Lagrange_interpolation(xi,yi,x)
%Initializes vandermonde vector
v = [];
%Initializes vector of points evaluated at x
y = [];
%Iterator vector
itervec = [];
[m,n]=size(xi);
%Constructs vanvermonde matrix
for i = 1:n
    for j = 0:n-1
        itervec = [itervec,xi(i)^j];
    end
%Appends itervec to vandermonde vector    
v = [v;itervec];
%Resets itervec
itervec = [];
end
%Calculates vector a for polynomial
a = linsolve(v,yi');
%Transposes a
a = a';
%Gets size for a
[b,c] = size(a);
%Gets size for x
[e,f] = size(x);
%Iterates through Lagrange Polynomial Interpolant for each value
%of x and appends it to y vector
for i = 1:f
    value = 0;
    for j = 1:c
       value = value + (a(j)*x(i)^(j-1));
    end 
    y = [y,value];
end
end

