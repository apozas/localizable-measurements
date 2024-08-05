% Computational appendix of arXiv:2408.00831
% 
% Author: Nicolas Gisin
% This file contains Pauli strings necessary for the calculations

global Id2 Sx Sy Sz SxxI SxyI SxzI SyxI SyyI SyzI SzxI SzyI SzzI SxIx SxIy SxIz SyIx SyIy SyIz SzIx SzIy SzIz  SIxx SIxy SIxz SIyx SIyy SIyz SIzx SIzy SIzz Sxx Sxy Sxz Syx Syy Syz Szx Szy Szz Id4 SxI SyI SzI SIx SIy SIz

Id2=[1 0; 0 1]; Sx=[0 1; 1 0]; Sy=[0 -i; i 0]; Sz=[1 0; 0 -1];
S2=[Id2' Sx' Sy' Sz'];

SxI=kron(Sx,Id2);
SyI=kron(Sy,Id2);
SzI=kron(Sz,Id2);
SIx=kron(Id2,Sx);
SIy=kron(Id2,Sy);
SIz=kron(Id2,Sz);

Id4=kron(Id2,Id2);
Sxx=kron(Sx,Sx);
Sxy=kron(Sx,Sy);
Sxz=kron(Sx,Sz);
Syx=kron(Sy,Sx);
Syy=kron(Sy,Sy);
Syz=kron(Sy,Sz);
Szx=kron(Sz,Sx);
Szy=kron(Sz,Sy);
Szz=kron(Sz,Sz);

Id8=eye(8);
SxxI=kron(kron(Sx,Sx),Id2);
SxyI=kron(kron(Sx,Sy),Id2);
SxzI=kron(kron(Sx,Sz),Id2);
SyxI=kron(kron(Sy,Sx),Id2);
SyyI=kron(kron(Sy,Sy),Id2);
SyzI=kron(kron(Sy,Sz),Id2);
SzxI=kron(kron(Sz,Sx),Id2);
SzyI=kron(kron(Sz,Sy),Id2);
SzzI=kron(kron(Sz,Sz),Id2);

SxIx=kron(kron(Sx,Id2),Sx);
SxIy=kron(kron(Sx,Id2),Sy);
SxIz=kron(kron(Sx,Id2),Sz);
SyIx=kron(kron(Sy,Id2),Sx);
SyIy=kron(kron(Sy,Id2),Sy);
SyIz=kron(kron(Sy,Id2),Sz);
SzIx=kron(kron(Sz,Id2),Sx);
SzIy=kron(kron(Sz,Id2),Sy);
SzIz=kron(kron(Sz,Id2),Sz);

SIxx=kron(kron(Id2,Sx),Sx);
SIxy=kron(kron(Id2,Sx),Sy);
SIxz=kron(kron(Id2,Sx),Sz);
SIyx=kron(kron(Id2,Sy),Sx);
SIyy=kron(kron(Id2,Sy),Sy);
SIyz=kron(kron(Id2,Sy),Sz);
SIzx=kron(kron(Id2,Sz),Sx);
SIzy=kron(kron(Id2,Sz),Sy);
SIzz=kron(kron(Id2,Sz),Sz);

SIIx=kron(kron(Id2,Id2),Sx);
SIIy=kron(kron(Id2,Id2),Sy);
SIIz=kron(kron(Id2,Id2),Sz);
SIxI=kron(kron(Id2,Sx),Id2);
SIyI=kron(kron(Id2,Sy),Id2);
SIzI=kron(kron(Id2,Sz),Id2);
SxII=kron(kron(Sx,Id2),Id2);
SyII=kron(kron(Sy,Id2),Id2);
SzII=kron(kron(Sz,Id2),Id2);

Sxxx=kron(kron(Sx,Sx),Sx);
Sxxy=kron(kron(Sx,Sx),Sy);
Sxxz=kron(kron(Sx,Sx),Sz);
Sxyx=kron(kron(Sx,Sy),Sx);
Sxyy=kron(kron(Sx,Sy),Sy);
Sxyz=kron(kron(Sx,Sy),Sz);
Sxzx=kron(kron(Sx,Sz),Sx);
Sxzy=kron(kron(Sx,Sz),Sy);
Sxzz=kron(kron(Sx,Sz),Sz);

Syxx=kron(kron(Sy,Sx),Sx);
Syxy=kron(kron(Sy,Sx),Sy);
Syxz=kron(kron(Sy,Sx),Sz);
Syyx=kron(kron(Sy,Sy),Sx);
Syyy=kron(kron(Sy,Sy),Sy);
Syyz=kron(kron(Sy,Sy),Sz);
Syzx=kron(kron(Sy,Sz),Sx);
Syzy=kron(kron(Sy,Sz),Sy);
Syzz=kron(kron(Sy,Sz),Sz);

Szxx=kron(kron(Sz,Sx),Sx);
Szxy=kron(kron(Sz,Sx),Sy);
Szxz=kron(kron(Sz,Sx),Sz);
Szyx=kron(kron(Sz,Sy),Sx);
Szyy=kron(kron(Sz,Sy),Sy);
Szyz=kron(kron(Sz,Sy),Sz);
Szzx=kron(kron(Sz,Sz),Sx);
Szzy=kron(kron(Sz,Sz),Sy);
Szzz=kron(kron(Sz,Sz),Sz);
