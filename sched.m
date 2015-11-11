function [ schedule ] = sched( type,nsweep,beta0,beta1)
%SCHED This function generates the annealing schedule for simulated
%annealing algorithm
%   The first input argument type should be a string, which is either "lin" or
%   "exp"; Or a vector containing the annealing schedule; The second and
%   third argument are the initial and finial temperature; The last
%   argument is the number of sweeps.
if ~isscalar(beta0) || ~isscalar(beta1)
    error('Temperature and number of sweeps must be a scalar')
end
if ischar(type)
    if strcmpi(type,'lin')
        schedule=linsched(beta0,beta1,nsweep);
    elseif strcmpi(type,'exp')
        schedule=expsched(beta0,beta1,nsweep);
    else
        error('The schdeuling type can only be lin or exp')
    end
elseif isvector(type)
    
else
    error('Scheduling type not valid')
end
end

%===========================================================

function out=linsched(beta0,beta1,nsweep)
    if nsweep==1
        out=beta0;
    else
        out=beta0:(beta1-beta0)/(nsweep-1):beta1;
    end
end
function out=expsched(beta0,beta1,nsweep)
    i=0:nsweep-1;
    out=beta0*(beta1/beta0).^(i/(nsweep-1));
end

