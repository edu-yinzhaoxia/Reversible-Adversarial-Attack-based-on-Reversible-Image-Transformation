function[class,cls_L]=classify_s_ave(mens)
sr=zeros(size(mens));

[mens,sr]=sort(mens);
vector_L=length(sr);
cls_L=zeros(1,32);
class_length=round(vector_L/32);
class=zeros(32,round(vector_L/32)+100);
all=0;
for i=1:31
  th=class_length*i;
  begin=th;
  while(begin<vector_L&&mens(begin+1)==mens(th))     
        begin=begin+1;           
  end
  cls_L(i)=begin-all;
  all=all+cls_L(i);
end
 cls_L(32)=vector_L-all; 
 all=0;
 
for i=1:32
 temp=sr(all+1:all+cls_L(i));
 temp=sort(temp);
 class(i,1:cls_L(i))=temp;
 all=all+cls_L(i);
end