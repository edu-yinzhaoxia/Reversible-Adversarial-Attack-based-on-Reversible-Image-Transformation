% clear;clc
% close all
% % addpath images\;
% % ss=imread('twoman.png');
% % cc=imread('bus.png');
% s=load('ss.mat');
% ss=s.C;
function mess_L=WLS(ss)

R=double(ss(:,:,1));
G=double(ss(:,:,2));
B=double(ss(:,:,3));
[ht,wd]=size(G);

%%%%%%%  对参考面G进行压缩
temp_dif_G=zeros(1,ht*wd);
temp_dif_GR=zeros(1,ht*wd);
temp_dif_GB=zeros(1,ht*wd);
id=0;
 for i=1:ht-4
        for j=1:1:wd-4
            XR=[];
            YR=[];
            XB=[];
            YB=[];
            XG=[];
            id=id+1;
            XG=[G(i+1,j),G(i,j+1),G(i+1,j+1)];%,G(i+2,j),G(i,j+2)];
            
           temp_dif_G(id)=G(i,j)-predict_G([G(i+1,j),G(i,j+1),G(i+1,j+1)]);
               
            XR=[R(i+1,j),R(i,j+1),R(i+1,j+1)];%,R(i+2,j),R(i,j+2)];
            temp_dif_GR(id)=R(i,j)-WLSpredictor(XG,XR,[1,1,0.5],G(i,j));
            
            XB=[B(i+1,j),B(i,j+1),B(i+1,j+1)];%B(i+2,j),B(i,j+2),
            temp_dif_GB(id)=B(i,j)-WLSpredictor(XG,XB,[1,1,0.5],G(i,j));
        end
 end
 
dif_GR=temp_dif_GR(1:id);
% compressfun(dif_GR)/id
dif_GB=temp_dif_GB(1:id);
% compressfun(dif_GB)/id
dif_G=temp_dif_G;
% compressfun(dif_G)/id

mess_dif_GR=compressfun(dif_GR)*length(G(:))/id;
mess_dif_GB=compressfun(dif_GB)*length(G(:))/id;
mess_dif_G=compressfun(dif_G)*length(G(:))/id;

% hist(dif_GR,-32:32)
% figure
% hist(dif_GB,-32:32)
% figure
% hist(dif_G,-32:32)
 mess_L=mess_dif_GR+mess_dif_G+mess_dif_GB;

end
% mess_dif_GR/length(G(:))
% mess_dif_GB/length(G(:))
% mess_dif_G/length(G(:))

% (mess_dif_GR+mess_dif_GB+mess_dif_G)/(3*length(G(:)))
%   hist(temp_dif_G,-32:32)
 
 
 
 
 
 
 
 
 
