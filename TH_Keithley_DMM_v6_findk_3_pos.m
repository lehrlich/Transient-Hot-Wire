clc
clear all

ampl_start=98;
ampl_end=130;
Nsampl = 95;
T_ansys = []
t_ansys = []
q_ansys = []
analysisprogram = mfilename('fullpath')

for g=2:108;%2:288
    h=g-1;
    j=g+1;
    
    %load data from previous file
    no = num2str(h);
    
    file0 = strcat('TH_DP6_23BTDL_EC_s46_07_12_16_T2_t',no);
    %('TH_DP6_23BTDL_EC_s43_06_21_16_T4_t',no);
    load (file0);
    beta = 0.0039; %s
    L = 72e-3;%
    Rbefore = V(1:Nsampl)./sampl;
    Tbefore=(Rbefore-R_room)/(beta*R_room)+T_room;
    qbefore = ((sampl^2)*Rbefore)/L;
    %load data from next file
    no = num2str(j);
    file2 = strcat('TH_DP6_23BTDL_EC_s46_07_12_16_T2_t',no);
    load (file2);
    %beta = 0.003709%s30
    beta = 0.0039; %s
    L = 72e-3;%
    Rafter = V(1:Nsampl)./sampl;
    Tafter=(Rafter-R_room)/(beta*R_room)+T_room;
    qafter = ((sampl^2)*Rafter)/L;
    
    t1=([1:95]).*dt+B(g,1);
    t2=([1:95]).*dt+B(j,1);
    t0=([1:95]).*dt+B(h,1);
    tint=([1:300]).*dt+B(g,1);


    no = num2str(g)
    file1 = strcat('TH_DP6_23BTDL_EC_s46_07_12_16_T2_t',no);
    %file1 = strcat('TH_705MDMSO','_s17_02_05_14_','T4_t',no);
    load (file1);
    beta = 0.0039; %s
    L = 72e-3;%
%beta = 0.003709%s30
%      L=70.26e-3;%s18
%     %beta = 0.00375%s18
%      %L=70.26e-3;%s18
%        %beta = 0.003783
%       %beta = 0.00375%s18
% %        beta = 0.003738%s19
% %      L=70.26e-3;%s18
%   beta = 0.003753;%s31
%     T_room = 27.3;
%     R_room = 17.36;

    Rduring=V(1:Nsampl)/sampl;
    Rampl=V(ampl_start:ampl_end)/ampl;
    Rampl_ansys=V(ampl_start:300)/ampl;
    Tduring=(Rduring-R_room)/(beta*R_room)+T_room;
    qduring = ((sampl^2)*Rduring)/L;
    Tampl=(Rampl-R_room)/(beta*R_room)+T_room;
    Tampl_ansys = (Rampl_ansys-R_room)/(beta*R_room)+T_room;
    qampl_ansys = ((ampl^2)*(Rampl_ansys))/L;

    
    t_fit=horzcat(t0,t1,t2);
    T_fit=horzcat(Tbefore,Tduring,Tafter);
    
    if g==2
        t_total=t_fit;
        T_total=T_fit;
    elseif mod(g,2) == 0
        t_total=horzcat(t_total,t1,t2);
        T_total=horzcat(T_total,Tduring,Tafter);
    end
    

    samplfit=polyfit(t_fit,T_fit,2);
    samplval=polyval(samplfit,linspace(t0(1),t2(95),500));
    
    

    tampl=(ampl_start:ampl_end)*dt+B(g,1);
    tampl_ansys=(ampl_start:300)*dt+B(g,1);
    Tamplval=polyval(samplfit,tampl);
    Tsamplval=polyval(samplfit,t1);

    Tcorrect=Tampl-Tamplval;
    Tscorrect=Tduring-Tsamplval;

    Tsfit=polyfit(t1,Tscorrect,1);
    Tsval=polyval(Tsfit,tint);
    
    T_ansys = horzcat(T_ansys,Tduring,Tampl_ansys);
    t_ansys = horzcat(t_ansys,t1,tampl_ansys);
