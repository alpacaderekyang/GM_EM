function [ I_n ] = addNoise(I, weight)

A = rand(size(I));
A = A/max(max(A));
I_n = I*(1-weight)+A*weight;

end

