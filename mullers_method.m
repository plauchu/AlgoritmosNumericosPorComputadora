% Updated on 11/01/2022
% Mullers method for solving a polynomial
% Niranjan S P

% initial approximations
x = [3.1 3.2 3.3];

% absolute error tolerance
ea = 0.5;

% call the function
[xsol, z]=mullers(x,ea);

% display result
disp("The solution is") 
disp(xsol)

function f = equation(x)  % for calculating functional value
m = x;
v = 9;
t = 2;
c = 3;
g = 9.8;
f = (g.*m/c).*(1-exp((-c./m)*t))-v;
end

function [y,z] = mullers(x,ea) % implementing mullers method
x = x;
i=1;
z = [];
while (true)

     h0 = x(i+1) - x(i+0);
     h1 = x(i+2) - x(i+1);

     d0 = (equation(x(i+1)) - equation(x(i+0)))/ h0;
     d1 = (equation(x(i+2)) - equation(x(i+1)))/ h1;

     a = (d1 - d0) / (h1+h0);
     b = a*h1 + d1;
     c = equation(x(i+1));


     if b>0
        k = b + sqrt(b^2 - 4*a*c);
     else
        k = b - sqrt(b^2 - 4*a*c);
     end
     z(i) = k;
     p = (-2*c)/k;
     x(i+3) = x(i+2) + p;
       
     % error tolerance 
     ex = (abs(x(i+3)-x(i+2))/x(i+3))*100;

     if ex<=ea || equation(x(i+3)) == 0
         y = x(i+3);
         return
     end

     i=i+1;

end

end
