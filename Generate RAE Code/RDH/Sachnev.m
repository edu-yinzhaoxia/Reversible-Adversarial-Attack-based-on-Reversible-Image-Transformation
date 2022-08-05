% clear all;   clc

%  I=imread('recover.png');   
%  I=I(:,:,2);
% 
 function res=Sachnev(I,mse)
I =double(I);


bpp=zeros(1,100);
psnr=zeros(1,100);
pforbpp=0;

for Th=mse
    [b,p,embedded]=embedding(I,Th);
    [Th b p]
    if b>0
        pforbpp=pforbpp+1;
        bpp(pforbpp)=b;
       % psnr(pforbpp)=p;
    end
end

res=embedded;


% imwrite(embedded,'embeded.png');
% bpp=bpp(1:pforbpp);psnr=psnr(1:pforbpp);
% 
% plot(bpp,psnr,'-r.');
% 
% Sachnev_House = zeros(2,pforbpp);
% 
% Sachnev_House(1,:) = bpp;
% Sachnev_House(2,:) = psnr;
% 
% save Sachnev_House.mat Sachnev_House