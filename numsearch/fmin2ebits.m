% Computational appendix of arXiv:2408.00831
% 
% Author: Nicolas Gisin
% This file defines the function, defined in Appendix E, that is minimized when
% looking for three-qubit measurements localizable at the first level of the
% hierarchy.

function y=fmin2ebit(p);

% Define Pauli strings
sigma;
S=zeros(2,2,4);S(:,:,1)=eye(2);S(:,:,2)=Sx;S(:,:,3)=Sy;S(:,:,4)=Sz;
for j=1:4 S4(:,:,j)=kron(Id2,S(:,:,j));end

M=BasesRandom(p,8);
y=0;
for b=1:4 for c=1:4
    P=abs(M'*kron(S4(:,:,b),S(:,:,c))*M);
    y=y+max(max(abs(abs(2*P-ones(8))-ones(8))));
end,end
end  % fct
