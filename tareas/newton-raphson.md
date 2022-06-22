# The Newton-Raphson Method

The [Newton-Raphson method](https://en.wikipedia.org/wiki/Newton%27s_method) can be used to solve the root finding problem `f(x) = 0`. This is an open method, so it starts with a single initial estimate for the root. Given a current estimate for the root, `x`<sub>`i`</sub>. Thus, the Newton-Raphson formula for the next estimate of the root is given by the root of the tangent line:

![root of the tangent line](../images/tangent_NR.jpg)

This iteration process repeats until the root is found to within a given tolerance. However, because this is an open method, the iteration is not guaranteed to converge.

Write a function `rfNewtonR` that implements the Newton-Raphson method. Your function should accept the following inputs:

+ `fun` = a handle to a MATLAB function of the form `[y,dydx] = fun(x)` that returns `f(x)` and `f'(x)` as the first and second outputs respectively.

+ `x0` = initial guess for the root.

+ `TolX` = desired relatuve error for the root given by `abs((x`<sub>`i+1`</sub>`-x`<sub>`i`</sub>`)/x`<sub>`i`</sub>`)`.

+ `itmax` = maximum number of iterations.

Your function should return the following output:

+ `x` =  computed root estimate.

Your solution should not do the following:

1. Implement the Newton Raphson method to find a root of `f(x) = 0` and print the iteration history. <u>Do not use the MATLAB solver functions like `fzero`, `solve`, `roots`, etc.</u>..

2. Terminate the search when the relative error tolerance is reached or when the iteration limit is reached (whichever occurs first).

3. Use the MATLAB function `error` with a `msgID` to detect if the iteration does not converge before the iteration limit is reached: `msgID = 'rfNewtonR:IterationLimitExceeded'`.

```matlab
function x = rfNewtonR(fun,x,TolX,itmax)
% Find the root of f(x) = 0 using the Newton-Raphson method. 
    i = 0;
    flag = true;
    
    while flag
        xp = x;
        [fxp, dfxp] = fun(xp);
        x = xp - fxp / dfxp;
        i = i + 1;
        
        if i >= itmax
            error('rfNewtonR:IterationLimitExceeded',...
                'Iteration does not converge within the iteration limit.')
        end
        
        flag = i < itmax && abs((x - xp) / x) > TolX;
    end
end
```