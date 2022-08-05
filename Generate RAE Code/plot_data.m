clear;
close all
clc




% % set(gca,'xtick',[1 2 3 4 5 6 7 8 9],'FontSize',14);
% % set(gca,'xticklabel',{'1',' 2','4','6','8','10','12','14','16'},'FontSize',14)
% axis([0.1 0.6 35 75]);
% % h=legend('Example 1','Example 2','Example 3');
% % set(h,'Fontsize',16);

% 
a=[15.2064 15.2127 15.2180 15.2248 15.2372 15.2616 15.2972 15.3341 15.3759 15.4206 15.4714 15.5415 15.6532 15.7502 15.8897 16.0016 16.1099 ];
b=[12.3715 12.3727 12.3790 12.3905 12.4079 12.4305 12.4604 12.5076 12.5725 12.6246 12.7120 12.7882 12.8676 12.9581 13.0813 13.2051 13.3266 ];
c=[11.2358 11.2379 11.2506 11.2725 11.3404 11.4008 11.4812 11.5673 11.7108 11.8323 11.9542 12.0609 12.1595 12.2545 12.3540 12.4740 12.5668 ];

% a=[13314 88258 114190 133443 156475 178298 198839 216470 233040 247973 261888 274467 286263 297013 306515 315181 322969 ];
% b=[464 8794 30835 54876 80804 106375 131625 154986 177161 197007 215326 232167 247390 260720 273135 284389 294622 ];
% c=[4375 51113 142738 198598 241291 273281 298452 317139 332088 343366 352362 359174 364591 368914 372426 375220 377533 ];
% % 
% % 
grid on

plot(0:16,a,'r-o','LineWidth',1.5);
hold on
plot(0:16,b,'g-v','LineWidth',1.5);
hold on
plot(0:16,c,'b-*','LineWidth',1.5);



% ylabel('bpp','FontSize',16);
ylabel('smo_{num}','FontSize',16);
ylabel('RMSE','FontSize',16);
xlabel('SD_T','FontSize',16);
axis([0 16 11 17]);
 set(gca,'xtick',[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16],'FontSize',14);
 set(gca,'xticklabel',{'0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16'})
h=legend('Example 1','Example 2','Example 3');
set(h,'Fontsize',16);



%%%%%%%% RMSE
% a=[19.27,	19.52,	19.84,	20.14,	20.37,	20.97];
% b=[16.23,	16.42,	16.63,	16.84,	17.00,	17.54];
% c=[12.81,	12.81,	12.82,	12.83,	12.83,	12.85];
% grid on
% figure(1)
% plot(a,'r*');
% hold on
% plot(b,'g*');
% hold on
% plot(c,'b*');
% ylabel('RMSE','FontSize',16);
% axis([1 6 10 26]);
% set(gca,'xtick',[1 2 3 4 5 6],'FontSize',14);
% set(gca,'xticklabel',{'T=0','T=5','T=10','T=15','T=20','T=128'});
% h=legend('Example 1','Example 2','Example 3')
% set(h,'Fontsize',16);
% a=[0.9027,	0.8160,	0.7706,	0.7466,	0.7335,	0.7156];
% b=[0.7764,	0.7251,	0.7021,	0.6893,	0.6822,	0.6686];
% c=[0.6342,	0.6299,	0.6290,	0.6288,	0.6285,	0.6276];
%axis([0 6 10 30]);
% grid on
% figure(1)
% plot(a,'r*');
% hold on
% plot(b,'b*');
% ylabel('MSSIM');
%  set(gca,'xtick',[1 2 3 4 5]);
% set(gca,'xticklabel',{' Fig.10(d)',' Fig.11(e)',' Fig.12(c)',' Fig.13(c)',' Fig.15(d)'})
% legend('proposed method','Lee''s method');
% a=[0.6637,0.6605,0.6595,0.6589,0.6586,0.6576];%woman man
%  a=[0.6943,0.6774,0.6726,0.6707,0.6700,0.6692];%man  girls
%   c=[0.6699,0.6660,0.6652,0.6649,0.6648,0.6642];%cao river 
%   b=[0.7898,0.7385,0.7139,0.7071,0.6938,0.6806];%6a5b
%   a=[0.9220,0.8380,0.7931,0.7688	,0.7563,0.7388];%twoman sunflower
% % b =[0.8198,0.7367,0.7036,0.6893,0.6822,0.6729];%6a5e
% % % % % % e=[0.6933,0.6823,0.6744,0.6689,0.6645,0.6510];%5eman
%    axis([1 6 0.6 1]);
% % % % 
% % grid on
% % figure(1)
% % plot(a,'r*');
% % hold on
% % plot(b,'g*');
% % hold on
% % plot(c,'b*');
% % hold on
% % plot(d,'c*');
% % hold on
% % plot(e,'m*');
% %  %%ylabel('BPP');
% % xlabel('The value of K');
% % % ylabel('Bits');
% %    axis([1 6 0.5 1]);
% % % axis([1 9 0 4]);
% % set(gca,'xtick',[1 2 3 4 5 6]);
% % set(gca,'xticklabel',{'T=0','T=5','T=10','T=15','T=20','T=128'})
% % legend('Example 1','Example 2','Example 3')




