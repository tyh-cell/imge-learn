function y=juanjicaiyang(x)
%初始卷积核矩阵
k_1=ones(3,3);
[m,n]=size(x);
x=double(x);
y=zeros(m/3,n/3);%由于原图像不能被3除尽，我们选择舍弃边缘部分数据
%以步长为4的距离4*4的卷积核进行下采样
for i=1:m/3
    for j=1:n/3
        y(i,j)=mean(mean(k_1.*x(3*i-2:3*i,3*j-2:3*j),1),2);
    end
end
%将double转化为图像的uint8格式
y=uint8(y);
end