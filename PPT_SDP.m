% Computational appendix of arXiv:2408.00831
% 
% Author: Jef Pauwels
% This script implements SDP criterion for verifying minimal entanglement cost
% of Appendix D
% Requirements: YALMIP (https://yalmip.github.io)
%               MOSEK (https://www.mosek.com)
%               QETLAB (http://www.qetlab.com)

% Define the measurement

EJM = [[1-1i,2*1i,0,1+1i]/sqrt(8); [-1-1i,0,-2*1i,-1+1i]/sqrt(8); [1+1i,0,-2*1i,1-1i]/sqrt(8); [-1+1i,2*1i,0,-1-1i]/sqrt(8)]';
Bell = [[1,0,0,1]/sqrt(2); [0,1,1,0]/sqrt(2); [0,1,-1,0]/sqrt(2); [1,0,0,-1]/sqrt(2)]';
tBSM = [.5 .5 .5 .5;.5 -.5 -.5 .5;0 1/sqrt(2) -1/sqrt(2) 0; -1/sqrt(2) 0 0 1/sqrt(2)];
E2 = [0 1/sqrt(2) -1/sqrt(2) 0;.5 -.5 -.5 .5;.5 .5 .5 .5;1/sqrt(2) 0 0 -1/sqrt(2)];
B2 = [0 0 1i*sqrt(2) -1i*sqrt(2);sqrt(2) -sqrt(2) 0 0; 1 1 1 1; -1 -1 1 1]/2;

% Specify the measurement
M = Xi;

phi = MaxEntangled(2)*MaxEntangled(2)';

n = 1; %number of ancilla ebits
d = 2^(n+1); % local dimension of the measurement operators

N = sdpvar(d^2,d^2,4);

F = [];
s = 0;
for c = 1:4
    F = [F; N(:,:,c) >= 0]; %positivity
    F = [F; PartialTranspose(N(:,:,c),1,[d,d]) >= 0];
    s = s + N(:,:,c);
end
F = [F; s == eye(d^2)]; %normalisation


phi2 = Tensor(phi,2); % Systems: A1 B1 A2 B2
phi2 = PermuteSystems(phi2,[1,3,2,4],[2,2,2,2]);

phi3 = Tensor(phi,3); %% Systems: A1 B1 A2 B2 ... An Bn
phi3 = PermuteSystems(phi3,[1,3,5,2,4,6],[2,2,2,2,2,2]);


perms = 1:2*(n+1);perms(2) = n+2;perms(n+2) = 2;
W = 0;
for c = 1:4
   if n == 3
   W = W + trace(PermuteSystems(N(:,:,c),[1,3,4,5,2,6,7,8],[2,2,2,2,2,2,2,2])*kron(M(:,c)*M(:,c)',phi3))/4;
   end
   if n == 2
   W = W + trace(PermuteSystems(N(:,:,c),[1,3,4,2,5,6],[2,2,2,2,2,2])*kron(M(:,c)*M(:,c)',phi2))/4;
   end
   if n == 1
   W = W + trace(PermuteSystems(N(:,:,c),[1,3,2,4],[2,2,2,2])*kron(M(:,c)*M(:,c)',phi))/4;
   end
end

ops=sdpsettings('solver','mosek','verbose',1, 'cachesolvers', 1); solvesdp(F,-W,ops);
double(W)

% Check if the measurement is separable
N = double(N);
IsSeparable(N(:,:,1)+0.000001*eye(16))