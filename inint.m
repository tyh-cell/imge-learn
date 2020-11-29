function x=inint(x)
[m,n]=size(x);
q=rem(m,3);
p=rem(m,3);
if q==2
    x=[x;x(m,:)];
    elseif q==1
            x=[x;x(m-1:m,:)];
end 
if p==2
    x=[x,x(:,n)];
    elseif p==1
            x=[x,x(:,n-1:n)];
end 
end
    


