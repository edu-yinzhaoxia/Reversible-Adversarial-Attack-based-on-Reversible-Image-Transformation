function [class_index,class_L]=K_means(SD,K)
%%%% 该函数目的 将数据分为 K类 返回每一类的索引及其类中心  从小到大输出
% a=[1,2,3,7,8,9,4,5,6]

class_L=zeros(K,1);
class_index_temp=cell(K,1);
class_index=cell(K,1);
[disto_sort,index]=sort(SD);
 [m,~]=size(disto_sort);
if m==1
    disto_sort=disto_sort';
end
save disto_sort disto_sort;
sd=disto_sort;
[data_cluster,center]=kmeans(disto_sort,K,'distance','sqEuclidean','emptyaction','singleton','Start','uniform','rep',1);

for i=1:K
    temp=[];
    temp=find(data_cluster==i);
    class_index_temp{i}=sort(index(temp));
%     class_index_temp{i}=sort(class_index_temp{i});
end

[~,center_index]=sort(center);
for i=1:K
    class_index{i}=class_index_temp{center_index(i)};
    class_L(i)=length(class_index{i});
end
