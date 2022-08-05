% 直接把图像的一个dimension传进来处理
function err_per_rot=retotate(before)
    x=2;y=3;
    [m, n]=size(before);
    sm=floor(m/x);sn=floor(n/y);
 
    err_rot_temp=zeros(1,sm*sn);
    id=0;
    for i=2:2:2*floor(sm/2)-2
        for j=3:3:3*floor(sn/3)-3
                t=before(x*(i-1):x*i+1,y*(j-1):y*j+1);
                a=t(2,2);b=t(2,3);c=t(2,4);d=t(3,2);e=t(3,3);f=t(3,4);
                x1=t(2,1);x2=t(3,1);x3=t(4,2);x4=t(4,3);x5=t(4,4);
                x6=t(3,5);x7=t(2,5);x8=t(1,4);x9=t(1,3);x10=t(1,2);
                
                smo0=abs(x1-a)+abs(x2-d)+abs(x3-d)+abs(x4-e)+abs(x5-f)+abs(x6-f)+abs(x7-c)+abs(x8-c)+abs(x9-b)+abs(x10-a);
                smo2=abs(x1-f)+abs(x2-c)+abs(x3-c)+abs(x4-b)+abs(x5-a)+abs(x6-a)+abs(x7-d)+abs(x8-d)+abs(x9-e)+abs(x10-f);
                smo1=abs(x1-d)+abs(x2-b)+abs(x3-b)+abs(x4-f)+abs(x5-c)+abs(x6-c)+abs(x7-e)+abs(x8-e)+abs(x9-a)+abs(x10-d);
                smo3=abs(x1-c)+abs(x2-e)+abs(x3-e)+abs(x4-a)+abs(x5-d)+abs(x6-d)+abs(x7-b)+abs(x8-b)+abs(x9-f)+abs(x10-c);
                smo=[smo0 smo1 smo2 smo3];
                min_smo=min(smo);
                rot=find(smo==min_smo)-1;
                id=id+1;
                err_rot_temp(id)=rot(1);
        end
    end
    
    err_rot=err_rot_temp(1:id);
    addpath arith_encoder\;
    err_per_rot=compressfun(err_rot)/length(err_rot);
end

