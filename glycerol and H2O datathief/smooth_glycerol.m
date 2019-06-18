clear all
close all 
clc
E = 0.07
i = 1;
j = 1;

%literature results for water
load H2O_datathief_set_Z
Zw = Z;
for j = 1:8
    Zw(:,1) = smooth(Zw(:,1));
    Zw(:,2) = smooth(Zw(:,2));
    j = j+1;
end
plot(Zw(:,1)-273,Zw(:,2),'-r','LineWidth',4);
hold on

%THW measured results for water
load TH_H2O_s9_04_02_13_T2_H
plot(H(1:121,4), H(1:121,1),'s','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r');
hold on
errorbar(H(60,4),H(60,1),E*H(60,1),'k','LineWidth',1.5)
errorbar(H(77,4),H(77,1),E*H(77,1),'k','LineWidth',1.5)
errorbar(H(95,4),H(95,1),E*H(95,1),'k','LineWidth',1.5)
errorbar(H(112,4),H(112,1),E*H(112,1),'k','LineWidth',1.5)
errorbar(H(130,4),H(130,1),E*H(130,1),'k','LineWidth',1.5)

%literature results for glycerol
load glycerol_datathief_set_C
Cg = C;
for i = 1:100
    Cg(:,1) = smooth(Cg(:,1));
    Cg(:,2) = smooth(Cg(:,2));
    i = i+1;
end
figure(1)
plot(Cg(:,1)-273,Cg(:,2),'-b','LineWidth',4);
hold on

%THW measured results for glycerol
load TH_glycerol_s10_04_22_13_T2_G
plot(G(:,4), G(:,1),'<','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
errorbar(G(58,4),G(58,1),E*G(58,1),'k','LineWidth',1.5)
errorbar(G(75,4),G(75,1),E*G(75,1),'k','LineWidth',1.5)
errorbar(G(93,4),G(93,1),E*G(93,1),'k','LineWidth',1.5)
errorbar(G(110,4),G(110,1),E*G(110,1),'k','LineWidth',1.5)
errorbar(G(128,4),G(128,1),E*G(128,1),'k','LineWidth',1.5)






% G(:,1) = smooth(C(:,1));
% G(:,2) = smooth(C(:,2));
% plot(G(:,1),G(:,2),'-b');
% hold on
% G(:,1) = smooth(G(:,1));
% G(:,2) = smooth(G(:,2));
%plot(G(:,1),G(:,2),'-r');