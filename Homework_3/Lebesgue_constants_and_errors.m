function [L1,L2,L3,L4,e1,e2,e3,e4]=Lebesgue_constants_and_errors()

x = linspace(-1,1,1000);
g = @(x) 1/1+(sin(2*pi*x).^2);
f = g(x);

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
[P1,L1] = compute_Lebesgue_function(vecxi,x);
Pl1 = Lagrange_interpolation(vecxi,vecyi,x);
figure(1)
plot(x,P1);

%Interpolates P2 Grid
vecxi = [];
vecyi = [];
for j = 0:40
    vecxi = [vecxi,even(j,40)];
end
for i = 1:41
    vecyi = [vecyi,g(vecxi(i))];
end
[P2,L2] = compute_Lebesgue_function(vecxi,x);
Pl2 = Lagrange_interpolation(vecxi,vecyi,x);
figure(2)
plot(x,P2);

%Interpolates P3 Grid
vecxi = [];
vecyi = [];
for j = 0:14
    vecxi = [vecxi,uneven(j,14)];
end
for i = 1:15
    vecyi = [vecyi,g(vecxi(i))];
end
[P3,L3] = compute_Lebesgue_function(vecxi,x);
Pl3 = Lagrange_interpolation(vecxi,vecyi,x);
figure(3)
plot(x,P3);

%Interpolates P4 Grid
vecxi = [];
vecyi = [];
for j = 0:40
    vecxi = [vecxi,uneven(j,40)];
end
for i = 1:41
    vecyi = [vecyi,g(vecxi(i))];
end
[P4,L4] = compute_Lebesgue_function(vecxi,x);
Pl4 = Lagrange_interpolation(vecxi,vecyi,x);
figure(4)
plot(x,P4);

%Calculates errors
e1 = max(abs(f-Pl1));
e2 = max(abs(f-Pl2));
e3 = max(abs(f-Pl3));
e4 = max(abs(f-Pl4));
end

