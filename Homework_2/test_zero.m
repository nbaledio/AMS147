function [zc,ec,x,f] = test_zero()
%Creates row vector of 1000 evenly spaced nodes
x = linspace(-1,1,1000);
%Initializes f output as an empty vector
f = [];
%Defines Fifth-Order Chebyshev polynomial
y = @(x) 16*x.^5-20*x.^3+5*x;
%Fills f with function evaluated at x
f = [f;y(x);];
%Plots graph of function
figure(1)
clf
plot(x,y(x));
xlabel('x');
ylabel('y');
title('Graph of 16x^5-20x^3+5x between -1 and 1');
grid on;
%Sets z0 
z0 = cos(9*pi/10);
ec = [];
[zc,iter,res,his] = chord_method(y,-.99,-.9,10^-15,20000);
%Creates error vector
ec = abs(his-zc)
%Creates convergence history graph
figure(2)
clf
semilogy(ec,'Linewidth',1.5);
grid;
xlabel('$k$','Interpreter','Latex');
ylabel('$e_{k}$','Interpreter','Latex');
title('Convergence History');
%Creates e_k vs e_k+1 graph
figure(3)
clf
loglog(ec(1:end-1),ec(2:end),'r-','Linewidth',1.5);
grid;
xlabel('$e_{k}$','Interpreter','Latex');
ylabel('$e_{k+1}$','Interpreter','Latex');
title('e_{k+1} vs e_k');
end

