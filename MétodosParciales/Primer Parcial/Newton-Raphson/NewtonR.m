function x = NewtonR(f,x)

itMAX=520;
TOL=eps;
flag=true;

fs=sym(f);
dfs=diff(fs);
df=matlabFunction(dfs);

i=0;
while flag
    fx=f(x);
    dfx=df(x);
    dx= - fx/dfx;
    
    x= x + dx;
 
    flag=abs(dx/x)>TOL&&i<itMAX;
    i=i+1;
end


end