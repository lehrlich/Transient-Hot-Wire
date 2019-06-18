clc 
clear all 

figure(1)
load TH_1MDMSO_s16_01_17_14_T2_newfit1
plot(G(:,4), G(:,1),'>','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','m');
hold on;
load TH_1MDMSO_s16_01_17_14_T2_v4_3
plot(G(:,4), G(:,1),'p','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','m');
hold on;
load TH_1MDMSO_s16_01_17_14_T2_v4_3_linfit
plot(G(:,4), G(:,1),'s','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','m');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
load TH_2MDMSO_s11_05_28_13_T2_G
plot(G(:,4), G(:,1),'>','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','c');
hold on;
load TH_2MDMSO_s11_05_28_13_T2_v4_3_linfit
plot(G(:,4), G(:,1),'s','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','c');
hold on;
load TH_2MDMSO_s5_03_12_13_T2_G
plot(G(:,4), G(:,1),'o','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r');
hold on;
load TH_2MDMSO_s5_03_12_13_T2_logfit_G
plot(G(:,4), G(:,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3)
load TH_3MDMSO_s11_05_28_13_T2_G
plot(G(:,4), G(:,1),'>','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','g')
hold on;
 
load TH_3MDMSO_s11_05_28_13_T2_linfit
plot(G(:,4), G(:,1),'s','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','g')
hold on;
 
load TH_3MDMSO_s5_03_27_13_T2_G
plot(G(:,4), G(:,1),'o','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
load TH_6MDMSO_s16_01_20_14_T2_v4_3
plot(G(:,4), G(:,1),'>','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b')
hold on;

load TH_6MDMSO_s16_01_20_14_T2_v4_3_linfit
plot(G(:,4), G(:,1),'s','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b')
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(5)
load TH_705MDMSO_s17_02_05_14_T2_v4_3
plot(G(:,4), G(:,1),'>','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b')
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(6)

load TH_8MDMSO_s11_05_29_13_T2_linfit
plot(G(:,4), G(:,1),'d','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r')
hold on;
