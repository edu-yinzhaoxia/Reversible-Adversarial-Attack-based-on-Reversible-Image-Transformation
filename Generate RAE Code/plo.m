% clear;clc
% close all
% load('q_sb.mat');
[a,b]=hist(q_sb,unique(q_sb))
a(2)=a(1)+a(2);
c=a(2:end)
c=c/(sum(c));
bar(c)
ylabel('percentage');
xlabel('STD');
% axis([0 128]);

% clear
 figure
% load('q_cb.mat');
[a,b]=hist(q_cb,unique(q_cb))
a(2)=a(1)+a(2);
c=a(2:end)
c=c/(sum(c));
bar(c)
ylabel('percentage');
xlabel('STD');
 axis([0 128 0 0.2]);