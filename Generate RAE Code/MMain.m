clear;
clc;
Block.w=1;
Block.h=1;
DT=6;
ss=imread('Original_Image.png');
cc=imread('Adversarial_Image.png');

ss=double(ss);
cc=double(cc);

[transformed_rmse,stego_rmse,sc,bpp,smo]=transform(ss,cc,DT,Block)

     

