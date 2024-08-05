% Computational appendix of arXiv:2408.00831
% 
% Author: Nicolas Gisin
% This file returns d column vectors of dimension 2^d constituting a basis
% parametrized by param. All entries of all vectors depends on param (contrary
% to BasesFixed)
% nb param = d*(d-1)

function B=BasesRandom(param,d);

B=eye(d);
d0=1; d1=2*(d-1);
for j=1:d-1
    Bv=BasesFixed(param(d0:d1),d+1-j);
    B(:,j:d)=B(:,j:d)*Bv;
    d0=d1+1; d1=d1+2*(d-j-1);
end;

if  1==0
    rp=randperm(d); % les vecteurs de base ne sont pas ordonnes aleatoirement !!??!
    Bs=B;
    for j=1:d
        B(:,j)=Bs(:,rp(j));
    end;
end;
