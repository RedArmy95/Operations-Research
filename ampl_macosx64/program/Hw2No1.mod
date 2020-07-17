var x{i in 1..7};


maximize profit: 7 * x[1] + 4 * x[2] + 1 * x[3] + 3 * x[4] + x[5] + 2 * x[6] + 5 * x[7];

subject to a :
8 * x[1] + 6 * x[2] + 3 * x[3] + 4 * x[4] + 2 * x[5] + 7 * x[6] + 7 * x[7] <= 20;

subject to nonnegX{i in 1..7}:
x[i] >= 0;

subject to X{i in 1..7}:
x[i] <= 1;
