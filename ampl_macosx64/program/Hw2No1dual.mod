var x{i in 1..8};


minimize profit: 20 * x[1] +  x[2] +x[3] + x[4] + x[5] +x[6] +x[7] +x[8];

subject to a :
8 * x[1] +  x[2] >= 7;

subject to b :
6* x[1] + x[3] >=4;

subject to c :
3*x[1]+x[4]>=1;

subject to d :
4*x[1]+x[5]>=3;

subject to e:
2*x[1]+x[6]>=1;

subject to f:
7*x[1]+x[7]>=2;

subject to g:
7*x[1]+x[8]>=5;

subject to nonnegX{i in 1..8}:
x[i] >= 0;


