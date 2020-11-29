%%主脚本（主函数）
%图像读取
x1=imread('train_hr_img01.jpg');
imshow(x1);
title('HR图像');
ycbcr_x1=rgb2ycbcr(x1);
ycbcr_x11=ycbcr_x1(:,:,1);
ycbcr_x12=ycbcr_x1(:,:,2);
ycbcr_x13=ycbcr_x1(:,:,3);
ycbcr_x11=inint(ycbcr_x11);
ycbcr_x12=inint(ycbcr_x12);
ycbcr_x13=inint(ycbcr_x13);
%画出其亮度图像
figure,imshow(ycbcr_x11);
title('HR的亮度图像');
%% ---------------------------------------------------------------------
%卷积平均下采样
ycbcr_y11=juanjicaiyang(ycbcr_x11);
ycbcr_y12=juanjicaiyang(ycbcr_x12);
ycbcr_y13=juanjicaiyang(ycbcr_x13);
[m,n]=size(ycbcr_y11);
ycbcr_y1=zeros(m,n,3);
ycbcr_y1(:,:,1)=ycbcr_y11;
ycbcr_y1(:,:,2)=ycbcr_y12;
ycbcr_y1(:,:,3)=ycbcr_y13;
%将YCBCR转化为RGB图像
y1=rgb_ycbcr(ycbcr_y1);
%% ---------------------------------------------------------------------
%%构建训练
%双立方插值
ycbcr_x21=cub(ycbcr_y11);
ycbcr_x22=cub(ycbcr_y12);
ycbcr_x23=cub(ycbcr_y13);
[m,n]=size(ycbcr_x21);
ycbcr_x2=zeros(m,n,3);
ycbcr_x2(:,:,1)=ycbcr_x21;
ycbcr_x2(:,:,2)=ycbcr_x22;
ycbcr_x2(:,:,3)=ycbcr_x23;
figure,imshow(uint8(ycbcr_x21));
title('插值后HR的亮度图像');
%将YCBCR转化为RGB图像
x2=rgb_ycbcr(ycbcr_x2);
figure,imshow(x2);
title('插值后HR的rgb图像');
%% ---------------------------------------------------------------------
%%构造线性学习函数并画出学习后图像
ycbcr_t=learn(ycbcr_x11,ycbcr_x21);
ycbcr_t=uint8(ycbcr_t);
figure,imshow(ycbcr_t);
ycbcr_x2(:,:,1)=ycbcr_t;
title('学习后HR的亮度图像');
x2=rgb_ycbcr(ycbcr_x2);
figure,imshow(x2);
title('学习后HR的rgb图像');
%% ------------------------------------------------------------------------------
%%计算误差
[m,n]=size(ycbcr_t);
ycbcr_x11=double(ycbcr_x11);
ycbcr_t=double(ycbcr_t);
B=8;                %编码一个像素用多少二进制位
MAX=2^B-1;          %图像有多少灰度级
MES=sum(sum((ycbcr_x11-ycbcr_t).^2))/(m*n);     %均方差
PSNR=20*log10(MAX/sqrt(MES))



