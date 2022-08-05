function watermarked=embeddingonce(I,alpha,dir)
%dir=0 means Cross
%dir=1 means dot
watermarked=I;
[wid  len]=size(I);
Capacity=ceil(wid*len*alpha);
v=zeros(1,wid*len/2);

difs=zeros(1,wid*len/2);
vars=zeros(1,wid*len/2);
xpos=zeros(1,wid*len/2);
ypos=zeros(1,wid*len/2);

pfor=1;
for i=2:wid-1
    if dir+mod(i,2)==2
        k=0;
    else
        k=dir+mod(i,2);
    end
    for j=2+k:2:len-1
        pre=Pred(I(i-1,j),I(i,j-1),I(i+1,j),I(i,j+1));
        difs(pfor)=I(i,j)-pre;
        vars(pfor)=Var(I(i-1,j),I(i,j-1),I(i+1,j),I(i,j+1));
        xpos(pfor)=i;
        ypos(pfor)=j;
        v(pfor)=pre;
        pfor=pfor+1;
    end
end
pfor=pfor-1;
[vars,index]=sort(vars(1:pfor));
difs=difs(index);
xpos=xpos(index);
ypos=ypos(index);
v=v(index);
%根据嵌入量找到T.
Tn=-1;Tp=0;tdir=1;
for T=0:520
    tags=zeros(1,pfor);
    LocationMap=zeros(1,wid*len/2);
    pforL=1;
    TCap=0;
    for i=35:pfor
        tags(i)=modifiable(v(i),difs(i),Tn,Tp);
        if tags(i)==0
            LocationMap(pforL)=0;
            pforL=pforL+1;
        elseif abs(tags(i))==1
            LocationMap(pforL)=1;
            pforL=pforL+1;
        elseif tags(i)==2
            TCap=TCap+1;
            if TCap>=pforL-1+Capacity+34;
                break;
            end
        end
    end
    LocationMap=LocationMap(1:pforL-1);
    if TCap>=pforL-1+Capacity+34
        break;
    else
        if tdir==0
            Tp=Tp+1;
            tdir=1;
        else
            Tn=Tn-1;
            tdir=0;
        end
    end
end
if Tn>=-255 && Tp<=255
    %前34个像素值用来LSB记录Tn Tp alpa
    b1=decimal2binary_minus(Tn,7);
    b2=decimal2binary_minus(Tp,7);
    b3=decimal2binary_minus(alpha,20);
    b1=[b1 b2 b3];
    c1=LSB(v(1:34));
    v(1:34)=LSB_Substitute(v(1:34),b1);
    w=Gwatermark(Capacity);
    pforW=1;
    w=[c1 LocationMap w];
    sz=length(w);
    for i=35:pfor
        if pforW>sz
            break;
        end
        if tags(i)==2 && pforW<=sz
            difs(i)=difs(i)*2+w(pforW);
            pforW=pforW+1;
        elseif tags(i)==1
            if difs(i)>=0
                difs(i)=difs(i)*2+1;
            else
                difs(i)=difs(i)*2;
            end
        elseif tags(i)<0
            if difs(i)>Tp
                difs(i)=difs(i)+Tp+1;
            elseif difs(i)<Tn
                difs(i)=difs(i)+Tn;
            end
        end
    end
    for i=1:pfor
        watermarked(xpos(i),ypos(i))=v(i)+difs(i);
    end
end
end