% 说明：
% 溢出修改：对在抑制后仍有溢出的图像块的记录放到了shift函数里，用redu来保存了
% mean_matrix就是转换后图像的均值类矩阵
function [transformed_rmse,stego_rmse,res,bpp,smo_num]=transform(ss,cc,DT,Block)
% clear;clc
% close all
% addpath images\;
% ss=imread('twoman.png');
% cc=imread('bus.png');
%% add RDH path

addpath arith_encoder\;

ss=double(ss);
cc=double(cc);
sc=cc;

Bw=Block.w;Bh=Block.h;
[row,col,dim]=size(ss);
% mean_matrix就是转换后图像的均值类矩阵
mod=[];
overflow=[];
m=floor(row/Bw);
n=floor(col/Bh);
mean_matrix=zeros(m,n,dim);
rot_vector=zeros(3,m*n);
tag_vector=zeros(1,m*n);
%% transformation for RGB
smo_num=0;
[sc(:,:,2),mean_matrix(:,:,2),rot_vector(2,:),tag_vector,class_s_g,class_c_g,cls_L_g,modification,redu,smo]=shift(ss(:,:,2),cc(:,:,2),DT,Block);%%修改shift-----------------
mod=[mod modification];
overflow=[overflow redu];
smo_num=smo_num+smo;
for i=[1 3]
    %[sc(:,:,i),mean_matrix(:,:,2),rot_vector(2,:),tag_vector,class_s_g,class_c_g,cls_L_g,modification,redu]=shift(ss(:,:,i),cc(:,:,i),DT,Block);%%分别聚类
    [sc(:,:,i),mean_matrix(:,:,i),rot_vector(i,:),~,modification,redu,smo]=shift_RB(ss(:,:,i),cc(:,:,i),class_s_g,class_c_g,cls_L_g,DT,Block);%%修改shift-----------------
    mod=[mod modification];
    overflow=[overflow;redu];
    smo_num=smo_num+smo;
end
transformed_rmse = appraise(sc,cc)


% save rot rot_vector;save tag tag_vector;save overflow overflow; save mod mod; 
save mean_matrix mean_matrix;

%% RGB

%% mod_inf
flow_inf=compressfun(overflow);
mod_inf=compressfun(mod);
%% rotate information
% err_per_rot1=retotate(ss(:,:,1));

% err_per_rot3=retotate(ss(:,:,3));

% no_rot_id=find(rot_vector(2,:)==-10);
% L_rot=length(no_rot_id);
% % err_rot_L=err_per_rot1*L_rot+err_per_rot2*L_rot+err_per_rot3*L_rot;
% err_rot_L=round(err_per_rot2*L_rot*0.5);

rot_vector1=rot_vector(1,:);
rot_vector2=rot_vector(2,:);
rot_vector3=rot_vector(3,:);

rot_id=find(rot_vector(2,:)~=-10);




temp1=rot_vector1-rot_vector2;
index_temp1=find(temp1<0);
temp1(index_temp1)=temp1(index_temp1)+4;
rot_vector1=temp1;
rot_vector1=rot_vector1(rot_id);
rot_vector1(find(rot_vector1<0|rot_vector1>4))=0;

temp3=rot_vector3-rot_vector2;
index_temp3=find(temp3<0);
temp3(index_temp3)=temp3(index_temp3)+4;
rot_vector3=temp3;
rot_vector3=rot_vector3(rot_id);
rot_vector3(find(rot_vector3<0|rot_vector3>4))=0;

rot_vector2=rot_vector2(rot_id);
err_per_rot2=retotate(ss(:,:,2));

% hist(rot_vector1,min(rot_vector1):max(rot_vector1))
% figure
% hist(rot_vector2,min(rot_vector2):max(rot_vector2))
% figure
% hist(rot_vector3,min(rot_vector3):max(rot_vector3))

rot_R=compressfun(rot_vector1);
rot_G=round(0.5*compressfun(rot_vector2))+round(0.5*err_per_rot2*length(rot_id));
rot_B=compressfun(rot_vector3);

% figure
% hist(tag_vector(:),min(tag_vector(:)):max(tag_vector(:)))
tag_inf=compressfun(tag_vector(:));

%%%%%%%%%%% MSs information
L_MS=WLS(mean_matrix);
%% total additional information
L_mess=rot_R+rot_G+rot_B+tag_inf+mod_inf+flow_inf+L_MS;

bpp=L_mess/(m*n*3*Bw*Bh)

sc=uint8(sc);
imwrite(sc,'mosaic.png');%%created stego image before RDH
temp_image=[sc(:,:,1) sc(:,:,2) sc(:,:,3)];

%% RDH in two layers
addpath RDH\;
res=Sachnev(temp_image,0.7*bpp);
ree=uint8(res);
mse = appraise(ree(:),cc(:) )
res=Sachnev(res,0.3*bpp);
%%% *********
[m,n]=size(sc(:,:,1));
res=reshape(res,m,n,3);
res=uint8(res);
stego_rmse = appraise(res,cc )
imwrite(res,'Reversible Adversarial Example.png');%% final stego image