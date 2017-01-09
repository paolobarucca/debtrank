function [equityLoss equity equityZero paymentVector error] = debtrank(interbankLiabilitiesMatrix,externalAssets,externalLiabilities, equityBeforeShock)

% PB for BDF2017
%[4b] Bardoscia, Marco, Stefano Battiston, Fabio Caccioli, and Guido Caldarelli.  "DebtRank: A microscopic foundation for shock propagation. " PloS one 10, no. 6 (2015): e0130406..
%interbankLiabilitiesMatrix => L 
%A => A
%externalAssets => Ae
%externalLiabilities => Le
%exogenousRecoveryRate => R

L = interbankLiabilitiesMatrix;
A = L';
Ae = externalAssets;
Le = externalLiabilities;


epsilon = 10^(-5);
max_counts = 10^5;

nbanks = length(L);


l = sum(L,2);

equityZero = Ae - Le + sum(A,2) - l;

equity = equityZero;

error = 1;
counts = 1;

while (error > epsilon)&&(counts < max_counts)
    
    oldEquity = equity;
    valuationVector = max(equity,0)./equityBeforeShock;
    equity = Ae - Le + A*(valuationVector) - l; 
     
    error = norm(equity - oldEquity)/norm(equity);
    counts = counts +1;
end

valuationVector = max(equity,0)./equityBeforeShock;

equity = Ae - Le + A*(valuationVector) - l;

paymentVector = max(0,min( Ae - Le + A*valuationVector, l)); 

equityLoss = equity - equityZero;