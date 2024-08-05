% Computational appendix of arXiv:2408.00831
% 
% Author: Nicolas Gisin
% This file defines the function that checks whether two three-qubit bases are
% equivalent under local rotations.

function [yn a b c]=localunitarilyequiv3(M1,M2);
% yn=1 iff M1=UAxUBxUC.M2
% a b param local unitaries
global Sx Sy Sz Mm1 Mm2
Mm1=M1;Mm2=M2;
eps=1e-2;
sigma;

yn=0;j=0;
while (j<200) & (~yn)
    j=j+1;
    [param,fMin,exitFlag,output]=fminunc(@fmin,rand(1,9)-.5,optimset('MaxIter',2000,'MaxFunEvals',10^8,'GradObj','off'));
    ymin(j)=fMin;
    yn=(fMin<eps);
end
a=param(1:3); b=param(4:6); c=param(7:9);

end % fct


%==========================
function y=fmin(p);
% The function that is minimized, in the spirit of that in Appendix E
global Mm1 Mm2 Sx Sy Sz

HA=p(1)*Sx+p(2)*Sy+p(3)*Sz;
HB=p(4)*Sx+p(5)*Sy+p(6)*Sz;
HC=p(7)*Sx+p(8)*Sy+p(9)*Sz;

P=abs(Mm1'*kron(expm(i*HA),kron(expm(i*HB),expm(i*HC)))*Mm2);
y=max(max(abs(abs(2*P-ones(8))-ones(8))));
end % fct
