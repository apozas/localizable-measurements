% Computational appendix of arXiv:2408.XXXXX
% 
% Author: Alejandro Pozas-Kerstjens
% This code identifies the unique (per as Definition 2 in the manuscript)
% two-qubit bases out of a list of them. Actually it looks for equivalents
% under local unitary rotations, but not under swap of the parties.

load('allThreeEbitSolutions.mat');
allM = Expression1;
nbSolutions=1;
knownM = zeros(size(allM,1),size(allM,2),1);
knownM(:,:,1) = eye(size(allM,1));

for i=1:size(allM,3)
    unique=1;
    for k=1:nbSolutions
        [isrep fMin a b]=localunitarilyequiv2(allM(:,:,i),knownM(:,:,k));
        if ~isrep [isrep fMin a b]=localunitarilyequiv2(allM(:,:,i),knownM(:,:,k));end
        if isrep
            unique=0;
            break
        end
    end
    if unique
        nbSolutions=nbSolutions+1;
        knownM(:,:,nbSolutions) = allM(:,:,i);
        save('threeEbitLocalizable.mat','knownM');
    end
end
