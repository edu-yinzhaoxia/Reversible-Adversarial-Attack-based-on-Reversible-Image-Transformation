function y=lsb(x,num,deepth)


if x~=0
                   if deepth==1
                    if num==0;
                    y=sign(x)*(bitand(x,254));
                    return
                    end
                 if num==1;
                y=sign(x)*(bitor(x,1));
                return
                 end
                     end
        
             if deepth==2
               if num==0;
                y=sign(x)*(bitand(x,253));return
                end
                 if num==1;
                y=sign(x)*(bitor(x,2));return
                 end
             end
        
        if deepth==3
            if num==0;
                y=sign(x)*(bitand(x,251));return
                end
                 if num==1;
                y=sign(x)*(bitor(x,4));return
                 end
        end
        
        if deepth==4
               if num==0;
                y=sign(x)*(bitand(x,247));return
                end
                 if num==1;
                y=sign(x)*(bitor(x,8));return
                 end
        end
        
        if deepth==5
            if num==0;
                y=sign(x)*(bitand(x,239));return
                end
                 if num==1;
                y=sign(x)*(bitor(x,16));return
                 end
        end
        
        if deepth==6
                if num==0;
                y=sign(x)*(bitand(x,223));
                end
                 if num==1;
                y=sign(x)*(bitor(x,32));
                 end
        end
       
         if deepth==7
                if num==0;
                y=sign(x)*(bitand(x,191));
                end
                 if num==1;
                y=sign(x)*(bitor(x,64));
                 end
        end
   

else
    y=num*2^(deepth-1);
end

