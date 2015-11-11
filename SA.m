function [ energy,sortedSpin ] = SA( lattice,nsweeps,reps,schedType,beta0,beta1,rep0)
%SA This is a wrapper for C++ simulated annealing code
%   The input argument should be
%   1. lattice: The lattice matrix
%   2. sweeps: Number of sweeps
%   3. reps: Number of repetitions
%   4. sched: schedule types:'lin'/'exp'; Or a vector containing the
%   system temperature at each time;
%   5. beta0: initial inverse temperature. Default value: 0.1
%   6. beta1: initial inverse temperature. Default value: 3.0
%   7. rep0: Starting repetition. Default value 0
switch nargin
    case 4
        beta0=0.1;
        beta1=3.0;
        rep0=0;
    case 5
        beta1=3.0;
        rep0=0;
    case 6
        rep0=0;
end
    
if beta0<0 || beta1<0
    error('Temperature must be positive')
end

if nsweeps<1 || ~isscalar(nsweeps)
    error('Number of sweeps must be a scaler which is greater than or equal to 1')
end

if rep0<0 || ~isscalar(rep0)
    error('Starting repetition must be a scaler which is greater than or equal to 0')
end

if reps<1 || ~isscalar(reps)
    error('Number of repetitions must be a scaler which is greater than or equal to 1')
end

schedule=sched(schedType,nsweeps,beta0,beta1);
[energy,spinConfig]=SimulatedAnnealing([reps,rep0],schedule,lattice);
sortedSpin=Rearrange(spinConfig, lattice);

end