% Computational appendix of arXiv:2408.00831
% 
% Author: Alejandro Pozas-Kerstjens
% This code identifies the unique (per as Definition 2 in the manuscript)
% two-qubit bases out of a list of them.

load('allThreeEbitSolutions.mat');   % Change for the different cases
allM = knownM;
nbSolutions=1;
knownM = zeros(size(allM,1),size(allM,2),1);
knownM(:,:,1) = eye(size(allM,1));

swap = [1 0 0 0; 0 0 1 0; 0 1 0 0; 0 0 0 1];

% Swap operators for three parties
% swap213 = [1 0 0 0 0 0 0 0; 0 1 0 0 0 0 0 0; 0 0 0 0 1 0 0 0; 0 0 0 0 0 1 0 0;
%            0 0 1 0 0 0 0 0; 0 0 0 1 0 0 0 0; 0 0 0 0 0 0 1 0; 0 0 0 0 0 0 0 1];
% swap321 = [1 0 0 0 0 0 0 0; 0 0 0 0 1 0 0 0; 0 0 1 0 0 0 0 0; 0 0 0 0 0 0 1 0;
%            0 1 0 0 0 0 0 0; 0 0 0 0 0 1 0 0; 0 0 0 1 0 0 0 0; 0 0 0 0 0 0 0 1];
% swap132 = [1 0 0 0 0 0 0 0; 0 0 1 0 0 0 0 0; 0 1 0 0 0 0 0 0; 0 0 0 1 0 0 0 0;
%            0 0 0 0 1 0 0 0; 0 0 0 0 0 0 1 0; 0 0 0 0 0 1 0 0; 0 0 0 0 0 0 0 1];
% swap231 = [1 0 0 0 0 0 0 0; 0 0 1 0 0 0 0 0; 0 0 0 0 1 0 0 0; 0 0 0 0 0 0 1 0;
%            0 1 0 0 0 0 0 0; 0 0 0 1 0 0 0 0; 0 0 0 0 0 1 0 0; 0 0 0 0 0 0 0 1];
% swap312 = [1 0 0 0 0 0 0 0; 0 0 0 0 1 0 0 0; 0 1 0 0 0 0 0 0; 0 0 0 0 0 1 0 0;
%            0 0 1 0 0 0 0 0; 0 0 0 0 0 0 1 0; 0 0 0 1 0 0 0 0; 0 0 0 0 0 0 0 1];

for i=1:size(allM,3)
    unique=1;
    for k=1:nbSolutions
        % Code for 2 parties. Comment out for 3 parties
%         [isrep fMin a b]=localunitarilyequiv2(allM(:,:,i),knownM(:,:,k));
%         if ~isrep [isrep fMin a b]=localunitarilyequiv2(allM(:,:,i),knownM(:,:,k));end
%         if ~isrep
%             % Search for equivalence of the swapped basis
%             swapped = swap*allM(:,:,i);
%             [isrep fMin a b]=localunitarilyequiv2(swapped,knownM(:,:,k));
%         end
%         if ~isrep [isrep fMin a b]=localunitarilyequiv2(swapped,knownM(:,:,k));end
%         % Code for 3 parties. Comment out for 2 parties
%         [isrep fMin a b]=localunitarilyequiv3(allM(:,:,i),knownM(:,:,k));
%         if ~isrep
%             swapped = swap213*allM(:,:,i);
%             [isrep fMin a b]=localunitarilyequiv3(swapped,knownM(:,:,k));
%         end
%         if ~isrep
%             swapped = swap321*allM(:,:,i);
%             [isrep fMin a b]=localunitarilyequiv3(swapped,knownM(:,:,k));
%         end
%         if ~isrep
%             swapped = swap132*allM(:,:,i);
%             [isrep fMin a b]=localunitarilyequiv3(swapped,knownM(:,:,k));
%         end
%         if ~isrep
%             swapped = swap231*allM(:,:,i);
%             [isrep fMin a b]=localunitarilyequiv3(swapped,knownM(:,:,k));
%         end
%         if ~isrep
%             swapped = swap312*allM(:,:,i);
%             [isrep fMin a b]=localunitarilyequiv3(swapped,knownM(:,:,k));
%         end
        if isrep
            unique=0;
            break
        end
    end
    if unique
        nbSolutions=nbSolutions+1;
        knownM(:,:,nbSolutions) = allM(:,:,i);
        save('results/TwoPartiesThreeEbits.mat','knownM');   % Change for the different cases
    end
end
seventeenEbitLocalizable