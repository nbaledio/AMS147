%Nathan Baledio
%ID:1574354
%Least squares test
%Make sure DJI_2014_2019.dat is in the same directory when running this
%function

function [x,p1,p2,p4,p8] = test_least_squares()

%Loads data into a matrix
x = linspace(0,1,1000);
matrix = load('DJI_2014_2019.dat');

%Separates matrix columnds into two row vectors
xi = matrix(:,1);
yi = matrix(:,2);
xi = xi';
yi = yi';

%Performs Least Squares to find unknown coefficients
[a1,err1] = poly_least_squares(xi,yi,1);
[a2,err2] = poly_least_squares(xi,yi,2);
[a4,err4] = poly_least_squares(xi,yi,4);
[a8,err8] = poly_least_squares(xi,yi,8);

%Evaluates x for degree 1
p1 = [];
sum = 0;
CurrExp = 0;
for i = 1:1000
    for j = 1:2
        sum = sum + (a1(j)*(x(i)^CurrExp));
        CurrExp = CurrExp + 1;
    end
    p1 = [p1,sum];
    sum = 0;
    CurrExp = 0;
end 

%Evaluates x for degree 2
p2 = [];
for i = 1:1000
    for j = 1:3
        sum = sum + (a2(j)*(x(i)^CurrExp));
        CurrExp = CurrExp + 1;
    end
    p2 = [p2,sum];
    sum = 0;
    CurrExp = 0;
end 

%Evaluates x for degree 4
p4 = [];
for i = 1:1000
    for j = 1:5
        sum = sum + (a4(j)*(x(i)^CurrExp));
        CurrExp = CurrExp + 1;
    end
    p4 = [p4,sum];
    sum = 0;
    CurrExp = 0;
end

%Evaluates x for degree 8
p8 = [];
sum = 0;
CurrExp = 0;
for i = 1:1000
    for j = 1:9
        sum = sum + (a8(j)*x(i)^CurrExp);
        CurrExp = CurrExp + 1;
    end
    p8 = [p8,sum];
    sum = 0;
    CurrExp = 0;
end 

%Plots graph of data points and Least Squares solutions
figure(1)
clf;
plot(xi,yi,'.b');
hold on;
plot(x,p1,'r');
plot(x,p2,'r');
plot(x,p4,'r');
plot(x,p8,'r');

end

