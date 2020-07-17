param M;
param J;

param Processing{j in 1..J};
param Duetime{j in 1..J};
param Release{j in 1..J};

var Tardiness{j in 1..J} integer; 
var Completion{j in 1..J} integer; 
var z{i in 1..J, j in 1..J} binary;

minimize tardiness: # use "sum" for summation
	sum{j in 1..J} Tardiness[j] ;

subject to scheduling1{j in 1..J}: # constraint indices
Tardiness[j] >= Completion[j] - Duetime[j];

subject to scheduling2{j in 2..J, i in 1..j-1}: # constraint indices
Completion[i] + Processing[j] - Completion[j] <= M * z[i, j];

subject to scheduling3{j in 2..J, i in 1..j-1}: # constraint indices
Completion[j] + Processing[i] - Completion[i] <= M * (1-z[i, j]);

subject to scheduling4{j in 1..J}: # constraint indices
Completion[j] >= Processing[j];

subject to scheduling5{j in 1..J}: # constraint indices
Completion[j] - Processing[j] >= Release[j];

subject to nonnegT{j in 1..J}:
Tardiness[j] >= 0;
subject to nonnegC{j in 1..J}:
Completion[j] >= 0;