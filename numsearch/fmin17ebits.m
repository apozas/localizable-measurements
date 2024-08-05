% Computational appendix of arXiv:2408.00831
% 
% Author: Nicolas Gisin
% This file defines the function, defined in Appendix E, that is minimized when
% looking for three-qubit measurements localizable at the second level of the
% hierarchy.

function y=fmin17ebit(p);

% Define Pauli strings
sigma;
S=zeros(2,2,4);S(:,:,1)=eye(2);S(:,:,2)=Sx;S(:,:,3)=Sy;S(:,:,4)=Sz;
S8=zeros(8,8,4,4,4);
for a1=1:4 for a2=1:4 for a3=1:4
     S8(:,:,a1,a2,a3)=kron(S(:,:,a1),kron(S(:,:,a2),S(:,:,a3)));
end,end,end

M=BasesRandom(p,8);
y=0;
for b=1:4 for c=1:4
%        M*1xSbxSc*M *Sa* M’*1xSbxSc*M
    Mbc=M'*S8(:,:,1,b,c)*M;
    for a1=1:4 for a2=1:4 for a3=1:4
        P=abs(Mbc*S8(:,:,a1,a2,a3)*Mbc);
        y=y+max(max(abs(abs(2*P-ones(8))-ones(8))));
    end,end,end
end,end
end  % fct
