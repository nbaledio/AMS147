%Nathan Baledio
%ID:1574354
%backward_sub function

function [x] = backward_sub(U,b)
    [m,n] = size(U);
    x1 = b(1)/U(1,1);
    x = [];
    x = [x;x1];
    endpoint = 1;
    %Iterates through rows
    for i = 2:m
        xm = b(i);
        %Iterates through columns of triangular matrix
        for j = 1:endpoint
            xm = xm - U(i,j)*x(j);
        end
        endpoint = endpoint + 1;
        xm = xm/U(i,i);
        x = [x;xm];
    end    
end

