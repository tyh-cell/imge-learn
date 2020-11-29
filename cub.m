function y=cub(img)
[m n]=size(img);
w=3;            %�Ŵ����С�Ŀ��(3��) �����²�������
h=3;            %�Ŵ����С�ĸ߶ȣ�3����
imgn=zeros(h*m,w*n);
rot=[h 0 0;0 w 0;0 0 1];                                    %�任����x=h*u,y=w*v

for i=1:h*m
    for j=1:w*n
        pix=[i j 1]/rot;   
        float_Y=pix(1)-floor(pix(1)); 
        float_X=pix(2)-floor(pix(2));

        if pix(1) < 2               %�߽紦��,Ҳ�����þ��ʱ���õı߽���չ��ֹԽ��
            pix(1) = 2;
        end

        if pix(1) > m-2
            pix(1) = m-2;
        end

        if pix(2) < 2
            pix(2) =2;
        end

        if pix(2) > n-2
            pix(2) =n-2;
        end

        pix_up=floor(pix(1));
        pix_left=floor(pix(2));
        
        p=img(pix_up-1:pix_up+2,pix_left-1:pix_left+2);

        imgn(i,j)=bicubicInterpolate(p,float_X+1,float_Y+1);       

    end
end
y=imgn;
end
    
