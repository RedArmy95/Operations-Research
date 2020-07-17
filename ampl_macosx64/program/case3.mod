param N; # number of customers
param M; # number of facilities

param Distance{i in 1..N, j in 1..M}; # the distance
param Service{i in 1..N}; # the services requested by customer i per year
param Space{j in 1..M}; # the space of facility j
param Factory{j in 1..M}; # company j's cost

var f{j in 1..M} binary;# company j open or not
var e{j in 1..M} integer;
var y{i in 1..N, j in 1..M} binary; 

minimize cost:
	sum{i in 1..N, j in 1..M} Service[i] * y[i, j] * Distance[i, j] * 2 * 6 + sum{j in 1..M} Factory[j] * f[j];

subject to assignment{i in 1..N}:
	sum{j in 1..M} y[i, j] = 1;

subject to noAssignToEmpty{i in 1..N, j in 1..M}:
	y[i, j] <= f[j];

subject to serviceLevel{i in 1..N, j in 1..M}:
	y[i, j] * Distance[i, j] <= 90;

subject to spaceRestriction{j in 1..M}:
	e[j] * 20.5 <= Space[j];

subject to noEngineerInEmpty{j in 1..M}:
	e[j] <= f[j] * 1000 ;

#subject to noEngineerInEmpty{j in 1..M}: #OPOC ver.
#	e[j] <= f[j] * 1000 + 1 ;

subject to servicesPerYear{j in 1..M}:
	sum{i in 1..N} y[i, j] * Service[i] <= e[j] * 1600;

subject to nonnegE{j in 1..M}:
	e[j] >= 0;



#subject to nangang:
#	f[1] = 1;

#subject to tainan:
#	f[9] - f[10] <= 0;

#subject to yilan:
#	f[4] + f[5] + f[12] >= 2;