param n;
param m;

param A{i in 1..m, j in 1..n};
param Price{j in 1..n};
param K{i in 1..m};

var x{j in 1..n}; 

maximize profit: 
	sum{j in 1..n} Price[j] * x[j] ;

subject to a{i in 1..m}: # constraint indices
sum{j in 1..n} A[i, j] * x[j] <= K[i];

subject to nonnegX{j in 1..n}:
x[j] >= 0;