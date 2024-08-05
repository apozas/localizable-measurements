% Computational appendix of arXiv:2408.00831
% 
% Author: Nicolas Gisin
% This file defines the function for computing partial traces.
% It is assumed that the Hilbert space is a product of 4 spaces of dimensions
% H(1)\otimes H(2)\otimes H(3) \otimes H(4). It traces out all the k_th spaces
% for which Pout(k)==0, keeping those for which Pout(k)==1

function rho_out=PartialTrace(rho,H,Pout);

nbH=4; %nb d'espace de Hilbert

Rin=zeros(H(1),H(2),H(3),H(4),H(1),H(2),H(3),H(4));
for L1=1:H(1) for L2=1:H(2) for L3=1:H(3) for L4=1:H(4) for c1=1:H(1) for c2=1:H(2) for c3=1:H(3) for c4=1:H(4) 
    Rin(L1,L2,L3,L4,c1,c2,c3,c4)=rho(L4+H(4)*(L3-1+H(3)*(L2-1+H(2)*(L1-1))),c4+H(4)*(c3-1+H(3)*(c2-1+H(2)*(c1-1))));
end;end;end;end;end;end;end;end;

Hout=zeros(1,4);
for k=1:nbH
    if Pout(k)==0 Hout(k)=1; else Hout(k)=H(k); end;
end;

Rout=zeros(Hout(1),Hout(2),Hout(3),Hout(4),Hout(1),Hout(2),Hout(3),Hout(4));
for L1=1:Hout(1) for L2=1:Hout(2) for L3=1:Hout(3) for L4=1:Hout(4) for c1=1:Hout(1) for c2=1:Hout(2) for c3=1:Hout(3) for c4=1:Hout(4) 
    if Pout(1)==0 i1=1:H(1); else i1=L1:L1; end;
    if Pout(2)==0 i2=1:H(2); else i2=L2:L2; end;
    if Pout(3)==0 i3=1:H(3); else i3=L3:L3; end;
    if Pout(4)==0 i4=1:H(4); else i4=L4:L4; end;
    for n1=i1 for n2=i2 for n3=i3 for n4=i4
        if Pout(1)==0 C1=n1; else C1=c1; end;
        if Pout(2)==0 C2=n2; else C2=c2; end;
        if Pout(3)==0 C3=n3; else C3=c3; end;
        if Pout(4)==0 C4=n4; else C4=c4; end;
        Rout(L1,L2,L3,L4,c1,c2,c3,c4)=Rout(L1,L2,L3,L4,c1,c2,c3,c4)+Rin(n1,n2,n3,n4,C1,C2,C3,C4);
    end;end;end;end;
end;end;end;end;end;end;end;end;

d_out=Hout(1)*Hout(2)*Hout(3)*Hout(4);
Rho=zeros(d_out,d_out);
for L1=1:Hout(1) for L2=1:Hout(2) for L3=1:Hout(3) for L4=1:Hout(4) for c1=1:Hout(1) for c2=1:Hout(2) for c3=1:Hout(3) for c4=1:Hout(4) 
    Rho(L4+Hout(4)*(L3-1+Hout(3)*(L2-1+Hout(2)*(L1-1))),c4+Hout(4)*(c3-1+Hout(3)*(c2-1+Hout(2)*(c1-1))))=Rout(L1,L2,L3,L4,c1,c2,c3,c4);
end;end;end;end;end;end;end;end;

%trace(Rho)
rho_out=Rho;
