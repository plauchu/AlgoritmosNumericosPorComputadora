# Simpson's 1/3 Rule

Numerical evaluation of the integral (`Q`) of `f(x) dx` from `a` to `b` typically begins with dividing the interval `(a, b)` into `N` uniformly or nonuniformly spaced subintervals defined by the points `(x`<sub>`i`</sub>`, x`<sub>`i+1`</sub>`)`, `i = 1, ..., N+1`. The integral over these smaller subintervals (`Q`<sub>`i`</sub>) of `f(x) dx` from `x`<sub>`i`</sub> to `x`<sub>`i+1`</sub> is then approximated by evaluating `f` at a small number of *uniformly* or *nonuniformly* spaced node points within the subinterval, fitting a polynomial to these points, and then integrating the polynomial to produce a quadrature rule of the general form:

![quadrature-rule](../images/quadrature-rule.jpg)

Here:

+ `H`<sub>`i`</sub>`= (x`<sub>`i+1`</sub>`- x`<sub>`i`</sub>`) / 2` is the half-width of the `i`<sup>`th`</sup>-subinterval
+ `n` is the number of node points
+ `w`<sub>`j`</sub> are the weights
+ `x`<sub>`i,j`</sub> are the node points for the `i`<sup>`th`</sup>-subinterval

Summing `Q`<sub>`i`</sub> over all subintervals yields the numerical approximation of the integral `Q`. A popular quadrature method of this form is [Simpson's 1/3 rule](https://en.wikipedia.org/wiki/Simpson%27s_rule). Here, three uniformly spaced node points are used; the endpoints and the midpoint of the subinterval. The quadrature rule is: 

![summation](../images/simpsons.jpg)

where `x`<sub>`i+1/2`</sub> is the midpoint of the subinterval. Note that for this rule, the halfwidth of the subinterval is also the spacing between the node points within the subinterval.

Write a function that implements Simpson's 1/3 rule using uniformly spaced subintervals **without using a loop**. Your function should accept 4 inputs:

+ 

```matlab
function Q = quadSimp(fun,a,b,n)
    % Obtain the node locations.
    x = linspace(a, b, n);
    h = (x(2) - x(1)) / 2;
    xm = x(1:n-1) + h;
    % Evaluate the function at the nodes.
    f = fun(x);
    fm = fun(xm);
    % Evaluate the integral by summing according to the formula given in the problem description.
    Q = h * sum(f(1:end-1) + 4 .* fm(1:end) + f(2:end)) / 3;
end
```