q_ansys = horzcat(q_ansys,qduring,qampl_ansys);

    
    figure(8)
    plot(t_fit,T_fit,'og');
    hold on
    plot(linspace(t0(1),t2(95),500),samplval,'-b');
    hold on
    plot(tampl,Tamplval,'or','MarkerSize',2)
    
    %plot(tint,Tsval,'-r')
    %plot(tampl,Tcorrect)
     
%   if j>=120
%         beta0 = [0.0413 4900 0.44];
%     elseif j>=101
%         beta0 = [0.0544 4000 0.5224];
%     elseif j>=96
%         beta0 = [0.0249 4000 0.306];
%     elseif j>=73
%      beta0 = [0.0175 2980 0.2567]
%     elseif j>=57
%     beta0 = [0.0375 2400 0.395];
%        elseif j>=51
%     beta0 = [0.015 2400 0.22];
%     elseif j>=46
%     beta0 = [0.0143 2000 0.23];
%     elseif j>=32
%          beta0 = [0.02 1234 0.33];
%     elseif j>=28
%          beta0 = [0.01 1433 0.186];
%         %beta0 = [0.04 -1000 0.1];%guesses for coefficients
%     elseif j>=16
%      beta0= [0.008 881 0.176]
%     elseif j>=12
%         beta0 = [0.007 677 0.16];
%     elseif j>=9
%         beta0 = [0.02 399 0.24];
%     elseif j>=8
%      beta0 = [0.0215 320 0.24]
%     else 
%         beta0 = [0.01 0 0.1];
% end
    if j>=183
        beta0 = [0.1896 7200 0.5547];
    elseif j>=119
        beta0 = [0.0444 4900 0.4825];
    elseif j>=105
        beta0=[0.0541 4138 0.551]; 
    elseif j>=96
        beta0 = [0.0651 3817 0.5816];
 elseif j>=77
     beta0 = [0.0369 2980 0.4135]
 elseif j>=59
    beta0 = [0.035 2260 0.4009];
 elseif j>=54
    beta0 = [0.0435 2149 0.3895];
 elseif j>=52
    beta0 = [0.04 2400 0.4];
elseif j>=46
    beta0 = [0.045 2000 0.374];
    elseif j>=32
         beta0 = [0.0382 1433 0.42];
elseif j>=28
         beta0 = [0.06 1433 0.6];
        %beta0 = [0.04 -1000 0.1];%guesses for coefficients 
 elseif j>=15
     beta0= [0.0317 598 0.37]
 elseif j>=14
     beta0= [0.045 479 0.557]
elseif j>=10
        beta0 = [0.045 677 0.48];
elseif j>=7
       beta0=[0.0214 201 0.324];
elseif j>=3
        beta0 = [0.0366 41 0.385];
else 
        beta0 = [0.043 0 0.5];
end
% if j>=120
%         beta0 = [0.07 4900 0.4];
%     elseif j>=96
%         beta0 = [0.06 4000 0.4];
%  elseif j>=74
%      beta0 = [0.0255 2980 0.46]
%     elseif j>=57
%     beta0 = [0.04 2400 0.31];
%        elseif j>=52
%     beta0 = [0.02 2400 0.4];
% elseif j>=46
%     beta0 = [0.045 2000 0.374];
% elseif j>=30
%          beta0 = [0.015 1433 0.3316];
%         %beta0 = [0.04 -1000 0.1];%guesses for coefficients
%  elseif j>=17
%      beta0= [0.0114 881 0.28]
% elseif j>=12
%         beta0 = [0.01 677 0.2655];
% elseif j>=10
%         beta0 = [0.0305 399 0.32];
%  elseif j>=8
%      beta0 = [0.01 280 0.24]
% else 
%         beta0 = [0.01 0 0.1];
% end
[Fampl,r,J,COVB,mse] = nlinfit(tampl,Tcorrect,@(b,x)(b(1)*log(x-b(2))+b(3)),beta0);%tampl-tampl(1)+dt
    Lampl = Fampl(1)*log(tampl-Fampl(2))+Fampl(3);
    F1(g)=Fampl(1);
    F2(g)=Fampl(2);
    F3(g)=Fampl(3);
    e=sum(r.^2);
