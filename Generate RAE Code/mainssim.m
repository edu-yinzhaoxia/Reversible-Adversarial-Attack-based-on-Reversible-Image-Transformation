
clear;
clc
block=8;
    img=imread('best.jpg');
    imgn=imread('test8.jpg');
    img=double(img);
        imgn=double(imgn);
    [m,n]=size(img(:,:,1));
    m=m/8;
    n=n/8;
    L=length(img(:))/64;
    tmp=zeros(1,L);
    num=0;
    for k=1:3
    for i=1:m
       for j=1:n
           num=num+1;
          tmp(num)= SSIM(img((i-1)*block+1:block*i,(j-1)*block+1:block*j),imgn((i-1)*block+1:block*i,(j-1)*block+1:block*j));        
       end    
    end
    end
    MSSIM=mean(tmp)

   