function y=juanjicaiyang(x)
%��ʼ����˾���
k_1=ones(3,3);
[m,n]=size(x);
x=double(x);
y=zeros(m/3,n/3);%����ԭͼ���ܱ�3����������ѡ��������Ե��������
%�Բ���Ϊ4�ľ���4*4�ľ���˽����²���
for i=1:m/3
    for j=1:n/3
        y(i,j)=mean(mean(k_1.*x(3*i-2:3*i,3*j-2:3*j),1),2);
    end
end
%��doubleת��Ϊͼ���uint8��ʽ
y=uint8(y);
end