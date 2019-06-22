%Nathan Baledio
%ID: 1574354
%Least Squares Polynomial fitting. Make sure input vectors of data points
%are row vectors. 

function [a,err] = poly_least_squares(xi,yi,M)

Matrix = [];
RowIterator = [];
SummationValue = 0;
[m,n] = size(xi);
InitialExp = 0;

%Part 1: Build a matrix M

%Loop for iterating rows
for i = 1:M+1
    CurrExp = InitialExp;
    %Loop for iterating through columns
    for j = 1:M+1
        %Loop for summation of current index
        for k = 1:n
            SummationValue = SummationValue + (xi(k)^CurrExp);
        end
        RowIterator = [RowIterator,SummationValue];
        SummationValue = 0;
        CurrExp = CurrExp + 1;
    end
    Matrix = [Matrix;RowIterator];
    RowIterator = [];
    InitialExp = InitialExp + 1;
end

%Part 2: Build a column vector y

YVector = [];
YValue = 0;
CurrExp = 0;
for i = 1:M+1
    for j = 1:n
        YValue = YValue + ((xi(j)^CurrExp)*yi(j)); 
    end
    YVector = [YVector;YValue];
    YValue = 0;
    CurrExp = CurrExp + 1;
end

%Part 3: Solve for unknown coefficients

a = [];
a = linsolve(Matrix,YVector);
a = a';

%Part 4: Compute the error
err = 0;
xisum = 0;
CurrExp = 0;
for i = 1:n
    for j = 1:M+1
        xisum = a(j)*xi(i)^CurrExp;
        CurrExp = CurrExp + 1;
    end    
    err = err + (abs(yi(i)-xisum)^2);
    CurrExp = 0;
    xisum = 0;
end
end