%     figure(4)
%     plot(tampl,Tcorrect,'or')%tampl-tampl(1)+dt
%     hold on
%     plot(tampl,Lampl,'-r')
    %L=68.56e-3;%s20
  %beta = 0.00375;%s18
%      beta = 0.003738%s19
%      L=70.26e-3;%s18

    q = ((ampl^2)*((V(ampl_start)/ampl)-R_contacts))./L;
    k = q/(4*pi*Fampl(1));
    
%     if real(k)==abs(k)
%         k=k;
%     else
%         k=0;
%     end
    figure(4) 
    plot(tampl,Tcorrect,'+r')
    hold on
    plot(tampl,Fampl(1)*log(tampl-Fampl(2))+Fampl(3),'-b')
    pause(0.5)
    
%     figure(5)
%     subplot(2,1,1)
%     plot(y)
%     hold on
%     subplot(2,1,2)
%     plot(tampl,Tcorrect,'+r')
%     pause(1)
%     close(5)
    
    
    G(g,1) = k;
%   G(g,2) = R_meas_1;
    G(g,3) = Tduring(95)+273;%real(Tbefore(95)+273);
    G(g,4) = Tduring(95);%real(Tbefore(95));
    G(g,5) = e;
    
    if real(k)==abs(k)
         figure (7);
        plot(G(g,4), G(g,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],...
        'MarkerFaceColor','b');
        hold on;
        figure(8)
        plot(G(g,4), G(g,5),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],...
        'MarkerFaceColor','b');
        hold on;
        close(4)
    else
    	figure (7);
        plot(G(g,4), G(g,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],...
        'MarkerFaceColor','r');
        hold on;
        figure(8)
        plot(G(g,4), G(g,5),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],...
        'MarkerFaceColor','r');
        hold on;
        figure(4) 
        plot(tampl,Tcorrect,'+r')
        hold on
        plot(tampl,real(Fampl(1))*log(tampl-real(Fampl(2)))+real(Fampl(3)),'-b')
        pause(0.5)
        close(4)
        figure(9)
        e1=sum((real(Fampl(1))*log(tampl-real(Fampl(2)))+real(Fampl(3))-Tcorrect).^2)
        G(g,6)=e-e1;
        plot(G(g,4),G(g,6),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],...
        'MarkerFaceColor','c');
        hold on
    end
    
    if e>1e-4
       
    	 figure (7);
        plot(G(g,4), G(g,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],...
        'MarkerFaceColor','g');
        hold on;
        figure(8)
        plot(G(g,4), G(g,5),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],...
        'MarkerFaceColor','g');
        hold on;
    end
    
%     figure (5);
%     plot(G(j,4), G(j,1),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],...
%         'MarkerFaceColor','b');
%     hold on;
    
%     figure(6)
%     plot(G(j,4), G(j,5),'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],...
%         'MarkerFaceColor','b');
%     hold on
filename = 'TH_DP6_23BTDL_EC_s46_07_12_16_T2_v6_3_30';
%'TH_M22_s44_06_28_16_T6_v6_3_30';
%'TH_DP6_23BTDL_EC_s44_06_27_16_T4_v6_3_30'
%'TH_DP6_23BTDL_EC_s43_06_21_16_T4_v6_3_30'
%'TH_DP6_H2O_s42_09_16_15_T4_v6_3_30'
%'TH_DP6_13CHD_H2O_s42_10_05_15_T2_v6_3_30'
%'TH_DP6_EC_s42_09_20_15_T4_v6_3_30'
%'TH_DP6_EC_s41_07_22_15_T4_v6_3_30'

%'TH_DP6_23BTDL_H2O_s41_07_21_15_T6_v6_3_30_corrected'

%'TH_DP6_13CHD_H2O_s40_07_16_15_T4_v6_3_30_corrected'

