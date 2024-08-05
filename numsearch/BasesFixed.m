% Computational appendix of arXiv:2408.00831
% 
% Author: Nicolas Gisin
% This file returns d column vectors constituting a basis parametrized by param. 
% The vectors are fixed in the sense that the last entries of vectors 2..d-1 are
% fixed to 0.
% nb param = 2*d-2;

function B=BasesFixed(param,d);

B=zeros(d);
p=param;
B(:,1)=vector(p,d);
p(d)=p(d)-pi/2;
B(:,d)=vector(p,d);

for j=1:d-2
    p=zeros(1,2*(d-j)-2);
    for n=1:d-j-1
        p(n)=param(n+j);
        p(n+d-j-1)=param(n+d+j-1);
    end;
    p(d-j)=p(d-j)-pi/2;
    B(:,d-j)=[vector(p,d-j);zeros(j,1)];
end;
