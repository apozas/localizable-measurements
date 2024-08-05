% Computational appendix of arXiv:2408.00831
% 
% Author: Nicolas Gisin
% This file defines the function, defined in Appendix E, that is minimized when
% looking for two-qubit measurements localizable at the third level of the
% hierarchy.

function y=fmin9ebits(p);

M=BasesRandom(p,4);

Mx=M'*SIx*M;
My=M'*SIy*M;
Mz=M'*SIz*M;
y=0;
for a1=1:4 for a2=1:4 
    Max=Mx*S2(:,:,a1,a2)*Mx;
    May=My*S2(:,:,a1,a2)*My;
    Maz=Mz*S2(:,:,a1,a2)*Mz;
    for b1=1:4 for b2=1:4
        P=abs(Max*S2(:,:,b1,b2)*Max);
        y=y+max(max(abs(abs(2*P-ones(4))-ones(4))));
        P=abs(May*S2(:,:,b1,b2)*May);
        y=y+max(max(abs(abs(2*P-ones(4))-ones(4))));
        P=abs(Maz*S2(:,:,b1,b2)*Maz);
        y=y+max(max(abs(abs(2*P-ones(4))-ones(4))));
    end;end
end,end
end  % fct