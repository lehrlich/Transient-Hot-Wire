filename= 'TH_6MDMSO_s18_03_19_14_T2_v6_3_30'%%
%'TH_5MDMSO_s18_03_31_14_T2_v6_3_30'%%
%'TH_4MDMSO_s19_05_06_14_T4_v6_3_30'%%
%'TH_4MDMSO_s19_05_06_14_T2_v6_3_30'%%
%'TH_4MDMSO_s18_04_02_14_T4_v6_3_30'%%
%'TH_2MDMSO_s18_03_26_14_T2_v6_3_30'%%
%'TH_3MDMSO_s18_03_29_14_T2_v6_3_30'%%
%'TH_3MDMSO_s19_05_05_14_T4_v6_3_30';%%
%'TH_10MDMSO_s18_03_24_14_T2_v6_3_30'%%
%'TH_9MDMSO_s18_04_07_14_T2_v6_3_30'%%
%'TH_8MDMSO_s19_05_07_14_T4_v6_3_30'%%
%'TH_8MDMSO_s19_05_07_14_T2_v6_3_30'%%
%'TH_8MDMSO_s18_04_07_14_T2_v6_3_30'%%
%'TH_705MDMSO_s18_04_08_14_T2_v6_3_30'%%


load(filename);

figure (1);
plot(G(:,4), G(:,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],...
'MarkerFaceColor','r');
xlabel('Temperature, {\circ}C')
ylabel('Thermal Conductivity, W/m-K')
title(filename)
hold on


t_total=t_total/60;%converts seconds to minutes
figure(2)
Tcv=polyfit(t_total,T_total,100);
plot(t_total,polyval(Tcv,t_total),'-r')
hold on
plot(t_total,T_total,'ob')
xlabel('Time, min')
ylabel('Temperature, {\circ}C')
title(filename)

rate = polyder(Tcv);
figure(3)
plot(t_total,polyval(rate,t_total))
xlabel('Time, min')
ylabel('Rewarming rate, {\circ}C/min')
title(filename)
