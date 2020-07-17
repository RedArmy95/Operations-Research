param N; # number of customers
param M; # number of facilities

param Distance{i in 1..N, j in 1..M}; # the distance
param Service{i in 1..N}; # the services requested by customer i per year
param Space{j in 1..M}; # the space of facility j
param Factory{j in 1..M}; # company j open or not

var e{j in 1..M} integer;
var y{i in 1..N, j in 1..M} binary; 

minimize cost:
	sum{i in 1..N, j in 1..M} Service[i] * y[i, j] * Distance[i, j] * 2 * 6;

subject to assignment{i in 1..N}:
	sum{j in 1..M} y[i, j] * Factory[j] = 1;

subject to serviceLevel{i in 1..N, j in 1..M}:
	y[i, j] * Distance[i, j] <= 90;

subject to spaceRestriction{j in 1..M}:
	e[j] * 20.5 <= Space[j];

subject to servicesPerYear{j in 1..M}:
	sum{i in 1..N} y[i, j] * Service[i] <= e[j] * 1600;

subject to nonnegE{j in 1..M}:
	e[j] >= 0;