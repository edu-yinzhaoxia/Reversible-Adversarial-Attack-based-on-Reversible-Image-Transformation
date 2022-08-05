clear all;   clc

I=imread('Peppers.bmp');   I =double(I);

bpp=zeros(1,26);
psnr=zeros(1,26);
pforbpp=0;

for Th=1:1:26
    Capacity = 1000+Th*1000;
    [b,p,embedded]=embedding(I,Capacity/512^2);
    [Th b p]
    if b>0
        pforbpp=pforbpp+1;
        bpp(pforbpp)=Capacity;
        psnr(pforbpp)=p;
    end
end
bpp=bpp(1:pforbpp);psnr=psnr(1:pforbpp);

plot(bpp,psnr,'-r.');

SachnevEC_Peppers = zeros(2,pforbpp);

SachnevEC_Peppers(1,:) = bpp;
SachnevEC_Peppers(2,:) = psnr;

save SachnevEC_Peppers.mat SachnevEC_Peppers