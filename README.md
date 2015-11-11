# SimulatedAnnealingforIsing_MatlabCmex

This is a MATLAB wrapper for the simulated annealing codes originally written by S.V. Isakov et al.

Copyright (C) 2012-2013 by Sergei Isakov <isakov@itp.phys.ethz.ch>
                           Ilia Zintchenko <zintchenko@itp.phys.ethz.ch>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

=====================================================================

Adapted by Huo Chen <huochen@usc.edu>

This is an adaption of the original C++ code for MATLAB. Currently it only support the Single-spin code for general interactions with magnetic field (any number of neighbors) algorithm.

--------------------------------------------------------------------
USAGE
--------------------------------------------------------------------
First, the SimulatedAnnealing.cpp file needs to be compiled in MATLAB. It can be compiled by 'mex SimulatedAnnealing.cpp' in Mac wiht Xcode 7 compiler, or with 'mex CXXFLAGS="-std=c++11" SimulatedAnnealing.cpp' in Windows with MinGW.

The SA.m is the MATLAB wrapper for SA codes, its input arguments are:
   1. lattice: The lattice matrix
   2. sweeps: Number of sweeps
   3. reps: Number of repetitions
   4. sched: schedule types:'lin'/'exp'; Or a vector containing the system temperature at each time;
   5. beta0: initial inverse temperature. Default value: 0.1
   6. beta1: initial inverse temperature. Default value: 3.0
   7. rep0: Starting repetition. Default value 0

The lattice matrix contains the ising spin configuration, which has a dimension of(N+M) by 3.
It contains N couplings and M local fields (not ordered). Each line
contains three values i, j and c. If i = j the line specifies a local
field on site i of size h_i = c. Otherwise, the line denotes a
coupling between spin i and j of value J_ij =c.
