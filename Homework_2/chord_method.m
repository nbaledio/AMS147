function [z0,iter,res,his] = chord_method(fun,a,b,tol,Nmax)
%Sets x and y values of points a and b
x1 = a;
y1 = fun(a);
x2 = b;
y2 = fun(b);
%Initializes his vector and iter count
his = [];
iter = 0;
%Checks to see if interval is valid
if (y1*y2 > 0)
   error('f(a)*f(b)>0 - please modify the interval [a,b]'); 
end    

if y1==0     % We got the zero at x=a (very unlikely)
 z0=y1;
 return;
elseif y2==0  % We got the zero at x=b(very unlikely)
 z0=y2;
 return;
end 
%Calculates first approximation at the midpoint of a and b
xk = (a+b)/2;
z0 = xk;
xprev = 0;
I = abs(xk-xprev);
%Loop that calculates x(k+1) and compares to tolerance
while I >= tol && iter < Nmax
   iter = iter + 1;
   xprev = xk;
   his(iter) = xprev;
   xk = xk - ((x2-x1)/(y2-y1)) * fun(xk);
   I = abs(xk-xprev);   
end
%Error if there is not enough iterations to meet tolerance
if (iter==Nmax && I>tol)
 error('Not enough iterations to achieve tolerance %12.12g',tol)
end
z0 = xprev;
res = abs(fun(z0));
end

