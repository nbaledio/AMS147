% Pi Series Function
% Nathan Baledio
% 1574354
% 1/14/19 

function [P,n,p]=pi_series()
P = [];
n = 0;
p = 0;
result = 0;
for k = 0:14
  result = vpa (result + 3*(((-1)^(k))*((1/(6*(k)+1)+(1/(6*(k)+5))))));
  P = [P;result];
end
P = P';
end
