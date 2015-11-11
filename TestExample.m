testLattice=dlmread('TestInstance.txt');
testLattice=testLattice(2:end,:);
[energy,config]=SA(testLattice,1000,100,'lin');
testEnergy=EnergyCalc(config,testLattice);
error=sum(abs(testEnergy-energy))