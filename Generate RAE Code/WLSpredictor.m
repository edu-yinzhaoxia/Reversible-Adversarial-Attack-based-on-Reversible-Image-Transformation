function pred_value=WLSpredictor(x,y,w,ref_value)

Y=(x-y)';
n=length(x);
nn=min(length(unique(x)),length(unique(Y)));
k=max(nn-1,0);

d_max=max(Y);
d_min=min(Y);

X=(zeros(n,k+1));
X0=(zeros(1,k+1));
W=(zeros(n,n));

for i=1:n
     W(i,i)=w(i);
    for j=1:k+1
         X(i,j)=x(i)^(j-1);
         
            if i==1
                X0(1,j)=ref_value^(j-1);
            end
   
            
    end
end

A=(X'*W*X)^-1*X'*W*Y;
d=round(X0*A);

if d>d_max
    pred_value=ref_value-d_max;

elseif d<d_min
    pred_value=ref_value-d_min;
else
    pred_value=ref_value-d;
end
