A = [10,-7,0; -3,2,6; 5,-1,5];
b = [7,4,6];

LUsolucionP(A,b)

function x = LUsolucionP(A,b)
% A = [10,-7,0;-3,2,6;5,-1,5];
% b = [7,4,6];

    [m,n] = size(A);
    [L,U,P,s] = LUP(A);
    Pb = P*b;
    
    % Resolver Ly = Pb por substitución empezando arriba
    y = zeros(n,1);
    y(1) = Pb(1);
    for i=2:n
%         j=1:i-1;
        y(i) = Pb(i) - L(i,1:i-1)*y(1:i-1);
    end
    
    % Resolver Ux = y por  subsitución empezando abajo
    x= zeros(n,1);
    x(n)=y(n)/U(n,n);
    for i=n-1:-1:1
        j=i+1:n;
        x(i)= (y(i)-U(i,j)*x(j))/U(i,i); 
    end
end

