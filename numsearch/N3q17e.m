% Computational appendix of arXiv:2408.00831
% 
% Author: Nicolas Gisin
% This code searches numerically for solutions of the second level of the
% hierarchy for three-qubit states (i.e., it looks for three-qubit measurements
% that can be localized using 17 ebits)

rng(trial);
global knownM nbSolutions eps S8

% Create Pauli strings
sigma;
S=zeros(2,2,4);S(:,:,1)=eye(2);S(:,:,2)=Sx;S(:,:,3)=Sy;S(:,:,4)=Sz;
S8=zeros(8,8,4,4,4);
for a1=1:4 for a2=1:4 for a3=1:4
     S8(:,:,a1,a2,a3)=kron(S(:,:,a1),kron(S(:,:,a2),S(:,:,a3)));
end,end,end
eps=1e-1;dgA=zeros(1,8);dgB=zeros(1,8);

nbSolutions=0;
dgAEnt=zeros(10,8);
dgBEnt=zeros(10,8);
nbFound=zeros(1,10);
nbTrial=0;
knownM=zeros(8,8,10);

while 0==0
    nbTrial=nbTrial+1;
    nbFound=nbFound;
    [param,fMin,exitFlag,output]=fminunc(@fmin17ebit,2*pi*rand(1,8*7),optimset('MaxIter',2000,'MaxFunEvals',10^8,'GradObj','off','display','off'));
    if fMin<10
        [param,fMin,exitFlag,output]=fminsearch(@fmin17ebit,param,optimset('MaxIter',20000,'MaxFunEvals',10^8,'GradObj','off','display','off'));
    end
    if fMin<1
        [param,fMin,exitFlag,output]=fminsearch(@fmin17ebit,param,optimset('MaxIter',20000,'MaxFunEvals',10^8,'GradObj','off','display','off'));
    end
    if fMin<eps
        M=BasesRandom(param,8);
        for k=1:8
            rhoA=PartialTrace2(M(:,k)*M(:,k)',[2 2 2 1],[1 0 0 0]);
            dgA(k)=2*(1-real(trace(rhoA^2)));
            rhoB=PartialTrace2(M(:,k)*M(:,k)',[2 2 2 1],[0 1 0 0]);
            dgB(k)=2*(1-real(trace(rhoB^2)));
        end
        found=0;j=0;
        while (j<nbSolutions) & (~found)
            j=j+1;
            if (abs(sum(sort(dgAEnt(j,:))-sort(dgA)))<0.01) & (abs(sum(sort(dgBEnt(j,:))-sort(dgB)))<0.01)
                [found a b c]=localunitarilyequiv3(M,knownM(:,:,j));
                if ~found [found a b c]=localunitarilyequiv3(M,knownM(:,:,j));end
            end
        end
        if found
            nbFound(j)=nbFound(j)+1
        else % new solution
            nbSolutions=nbSolutions+1;
            dgAEnt(nbSolutions,:)=dgA;
            dgBEnt(nbSolutions,:)=dgB;
            nbFound(nbSolutions)=1;
            % Remove phases from the eigenstates
            for k = 1:8
                vec = M(:,k);
                nz = find(abs(vec) > 1e-5);
                phase = angle(vec(nz(1)));
                knownM(:,k,nbSolutions) = M(:,k) / exp(1i*phase);
            end
        end
        save('seventeenEbitLocalizable.mat','nbTrial','nbSolutions','nbFound','dgAEnt','dgBEnt','knownM');
    end
end
