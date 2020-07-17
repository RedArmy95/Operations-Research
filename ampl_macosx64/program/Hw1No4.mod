param N; # number of refineries
param M; # number of distribution points
param T;

param CapacityK{i in 1..N}; # the capacity vector
param CapacityD{j in 1..M}; # the capacity vector 2
param Price{i in 1..N, j in 1..M}; # the price matrix
param Cost{i in 1..N};

var x{i in 1..N, j in 1..M};
var y{i in 1..N};

maximize profit: # use "sum" for summation
	sum{i in 1..N, j in 1..M} Price[i, j] * x[i, j] * 10 -
	sum{i in 1..N} y[i] * Cost[i] * 10 / T ;

subject to productCapacityi{i in 1..N}: # constraint indices
sum{j in 1..M} x[i, j] <= CapacityK[i]+y[i];
subject to productCapacityj{j in 1..M}: # constraint indices
sum{i in 1..N} x[i, j] <= CapacityD[j];
subject to nonnegX{i in 1..N, j in 1..M}:
x[i, j] >= 0;
subject to nonnegY{i in 1..N}:
y[i] >= 0;