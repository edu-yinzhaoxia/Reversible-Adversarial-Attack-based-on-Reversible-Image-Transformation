function Q=pre_processing_Q(Q)
eps=0.01;
[m,n]=size(Q);
Q( find(abs(Q)<eps) )=0;
for i=1:m
    index=find(Q(i,:)~=0);
    if index
        if length(index)==1
            Q(i,index(1))=1;
        else
          Q(i,index(1))=1-sum(Q(i,index(2:end)));
        end
    end
end