clc
clear
file_path = 'C:\Users\mayn\Desktop\RIT-RAE\colorRDH\code\adv8_IFGSM_Inception-v3\';% 图像文件夹路径 ?
img_path_list = dir(strcat(file_path,'*.png'));%获取该文件夹中所有bmp格式的图像 ?
img_num = length(img_path_list);%获取图像总数量?
fprintf('%d\n',img_num);
I=cell(1,img_num);
for j = 140:img_num  %有满足条件的图像 ?i = 1:nn
    OriginalIimageName = img_path_list(j).name;% 图像名 ?
    OriginalPath = fullfile('C:','Users','mayn','Desktop','RIT-RAE','colorRDH', 'code','1-2-Ori_IFGSM_Inception-v3', OriginalIimageName);
%     fprintf('%s\n',OriginalIimageName);
%     imageName=strcat('JPEG_image\',OriginalIimageName,'.jpg');
    TargetPath = fullfile('C:', 'Users','mayn','Desktop','RIT-RAE','colorRDH', 'code','adv8_IFGSM_Inception-v3',OriginalIimageName);
    m=main(OriginalPath,TargetPath);
    str0 = 'C:\Users\mayn\Desktop\RIT-RAE\colorRDH\code\1-7-RAE-adv8_IFGSM_Inception-v3\';
    str1 = OriginalIimageName;
    save_path=[str0,str1];
    imwrite(m,save_path);
    fprintf('j=%d\n',j);
end
 
