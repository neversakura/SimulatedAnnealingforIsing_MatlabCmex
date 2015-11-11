/******************************************************************************

Simulated annealing codes
v1.0
---------------------------------------------------------------------

Copyright (C) 2012-2013 by Sergei Isakov <isakov@itp.phys.ethz.ch>

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

*******************************************************************************/

#ifndef __SCHED_H__
#define __SCHED_H__

#include <cmath>
#include <string>
#include <vector>
#include <algorithm>

struct sched_entry {
	double beta;
};

inline std::vector<sched_entry> get_sched(const mxArray *schedin)
{
    std::size_t dim;
    double *schedout;
	std::vector<sched_entry> sched;
	dim=std::max(mxGetN(schedin),mxGetM(schedin));
	schedout=mxGetPr(schedin);
	sched.resize(dim);
	for (std::size_t i = 0; i < dim; ++i)
		sched[i].beta=schedout[i];
	return sched;
}
#endif
