function mse=appraise( img1,img2 )
%APPRAISE Summary of this function goes here
%   Detailed explanation goes here
img1=double(img1);
img2=double(img2);
L=length(img1(:));
mse = sum(sum(sum((img1-img2).^2)))/L;
mse=sqrt(mse);


