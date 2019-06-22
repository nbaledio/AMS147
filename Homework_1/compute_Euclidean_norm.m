% Euclidean Norm Function
% Nathan Baledio
% 1574354
% 1/13/19 

function[z] = compute_Euclidean_norm(x)
z = 0;
for i = 1:length(x)
	z = z+(x(i)*x(i));
end
z = sqrt(z);
end