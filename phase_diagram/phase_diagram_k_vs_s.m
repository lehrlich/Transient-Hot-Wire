clear all
clc

figure
% load phase_diagram_DMSO_1M
% M = polyfit(D,C,8);
% 
% load TH_1MDMSO_s16_01_17_14_T4_newfit1
% G(all(G==0,2),:)=[];
% % plot(G(:,4), G(:,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
% % hold on;
% figure(5)
% plot(polyval(M,G(:,4)),G(:,1),'o','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','m')
% hold on
% 
% clear all
% clc


load phase_diagram_DMSO_2M
M = polyfit(D,C,8);
% figure(3)
% plot(D,C)
% hold on
% plot(D,polyval(M,D),'or')


%load TH_2MDMSO_s5_03_12_13_T2_logfit_G
load TH_2MDMSO_s18_03_26_14_T2_v6_3_30
%load TH_2MDMSO_s5_03_12_13_T2_logfit_30
G(all(G==0,2),:)=[];
% plot(G(:,4), G(:,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
% hold on;
figure(5)
plot(polyval(M,G(:,4)),G(:,1),'o','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','c')
hold on

clear all
clc
load phase_diagram_DMSO_3M
M = polyfit(D,C,8);
% figure(3)
% plot(D,C)
% hold on
% plot(D,polyval(M,D),'or')


%load TH_3MDMSO_s5_03_27_13_T2_logfit_G
%load TH_3MDMSO_s18_03_29_14_T2_v6_3_30
%load TH_3MDMSO_s5_03_27_13_T2_logfit_30
load TH_3MDMSO_s19_05_05_14_T2_v6_3_30
G(all(G==0,2),:)=[];
% plot(G(:,4), G(:,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
% hold on;
figure(5)
plot(polyval(M,G(:,4)),G(:,1),'o','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b')
hold on
load TH_3MDMSO_s19_05_05_14_T4_v6_3_30
G(all(G==0,2),:)=[];
% plot(G(:,4), G(:,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
% hold on;
figure(5)
plot(polyval(M,G(:,4)),G(:,1),'o','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b')
hold on

clear all
clc
load phase_diagram_DMSO_4M
M = polyfit(D,C,8);
% figure(3)
% plot(D,C)
% hold on
% plot(D,polyval(M,D),'or')


%load TH_4MDMSO_s9_03_28_13_T2_logfit_G
%load TH_4MDMSO_s18_04_02_14_T4_v6_3_30
load TH_4MDMSO_s19_05_06_14_T4_v6_3_30
G(all(G==0,2),:)=[];
% plot(G(:,4), G(:,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
% hold on;
figure(5)
plot(polyval(M,G(:,4)),G(:,1),'o','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r')
hold on

clear all
clc
load phase_diagram_DMSO_5M
M = polyfit(D,C,8);
% figure(3)
% plot(D,C)
% hold on
% plot(D,polyval(M,D),'or')


%load TH_5MDMSO_s9_04_01_13_T2_logfit_G
load TH_5MDMSO_s18_03_31_14_T2_v6_3_30
G(all(G==0,2),:)=[];
% plot(G(:,4), G(:,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
% hold on;
figure(5)
plot(polyval(M,G(:,4)),G(:,1),'o','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','g')
hold on

clear all
clc
load phase_diagram_DMSO_6M
M = polyfit(D,C,8);
% figure(3)
% plot(D,C)
% hold on
% plot(D,polyval(M,D),'or')



load TH_6MDMSO_s16_01_20_14_T2_newfit1
%load TH_6MDMSO_s18_03_17_14_T2_v6_3
%load TH_6MDMSO_s18_03_19_14_T2_v6_3
G(all(G==0,2),:)=[];
% plot(G(:,4), G(:,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
% hold on;
figure(5)
plot(polyval(M,G(:,4)),G(:,1),'o','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','k')
hold on





