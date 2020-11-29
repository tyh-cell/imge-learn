
function y=rgb_ycbcr(ycbcr_y)%YCBCR转为RGB图像
%提取原Y,CB,CR通道
ycbcr_y11=ycbcr_y(:,:,1);
ycbcr_y12=ycbcr_y(:,:,2);
ycbcr_y13=ycbcr_y(:,:,3);
[m,n]=size(ycbcr_y11);
y1=uint8(zeros(m,n,3));
%Ycbcr->rgb各个通道转化的公式
y1(:,:,1) = 1.164*(ycbcr_y11-16)+1.793*(ycbcr_y13-128);
y1(:,:,2) = 1.164*(ycbcr_y11-16)-0.534*(ycbcr_y13-128)-0.213*(ycbcr_y12-128);
y1(:,:,3) =1.164*(ycbcr_y11-16)+2.115*(ycbcr_y12-128);
%画出转化后的RGB图像
%figure,imshow(y1);
y=y1;
end

