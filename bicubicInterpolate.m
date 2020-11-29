function re=bicubicInterpolate(p,x,y)
    arr=zeros(4,1);
    for i=1:4
        arr(i)=cubicInterpolate(p(i,1:4),x);
    end
    re= cubicInterpolate(arr,y);
end
