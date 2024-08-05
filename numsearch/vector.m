% Computational appendix of arXiv:2408.00831
% 
% Author: Nicolas Gisin
% This file returns the d-dimensional column vector parametrized by param
% nb param =2*d-2;

% !!! vecteur pas du tout aléatoire car le poids est surtout porté par les
% dernieres composantes du vecteur !!!

function v=vector(param,d);

v=ones(d,1);
for j=1:d-1
    c=cos(param(j+d-1));
    for k=1:d-j
        v(k)=v(k)*c;
    end;
    v(d-j+1)=v(d-j+1)*sin(param(j+d-1))*exp(i*param(j));
end;
