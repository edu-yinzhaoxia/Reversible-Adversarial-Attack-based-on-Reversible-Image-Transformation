%%保证不同类没有重复元素才行!!
function [class]=classfy_c(sb,cls_L,KM)
% sr=zeros(size(sb));

[~,sr]=sort(sb);
vector_L=length(sr);
 class=zeros(KM,vector_L);
 all=0;
 for i=1:KM
 temp=sr(all+1:all+cls_L(i));
 temp=sort(temp);
 class(i,1:cls_L(i))=temp;
 all=all+cls_L(i);
 end
 

