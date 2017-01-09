%BIG DATA FINANCE - EXERCISE 4

nbanks = 3;
interbankLiabilitiesMatrix = [0 4  0; ...
                              0  0 3;... 
                              2 0  0];

externalAssets =      [20; 20; 10];
externalLiabilities = [17; 18; 8];
equityBeforeShock = externalAssets - externalLiabilities + ...
                    sum(interbankLiabilitiesMatrix,1)' - sum(interbankLiabilitiesMatrix,2);


uniformShock = 0.1;

%new% 
shock = uniformShock*externalAssets;
externalAssetsShocked  =  externalAssets - shock;

[equityLoss equity equityZero paymentVector error] = debtrank(interbankLiabilitiesMatrix,externalAssetsShocked,externalLiabilities, ...
                                                                   equityBeforeShock);

bdfplot(nbanks, equityZero, equityZero + shock, equity)