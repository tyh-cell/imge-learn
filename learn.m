function ycbcr_t=learn(img_x,img_y)
%拉出训练数据
[m,n]=size(img_x);
train_y1=floor(m/3);
train_y2=floor(n/3);
train_xl=train_y1*train_y2;
train_x=zeros(9,train_xl);
k=1;

for i=1:train_y1
    for j=1:train_y2
        temp=img_x(3*i-2:3*i,3*j-2:3*j);
        temp=temp';
        train_x(:,k)=temp(:);%原始高分辨图像
        k=k+1;
    end
end

train_y=zeros(9,train_xl);
k=1;
for i=1:train_y1
    for j=1:train_y2
        temp=img_y(3*i-2:3*i,3*j-2:3*j);
        temp=temp';
        train_y(:,k)=temp(:);%带学习的高分辨插值的图像
        k=k+1;
    end
end
cout=floor(train_xl/10);
%设置拟合函数
train_xre=zeros(9,cout);
train_yre=zeros(9,cout);
%由于数据量太大，缩小数据量，等距10地采样
for i=1:cout
    train_xre(:,i)=train_x(:,i*10);
    train_yre(:,i)=train_y(:,i*10);
end
train_xre=train_xre(5,:);
%求解线性模型参数
train_y=train_y';
train_yre=train_yre';
train_xre=train_xre';
train_yre=[train_yre,ones(cout,1)];
w=(pinv(train_yre'*train_yre)*train_yre')*train_xre;
%将原插值得到的图像由学习的模型还原
train_yy=[train_y,ones(train_xl,1)];
re_y=w'*train_yy';
re_y=re_y';
train_y=train_y';
train_y(5,:)=re_y;

%将学习后的数据拉成图像
ycbcr_t=zeros(513,513);
for k=1:171
    for j=1:171
        h=0;
        for i=1:9
            ycbcr_t(ceil(i/3)+3*(k-1),3*j-2+h)=train_y(i,j);
            h=h+1;
            if h==3
               h=0;
            end
        end
    end
    if k==171
        break;
    end
    train_y(1:9,1:171)=train_y(1:9,171*k+1:171*(k+1));    
end
end

