var x1;
var x2;
var x3;

maximize profit: x1 + 3 * x2 + 2 * x3;

subject to resource_1: x1 + x2 <= 3;
subject to resource_2: x1 + 2 * x2 + x3 >= 10;
subject to resource_3: x3 >= 2;
subject to nonneg_1: x1 >= 0;
subject to nonneg_2: x2 >= 0;
subject to nonneg_3: x3 >= 0;