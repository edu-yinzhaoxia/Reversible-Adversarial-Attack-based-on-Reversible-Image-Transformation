clear all;   clc

I=imread('mosaic.png');   
s=imread('bus.png');
[m,n]=size(I(:,:,1));
C=[I(:,:,1) I(:,:,2) I(:,:,3)];
% for i=1:3
 res=Sachnev(C,0.78);
% end

res=reshape(res,m,n,3);
res=uint8(res);
appraise(res,s)
 imwrite(res,'embeded1.png');