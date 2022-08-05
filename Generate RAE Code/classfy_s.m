%%保证不同类没有重复元素才行!!
function [class,cls_L]=classfy_s(sb)
sr=zeros(size(sb));

[sb,sr]=sort(sb);
vector_L=length(sr);
cls_L=zeros(1,16);
class_length_1=vector_L*8/(16*2);
 class_length_2=floor(vector_L*7/(16*6));
 class_length_3=floor(vector_L/(16*8));
 
 class=zeros(16,vector_L/2+100);
 
 th=class_length_1;
 begin=th;
  while(sb(begin+1)==sb(th))     
        begin=begin+1;           
  end
    cls_L(1)=begin;
    
     th=class_length_1*2;
   begin=th;
  while(sb(begin+1)==sb(th))     
        begin=begin+1;           
  end
    cls_L(2)=begin-cls_L(1);
   all=cls_L(1)+cls_L(2); 
   
 for i=3:15
     if i<=8
         th=(i-2)*class_length_2+2*class_length_1;
       begin=th;
        while(sb(begin+1)==sb(th))
            begin=begin+1;    
        end
         cls_L(i)=begin-all;
         all=all+cls_L(i); 
     end
    
     if 8<i
      th=6*class_length_2+2*class_length_1+(i-8)*class_length_3;
       begin=th;
               
                while(sb(begin+1)==sb(th))
                    begin=begin+1;                    
                end
        cls_L(i)=begin-all;
         all=all+cls_L(i); 
     end
   
 end
 cls_L(16)=vector_L-all;
 
 all=0;
 for i=1:16
 
 temp=sr(all+1:all+cls_L(i));
 temp=sort(temp);
 class(i,1:cls_L(i))=temp;
 all=all+cls_L(i);
 end
 

