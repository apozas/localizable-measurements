% Computational appendix of arXiv:2408.00831
% 
% Author: Nicolas Gisin
% This code searches numerically for solutions of the third level of the
% hierarchy for two-qubit states (i.e., it looks for two-qubit measurements that
% can be localized using 9 ebits)

rng(1);
global knownM nbSolutions eps S1 S2 SIx
sigma;

% Build Pauli strings
S1=zeros(2,2,4);
S1(:,:,1)=eye(2);S1(:,:,2)=Sx;S1(:,:,3)=Sy;S1(:,:,4)=Sz;
S2=zeros(4,4,4,4);
for a=1:4 for b=1:4 S2(:,:,a,b)=kron(S1(:,:,a),S1(:,:,b));end;end
eps=1e-4;dg=zeros(1,4);

nbSolutions=0;
dgAEnt=zeros(100,4);
dgBEnt=zeros(100,4);
nbFound=zeros(1,100);
nbTrial=0;
knownM=zeros(4,4,100);

while 0==0
    nbTrial=nbTrial+1;
    [param,fMin,exitFlag,output]=fminunc(@fmin9ebits,2*pi*rand(1,12),optimset('MaxIter',2000,'MaxFunEvals', 10^8, 'GradObj','off','display','off'));
    if fMin<10
        [param,fMin,exitFlag,output]=fminsearch(@fmin9ebits,param,optimset('MaxIter',20000,'MaxFunEvals', 10^8, 'GradObj','off','display','off'));
    end
    if fMin<1
        [param,fMin,exitFlag,output]=fminsearch(@fmin9ebits,param,optimset('MaxIter',20000,'MaxFunEvals', 10^8, 'GradObj','off','display','off'));
    end
    if fMin<eps
        M=BasesRandom(param,4);
        for k=1:4
            rhoA=PartialTrace2(M(:,k)*M(:,k)',[2 2 1 1],[1 0 0 0]);
            dg(k)=2*(1-real(trace(rhoA^2)));
        end
        found=0;j=0;
        while (j<nbSolutions) & (~found)
            j=j+1;
            if abs(sum(sort(dgEnt(j,:))-sort(dg)))<0.01
                [found fmin a b]=localunitarilyequiv2(M,knownM(:,:,j));
                if ~found [found fmin a b]=localunitarilyequiv2(M,knownM(:,:,j));end
                if ~found [found fmin a b]=localunitarilyequiv2(M,knownM(:,:,j));end
            end
        end
        if found
            nbFound(j)=nbFound(j)+1;
        else % new solution
            nbSolutions=nbSolutions+1;
            dgEnt(nbSolutions,:)=dg;
            nbFound(nbSolutions)=1;
            % Remove phases from the eigenstates
            for k = 1:4
                vec = M(:,k);
                nz = find(abs(vec) > 1e-5);
                phase = angle(vec(nz(1)));
                knownM(:,k,nbSolutions) = M(:,k) / exp(1i*phase);
            end
        end
        save('TwoPartiesNineEbits.mat','nbTrial','nbSolutions','nbFound','dgEnt','knownM');
    end
end
