%Nathan Baledio
%ID:1574354
%ODE solver for given problem

function [y,t]=solve_ODE_system()

function [func] = func(y,t)
    func = [];
    func = [func;(-y(1) + y(2)*y(3))];
    func = [func;(-y(2) + (y(3)-2)*y(1))];
    func = [func;(1 - y(1)*y(2))];
end

fun = @(y,t)func(y,t);
NSTEPS=1e5;
DT= 1e-3;
IOSTEP=50;
y0=[1; 2; 3];
[y,t] = AB2(fun,y0,NSTEPS,DT,IOSTEP);

figure(1)
clf
hold on;
plot(t,y(1,:));
plot(t,y(2,:));
plot(t,y(3,:));

figure(2)
clf
plot3(y(1,:),y(2,:),y(3,:));
axis square
end

