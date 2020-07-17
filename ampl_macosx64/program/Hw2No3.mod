param J;

param Dist{i in 1..J, j in 1..J};
param Popu{i in 1..J};

var x{j in 1..J} binary; 
var y{i in 1..J, j in 1..J} binary;
var w;

minimize MaxPopulationWeightedFirefightingTime: 
	w ;

subject to a{i in 1..J}: # constraint indices
w >= sum{j in 1..J} Dist[i, j] * y[i, j] * Popu[i];

subject to b{i in 1..J}: # constraint indices
sum{j in 1..J} y[i, j] = 1;

subject to c: # constraint indices
sum{j in 1..J} x[j] = 2;

subject to d{i in 1..J, j in 1..J}: # constraint indices
y[i, j] <= x[j];

subject to nonnegY{i in 1..J, j in 1..J}:
y[i, j] >= 0;


#The following constraints is for (b)


subject to e:
x[2] + x[3] + x[4] >= 1;

subject to f:
(1-x[5]) >= x[6];

subject to g:
x[1] + x[3] + x[6] + x[8] <= 1;