%%%%%%%%%*********显示附加信息嵌入率
% a=[0.5045,0.7253,0.5495,0.4808,0.4830,0.5576];%他的 8X8
% b=[1.8609,2.0463,1.8785,1.8371,1.8259,1.8702];%他的 4X4
% c=[0.7019,0.7706,0.7021,0.6290,0.6307,0.6596];%%%我的4X4
% % % 
% % % 
% grid on
% figure(1)
% plot(a,'r*');
% hold on
% plot(b,'g*');
% hold on
% plot(c,'b*');
% hold on
% 
% ylabel('bpp','FontSize',16);
% axis([1 6 0 3.0]);
% % ylabel('RMSE');
% set(gca,'xtick',[1 2 3 4 5 6],'FontSize',14);
%  
% set(gca,'xticklabel',{'Fig.5','Fig.6(a)','Fig.6(b)','Fig.6(c)','Fig.9','Fig.10'})
% h=legend('Lee''s method for 8*8 tile','Lee''s method for 4*4 tile','Proposed method for 4*4 tile');
% set(h,'Fontsize',16);
% 
% 

% a=[0.8198,0.7367,0.7036,0.6893,0.6822,0.6729];
% b=[0.7718,0.7316,0.7079,0.6932,0.6832,0.6626];
% c=[0.6969,0.6875,0.6833,0.6802,0.6782,0.6734];
% d=[0.6637,0.6605,0.6595,0.6589,0.6586,0.6576];
% e=[0.7898,0.7385,0.7139,0.7071,0.6938,0.6806];
% 
% axis([1 6 0.6 0.9]);
% grid on
% figure(1)
% plot(a,'r*');
% hold on
% plot(b,'g*');
% 
% hold on
% plot(c,'b*');
% 
% hold on
% plot(d,'c*');
% 
% hold on
% plot(e,'m*');
% ylabel('embedding rate');
%  set(gca,'xtick',[1 2 3 4 5 6]);
% set(gca,'xticklabel',{'T=0','T=5','T=10','T=15','T=20','T=128'})
% legend('1(a)&1(b)','10(a)&10(b)','11(a)&11(b)','12(a)&12(b)','1(a)&13(a)');
% 
% 
% a=[14.38,20.91,28.76,21.67,25.62];
% b=[26.11,33.93,30.49,26.06,33.10];
% axis([0 6 10 40]);
% grid on
% figure(1)
% plot(a,'r*');
% hold on
% plot(b,'b*');
% ylabel('RMSE');
%  set(gca,'xtick',[1 2 3 4 5]);
% set(gca,'xticklabel',{' Fig.10(d)',' Fig.11(e)',' Fig.12(c)',' Fig.13(c)',' Fig.15(d)'})
% legend('proposed method','Lee''s method');


% a=[0.4732,0.3333,0.5959,0.6291,0.5313];
% b=[0.2175,0.2017,0.445,0.3360,0.4528];
% axis([0 6 0 1]);
% grid on
% figure(1)
% plot(a,'r*');
% hold on
% plot(b,'b*');
% ylabel('MSSIM');
%  set(gca,'xtick',[1 2 3 4 5]);
% set(gca,'xticklabel',{'1(a)&1(b)','10(a)&10(b)','11(a)&11(b)','12(a)&12(b)','1(a)&13(a)'})
% legend('proposed method','Lee''s method');