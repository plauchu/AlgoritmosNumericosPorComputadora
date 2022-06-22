# Backward Substitution

Consider the matrix problem `Ux = b`, where `U` is an upper triangular matrix and `b` is a column vector with the form:

![Ux = b](../images/backward_subs.jpg)

This problem can be solved using a simple algorithm called backward substitution. In this algorithm, `x`<sub>`n`</sub> is easily solved from the last equation in the matrix problem. This result is then substituted into the second to last equation, which is then explicitly solved for `x`<sub>`n-1`</sub>. This process is repeated until all values of `x` are found.

Complete the definition of the `backsub` function below by implementing the backward substitution algorithm. This function takes as input:

+ `U`, an `n x n` upper triangular matrix

+ `n`, an `n x 1` vector for the right-hand-side of the matrix equation

and returns as output:

+ `x`, an `n x 1` solution vector `x`

<u>Do not use backslash operator or other MATLAB solver functions to compute the output.</u>

```matlab
function x = backsub(U,b)

% Initialize the output vector.
n = length(b);
x = zeros(size(b));

% Do the backward substitution below.
while n > 0
    x(n) = b(n) / U(n, n);
    b(1:n-1) = b(1:n-1) - U(1:n-1, n) * x(n);
    n = n - 1;
end
```