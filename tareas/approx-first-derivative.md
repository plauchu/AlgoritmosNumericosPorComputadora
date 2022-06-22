# The 5-Point Centered Difference Approximation to the First Derivative

The numerical derivative of a function `f(x)` at a value `x` is typically found using a linear combination of function values which is based on a given set of `x`-values known as a stencil. The stencil points are typically uniformly spaced about and include `x` (but not necessarily). The formula for the derivative is derived by various manipulations of the Taylor series of the function at the `x`-values in the stencil and is referred to as a *finite difference* formula. One class of finite difference formulas is based on a stencil of uniformly spaced -values that includes and is centered about a given point `x`. These are called *centered finite difference* formulas. The [five-point centered](https://en.wikipedia.org/wiki/Five-point_stencil) finite difference approximation for the first derivative of a function is given as:

![five-point-approx](../images/five-point-approx.jpg)

with discretization error

![discretization-error](../images/discret-error.jpg)

Here, `h` is the spacing of the `x`-values and `ξ` is an unknown point in the domain.

Write a function `firstDerCentered` that estimates the first derivative of a function using the five-point centered finite difference formula for uniformly spaced points given above. Your function should accept two inputs:

+ `f` = a vector of function values computed at uniformly spaced `x`-values

+ `h` = step size of the uniformly spaced `x`-values

and return one output:

+ `df` = the first derivative of `f`

Your function should compute the first derivative using the five-point centered finite difference formula above for the values in `f` and store the result in the variable `df`. Your solution should also satisfy the following requirements:

1. Make sure that the output vector `df` is the same size as the input vector `f` **and that the first two and the last two elements of `df` are `NaN`**.

2. Do not use a loop in your function.

3. Do not use the MATLAB functions `diff` or `gradient`.

## Function

```matlab
function  df = firstDerCentered(f,h)

    % Compute the 5 point centered finite difference vector df.
    % Make sure the first and last two values of df are NaN.
    df = nan(size(f));
    i = 3:length(f) - 2;
    df(i) = (f(i - 2) - 8 * f(i - 1) + 8 * f(i + 1) - f(i + 2)) / (12 * h);
end
```