function  rst=decimal2binary_minus(data,bit)
LMLen=length(data);
sz=LMLen*bit;
rst=zeros(1,sz);

for i=1:LMLen
    tt=abs(data(i));
    for j=1:bit
        rst((i-1)*bit+j)=mod(floor(tt/(2^(bit-j))),2);
    end
    if data(i)<0
        rst(1)=1;
    end
end