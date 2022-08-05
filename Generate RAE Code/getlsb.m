function y=getlsb(x,num)
x=abs(x);
             if num==1
          y=bitand(x,1);
          y=(y>0);return
          
             elseif num==2
           y=bitand(x,2);
           y=(y>0);return
           
             elseif num==3
           y=bitand(x,4);
           y=(y>0);return
       
             elseif num==4
           y=bitand(x,8);
           y=(y>0);return
       
             elseif num==5
           y=bitand(x,16);
           y=(y>0);return
           
             elseif num==6
           y=bitand(x,32);
           y=(y>0);return
    
             else %%%% num==7
           y=bitand(x,64);
           y=(y>0);return
             end
            
end
          