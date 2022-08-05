function class=classify_c_ave(menc,cls_L)
sr=zeros(size(menc));
[menc,sr]=sort(menc);
 all=0;
 for i=1:32
 temp=sr(all+1:all+cls_L(i));
 temp=sort(temp);
 class(i,1:cls_L(i))=temp;
 all=all+cls_L(i);
 end
