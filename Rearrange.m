function [ sortedSpin ] = Rearrange(spinConfig ,lattice )
%Rearrange This function rearrange the result of CPP program output such
%that the final result is matrix whose rows represent the final spin
%configuration for each run
%   The qubits in spinConfig should be order as 1,2,3... as numbered in the
%   configuration matrix
[~,col]=size(spinConfig);
numSpin=lattice(:,1:2);
spinIndex=unique(reshape(numSpin',1,[]),'stable')+1;
sortedSpin=zeros(col,max(spinIndex));
for i=1:length(spinIndex)
    sortedSpin(:,spinIndex(i))=spinConfig(i,:);
end    
end


