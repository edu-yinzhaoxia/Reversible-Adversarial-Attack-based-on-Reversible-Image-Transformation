clear;clc
close all
%%%%%%%%%% secret图嵌入target图 生成 stego图
secretName='flower.png';
targetName='girls.png';
tempName='temp.jp2';
% I=imread(secretName);
% imwrite(I,tempName);
I=imread(secretName);
imwrite(uint8(I),tempName,'jp2','Mode','lossless');

fid=fopen(tempName,'rb');
A=fread(fid,'ubit1');
fclose(fid);

L_A=length(A);
B=imread(targetName);
[l,m,n]=size(B);
LL=m*l*n;
stego=zeros(1,LL);
secret=zeros(1,L_A);
cover=B(:);

% fid2=fopen('bus2.png','wb');
% fwrite(fid2,A,'ubit1');
% fclose(fid2);

bpp=length(A)/(l*m*n)
deepth=1;
%%隐藏
j=1;
for i=1:L_A   
   cover(j)=lsb(cover(j),A(i),deepth);
   j=j+1;
    if(j>LL)
        j=1;
        deepth=deepth+1;
    end
end

stego=reshape(cover,l,m,n);
imwrite(uint8(stego),'stegot.png');
RMSE=appraise(stego,B)

%提取
%     sc=imread('stegot.png');
%     sc=sc(:);
%     j=1;
%     deepth=1;
%     for i=1:L_A   
% secret(i)=getlsb(sc(j),deepth);
% j=j+1;
%         if(j>LL)
%             j=1;
%             deepth=deepth+1;
%         end
%     end
%     
%     
%     fid2=fopen('secret.png','wb');
% fwrite(fid2,secret,'ubit1');
% fclose(fid2);
%     se=imread('secret.png');
%     cc=imread('flower.png');
%     sum((se(:)-cc(:)).^2)
%     
% % 
% % 
