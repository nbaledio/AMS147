function [x,f,P1,P2,P3,P4]=test_Lagrange_interpolation()
%Creates 1000 evenly spaced nodes
x = linspace(-1,1,1000);
g = @(x) 1/1+(sin(2*pi*x).^2);
%Initializes and evaluates (1) at x
f = [];
f = [f,g(x)];

%Function handle for even/uneven grid
even = @(j,N) -1 + 2*(j/N);
uneven = @(j,N) cos((pi/N)*j);

%Interpolates P1 Grid
vecxi = [];
vecyi = [];
for j = 0:14
    vecxi = [vecxi,even(j,14)];
end
for i = 1:15
    vecyi = [vecyi,g(vecxi(i))];
end
P1 = Lagrange_interpolation(vecxi,vecyi,x);

%Plots P1 Grid
figure(1);
clf
plot(x,f,'b');
hold;
plot(vecxi,vecyi,'ro');
plot(x,P1,'r');


%Interpolates P2 Grid
vecxi = [];
vecyi = [];
for j = 0:40
    vecxi = [vecxi,even(j,40)];
end
for i = 1:41
    vecyi = [vecyi,g(vecxi(i))];
end
P2 = Lagrange_interpolation(vecxi,vecyi,x);

%Plots P2 Grid
figure(2);
clf
plot(x,f,'b');
hold;
plot(vecxi,vecyi,'ro');
plot(x,P2,'r');

%Interpolates P3 Grid
vecxi = [];
vecyi = [];
for j = 0:14
    vecxi = [vecxi,uneven(j,14)];
end
for i = 1:15
    vecyi = [vecyi,g(vecxi(i))];
end
P3 = Lagrange_interpolation(vecxi,vecyi,x);

%Plots P3 Grid
figure(3);
clf
plot(x,f,'b');
hold;
plot(vecxi,vecyi,'ro');
plot(x,P3,'r');


%Interpolates P4 Grid
vecxi = [];
vecyi = [];
for j = 0:40
    vecxi = [vecxi,uneven(j,40)];
end
for i = 1:41
    vecyi = [vecyi,g(vecxi(i))];
end
P4 = Lagrange_interpolation(vecxi,vecyi,x);

%Plots P4 Grid
figure(4);
clf
plot(x,f,'b');
hold;
plot(vecxi,vecyi,'ro');
plot(x,P4,'r');

end