%'TH_DP6_13CHD_H2O_s39_07_14_15_T2_v6_3_30_corrected'
%'TH_DP6_23BTDL_H2O_s41_07_21_15_T6_v6_3_30_notc'
%'TH_DP6_13CHD_EC_s38_06_26_15_T4_v6_3_30_notc'
%'TH_DP6_EC_s38_06_16_15_T3_v6_3_30_corrected'
%'TH_DP6_H2O_s38_06_18_15_T4_v6_3_30'
    %'TH_DP6_EC_s38_06_16_15_T3_v6_3_30_corrected'
    %'TH_DP6_PEG400_EC_s36_05_18_15_T2_v6_3_30_corrected'
    %'TH_DP6_13CHD_EC_s37_06_11_15_T4_v6_3_30_corrected'
    %'TH_DP6_PEG400_H2O_s37_06_10_15_T2_v6_3_30_corrected'
    %'TH_DP6_23BTDL_H2O_s36_05_28_15_T2_v6_3_30'
    %'TH_DP6_PEG400_EC_s36_05_20_15_T4_v6_3_30'
    %'TH_DP6_23BTDL_H2O_s35_05_15_15_T2_v6_3_30'
    %'TH_DP6_H2O_s31_03_07_15_T2_v6_3_30'
    %'TH_DP6_13CHD_H2O_s31_03_02_15_T4_v6_3_30'
    %'TH_705MDMSO_s30_01_17_15_T2_v6_3_30'
    %filename = 'TH_H2O_s22_09_14_14_T6_v6_3_30'
    %filename = 'TH_2MDMSO_s22_09_12_14_T2_v6_3_30'
    %filename = 'TH_8MDMSO_s21_09_01_14_T2_v6_3_30'
    %filename = 'TH_8MDMSO_s19_05_07_14_T4_v6_3_30'%%%%%%%
    %filename = 'TH_4MDMSO_s19_05_06_14_T6_v6_3_30'%%%%%%%
    %filename = 'TH_3MDMSO_s19_05_05_14_T2_v6_3_30'%%%%%%%
    %filename = 'TH_9MDMSO_s18_04_07_14_T2_v6_3_30'%%%%%%%
    %filename = 'TH_8MDMSO_s18_04_07_14_T2_v6_3_30'%%%%%%%
    %filename = 'TH_705MDMSO_s18_04_08_14_T2_v6_3_30'
    %filename = 'TH_10MDMSO_s20_08_02_14_T4_v6_3_30'
    %filename = 'TH_H2O_s20_08_13_14_T2_v6_3_30'
    %filename = 'TH_10MDMSO_s20_08_02_14_T2_v6_3_30'
    %filename = 'TH_2MDMSO_s20_08_12_14_T4_v6_3_30'
    %filename = 'TH_6MDMSO_s20_08_08_14_T4_v6_3_20'
    %filename = 'TH_6MDMSO_s20_08_08_14_T4_v6_3_30'%%%%%%%
    %filename = 'TH_5MDMSO_s18_03_31_14_T2_v6_3_30'%%%%%%%
    %filename = 'TH_3MDMSO_s18_03_29_14_T4_v6_3_30'
    %filename = 'TH_glycerol_s26_10_05_14_T2_v6_3_30'
    %filename = 'TH_3MDMSO_s18_03_29_14_T2_v6_3_10'%%%%%%%
    %filename = 'TH_4MDMSO_s18_04_02_14_T4_v6_3_20'%%%%%%%
    %filename = 'TH_2MDMSO_s18_03_26_14_T2_v6_3_10'%%%%%%%
    %filename = 'TH_10MDMSO_s18_03_24_14_T2_v6_3_30'%%%%%%%
    %filename = 'TH_6MDMSO_s18_03_19_14_T2_v6_3_30'%%%%%%%
    %filename = 'TH_H2O_s18_04_08_14_T2_v6_3_10'
    %filename = 'TH_705MDMSO_s17_02_05_14_T4_logfit';
    save (filename);
end

