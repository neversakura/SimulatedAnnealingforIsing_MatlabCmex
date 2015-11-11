/********************************************************
 Simulated Annealing Code
 V0.1

 This program is an adaption of Sergei Isakov's optimized
 simulated annealing code for MATLAB c-mex

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
 ********************************************************/

#include <iostream>
#include <math.h>
#include "mex.h"
#include "matrix.h"
#include "sched.h"
#include "lattice.h"
#include "simalgorithm.h"
/********************
 * Right now, only single-spin code for general interactions with magnetic
 * field (any number of neighbors) is implemented
 ********************/

void mexFunction(
		 int          nlhs,
		 mxArray      *plhs[],
		 int          nrhs,
		 const mxArray *prhs[]
		 )
{
  typedef Algorithm<> alg_type;
  typedef alg_type::lattice_type lattice_type;
  unsigned nsweeps,nreps,rep0;
  double *config,*energy;
	double *spinConfig;
	std::size_t nqubit;
  // Parsing Input
  config=mxGetPr(prhs[0]);
  nreps=(unsigned) config[0];
  rep0=(unsigned) config[1];
  // Schedule
  std::vector<sched_entry> sched = get_sched(prhs[1]);
  nsweeps = sched.size();
  // Read Lattice
  lattice_type lattice(prhs[2]);
	nqubit=lattice.nqubit();
	plhs[1] = mxCreateDoubleMatrix(nqubit,nreps,mxREAL);
	spinConfig=mxGetPr(plhs[1]);
  // init annealing
  alg_type alg(lattice, sched);
  std::size_t offs = 0;
  typedef Algorithm<>::value_type value_type;
  std::vector<value_type> en(nreps * alg_type::word_size, 0);
  //Main Loop
  for (std::size_t rep = rep0; rep < nreps + rep0; ++rep) {
    alg.reset_sites(rep);
    for (std::size_t sweep = 0; sweep < nsweeps; ++sweep)
      alg.do_sweep(sweep);
		alg.get_config(spinConfig,offs*nqubit);
    offs = alg.get_energies(en, offs);

  }
  //Output Data
	plhs[0] = mxCreateDoubleMatrix(offs,1,mxREAL);
  energy = mxGetPr(plhs[0]);
  for (std::size_t i=0; i<offs; ++i)
    energy[i]=en[i];
}
