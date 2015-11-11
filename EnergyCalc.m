function [ energy ] = EnergyCalc(config, lattice)
%ENERGYCALC This function calculate the total energy based on the input
%lattice and the spin configuration matrix
%   The config should be a spinConfig matrix output from SA.m; The lattice
%   should be the same input lattice matrix for SA.m
[row,~]=size(lattice);
[crow,~]=size(config);
energy=zeros(crow,1);
nsites=max(max(lattice(:,1:2)))+1;
ising=zeros(nsites,nsites);
for i=1:row
    ising(lattice(i,1)+1,lattice(i,2)+1)=lattice(i,3);
end
for i=1:nsites
    for j=1:nsites
        energy(:)=energy(:)+ising(i,j)*config(:,i).*config(:,j);
    end
end
end

