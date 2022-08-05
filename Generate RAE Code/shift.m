%% shift transformation
function [b,MS_matrix,rot_vector,tag,class_s,class_c,cls_L,modification,redu,smo_num]=shift(s,c,DT,Block)
KM=6;
T=8;
Bw=Block.w;Bh=Block.h;
smo_num=0;
% T_num=1;
[sm,sn]=size(s);
b=double(zeros(sm,sn));

modification=[];
redu=[];

sm=floor(sm/Bw);
sn=floor(sn/Bh);
L=sm*sn;
rot_vector=zeros(1,L);
tag=zeros(1,L);
sb=zeros(1,L);
cb=zeros(1,L);
mens=zeros(1,L);
menc=zeros(1,L);

k=0;
MS_matrix=zeros(sm,sn);
for i=1:sm
    for j=1:sn    
        k=k+1;  
        ts=(s(Bw*(i-1)+1:Bw*i,Bh*(j-1)+1:Bh*j));
        tc=(c(Bw*(i-1)+1:Bw*i,Bh*(j-1)+1:Bh*j));
        mens(k)=mean(ts(:));
        menc(k)=mean(tc(:));
        sb(k)=std(ts(:),1);
        cb(k)=std(tc(:),1);
        MS_matrix(i,j)=round(mens(k)/8);
    end
end

class_s=zeros(KM,L/2);

[class_index,cls_L]=K_means(sb',KM);
for i=1:KM
    class_s(i,1:length(class_index{i}))=class_index{i};
end
class_c=classfy_c(cb,cls_L,KM);%% cluster for target image


k=0;
ind=0;


for i=1:KM
  for j=1:cls_L(i)
        
        k=k+1;
        keyc=class_c(i,j);
        kcr=floor((keyc-1)/sn);
        kcc=mod(keyc-1,sn);
        
        keys=class_s(i,j);
        ksr=floor((keys-1)/sn);
        ksc=mod(keys-1,sn);
        
        tag(keys)=i-1;
        tc=(c(Bw*kcr+1:Bw*(kcr+1),Bh*kcc+1:Bh*(kcc+1)));
        ts=(s(Bw*ksr+1:Bw*(ksr+1),Bh*ksc+1:Bh*(ksc+1)));
        
        th=round((menc(keyc)-mens(keys))/8)*8;
        t=ts+th;
        %% modification for mens to control overflow/underflow
                 if (max(t(:))>=255)
                     if((max(t(:))-255)>T)
                                temp=T;
                                th=th-T;
                           elseif ((max(t(:))-255)==T)
                                    temp=0;
                                    th=th-T;
                            else
                                    temp=max(t(:))-255;
                                    th=th-temp;
                     end
                     t=ts+th;
                                  if temp==T
                                     flow_ind=[];
                                     flow_ind=find(t>=255);
                                     flow_temp=t(flow_ind)-255;
                                     redu=[redu;flow_temp];  
                                   end
                    ind=ind+1;
                    modification(ind)=temp;

                 elseif (min(t(:))<=0)
                        if -min(t(:))>T
                                temp=T;
                                th=th+T;

                        elseif (-min(t(:))==T)
                                temp=0;
                                th=th+T;
                                else
                                 temp=-min(t(:));
                                 th=th+temp;
                        end
                        t=ts+th;
                                  if temp==T
                                flow_ind=[];
                                flow_ind=find(t<=0);
                                flow_temp=-t(flow_ind);
                                redu=[redu;flow_temp];  
                                   end
                    ind=ind+1;
                    modification(ind)=temp;    
                end
        
       
        %% find optimal direction
         rot=-10;
          if(std(t(:))<=DT)
            smo_num=smo_num+1;
          else
                t1=t;
                t1=double(t1);
                b1=sum(sum((t1-tc).^2));

                t2=rot90(t1,1);t2=reshape(t2,Bw,Bh);
                b2=sum(sum((t2-tc).^2));

                t3=rot90(t1,2);
                b3=sum(sum((t3-tc).^2));

                t4=rot90(t1,3);t4=reshape(t4,Bw,Bh);
                b4=sum(sum((t4-tc).^2));
                rot=0;
                bs=b1;

                if b2<bs
                    bs=b2;
                    t=t2;
                    rot=1;
                end
                if b3<bs
                    bs=b3;
                    t=t3;
                    rot=2;
                end
                if b4<bs
    %                 bs=b4;
                    t=t4;
                    rot=3;
                end
           end
            rot_vector(keys)=rot;
            b(Bw*kcr+1:Bw*(kcr+1),Bh*kcc+1:Bh *(kcc+1))=t;
  end
end
 
end

