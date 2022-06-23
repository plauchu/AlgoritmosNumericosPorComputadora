function [root, iter] = muller(f, x1, x2, x3)
MAX_ITER = 52;
TOL = sqrt(eps);

f1 = f(x1);
f2 = f(x2);
f3 = f(x3);

iter = 0;
cond = true;

while cond
    P2 = polyfit([x1, x2, x3], [f1, f2, f3], 2);
    r = roots(P2);
    
    if abs(x3 - r(1)) < abs(x3 - r(2))
        xr = r(1);
    else
        xr = r(2);
    end
    
    x1 = x2;
    x2 = x3;
    x3 = xr;
    f1 = f2;
    f2 = f3;
    f3 = f(xr);
    
    iter = iter + 1;
    cond = abs((x3 - x2) / x3) >= TOL && iter < MAX_ITER;
end

root = xr;

end
