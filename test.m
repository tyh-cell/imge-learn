%%���ű�����������
%ͼ���ȡ
x1=imread('train_hr_img01.jpg');
imshow(x1);
title('HRͼ��');
ycbcr_x1=rgb2ycbcr(x1);
ycbcr_x11=ycbcr_x1(:,:,1);
ycbcr_x12=ycbcr_x1(:,:,2);
ycbcr_x13=ycbcr_x1(:,:,3);
ycbcr_x11=inint(ycbcr_x11);
ycbcr_x12=inint(ycbcr_x12);
ycbcr_x13=inint(ycbcr_x13);
%����������ͼ��
figure,imshow(ycbcr_x11);
title('HR������ͼ��');
%% ---------------------------------------------------------------------
%���ƽ���²���
ycbcr_y11=juanjicaiyang(ycbcr_x11);
ycbcr_y12=juanjicaiyang(ycbcr_x12);
ycbcr_y13=juanjicaiyang(ycbcr_x13);
[m,n]=size(ycbcr_y11);
ycbcr_y1=zeros(m,n,3);
ycbcr_y1(:,:,1)=ycbcr_y11;
ycbcr_y1(:,:,2)=ycbcr_y12;
ycbcr_y1(:,:,3)=ycbcr_y13;
%��YCBCRת��ΪRGBͼ��
y1=rgb_ycbcr(ycbcr_y1);
%% ---------------------------------------------------------------------
%%����ѵ��
%˫������ֵ
ycbcr_x21=cub(ycbcr_y11);
ycbcr_x22=cub(ycbcr_y12);
ycbcr_x23=cub(ycbcr_y13);
[m,n]=size(ycbcr_x21);
ycbcr_x2=zeros(m,n,3);
ycbcr_x2(:,:,1)=ycbcr_x21;
ycbcr_x2(:,:,2)=ycbcr_x22;
ycbcr_x2(:,:,3)=ycbcr_x23;
figure,imshow(uint8(ycbcr_x21));
title('��ֵ��HR������ͼ��');
%��YCBCRת��ΪRGBͼ��
x2=rgb_ycbcr(ycbcr_x2);
figure,imshow(x2);
title('��ֵ��HR��rgbͼ��');
%% ---------------------------------------------------------------------
%%��������ѧϰ����������ѧϰ��ͼ��
ycbcr_t=learn(ycbcr_x11,ycbcr_x21);
ycbcr_t=uint8(ycbcr_t);
figure,imshow(ycbcr_t);
ycbcr_x2(:,:,1)=ycbcr_t;
title('ѧϰ��HR������ͼ��');
x2=rgb_ycbcr(ycbcr_x2);
figure,imshow(x2);
title('ѧϰ��HR��rgbͼ��');
%% ------------------------------------------------------------------------------
%%�������
[m,n]=size(ycbcr_t);
ycbcr_x11=double(ycbcr_x11);
ycbcr_t=double(ycbcr_t);
B=8;                %����һ�������ö��ٶ�����λ
MAX=2^B-1;          %ͼ���ж��ٻҶȼ�
MES=sum(sum((ycbcr_x11-ycbcr_t).^2))/(m*n);     %������
PSNR=20*log10(MAX/sqrt(MES))



