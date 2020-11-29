function re=cubicInterpolate(p,x)
    p=double(p);
%  双立方插值公式 
%  re=p(2) + 0.5 * x*(p(3) - p(1) + x*(2.0*p(1) - 5.0*p(2) + 4.0*p(3) - p(4) + x*(3.0*(p(2) - p(3)) + p(4) - p(1))));
    a=(p(4)-3*p(1)+3*p(2)-p(1))/10;
    b=(p(3)-2*p(2)+p(1))/2-2*a;
    c=p(2)-p(1)-a-b;
    d=p(1);
    re=a*x^3+b*x^2+c*x+d;

end

