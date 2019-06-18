clc
clear all

ampl_start=98;
ampl_end=130;
Nsampl = 95;
T_ansys = []
t_ansys = []
q_ansys = []
analysisprogram = mfilename('fullpath') 

for g=2:200;%2:288
    h=g-1;
    j=g+1;
    
    %load data from previous file
    no = num2str(h);
    
    file0 = strcat('TH_DP6_18mgFe_s58_05_17_18_T2_t',no);
    %file0 = strcat('TH_VS55_14mgFe_s48_03_12_18_T2_t',no);
    %strcat('TH_VS55_14mgFe_s49_03_05_18_T4_t',no);
    load (file0);
    beta = 0.003739
    %s50beta = 0.003788; %
    L = 73e-3;%
    R_room = 16.315;
    T_room = 25;
    Rbefore = V(1:Nsampl)./sampl;
    Tbefore=(Rbefore-R_room)/(beta*R_room)+T_room;
    qbefore = ((sampl^2)*Rbefore)/L;
    
    %load data from next file
    no = num2str(j);
    file2 = strcat('TH_DP6_18mgFe_s58_05_17_18_T2_t',no);
    load (file2);
     beta = 0.003739
    %s50beta = 0.003788; %
    L = 73e-3;%
    R_room = 16.315;
    T_room = 25;
    Rafter = V(1:Nsampl)./sampl;
    Tafter=(Rafter-R_room)/(beta*R_room)+T_room;
    qafter = ((sampl^2)*Rafter)/L;
    
    t1=([1:95]).*dt+B(g,1);
    t2=([1:95]).*dt+B(j,1);
    t0=([1:95]).*dt+B(h,1);
    tint=([1:300]).*dt+B(g,1);


    no = num2str(g)
    file1 = strcat('TH_DP6_18mgFe_s58_05_17_18_T2_t',no);
    load (file1);
    beta = 0.003739
    %s50beta = 0.003788; %
    L = 73e-3;%
   R_room = 16.315;
    T_room = 25;
    
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
   
%guesses for coefficients
if j>=183
        beta0 = [0.1896 7200 0.5547];
     elseif j>=147
        beta0 = [0.07 5800 1.02];
     elseif j>=125
        beta0 = [0.0545 4931 0.4383]
    elseif j>=112
        beta0 = [0.0677 4375 0.587];
    elseif j>=99
        beta0=[0.0423 4138 0.3722]; 
      elseif j>=89
        beta0 = [0.0428 3521 -0.1332];
    elseif j>=87
        beta0 = [0.0428 3421 -0.1332];
    elseif j>=86
        beta0 = [0.0428 3341 -0.1332];
     elseif j>=77
     beta0 = [0.056 3380 -1.704]
    elseif j>=72
     beta0 = [0.0494 2824 0.4879]
 elseif j>=63
     beta0 = [0.0493 2660 -1.6]
        elseif j>=59
    beta0 = [0.0356 2300 -1.3];
      elseif j>=58
    beta0 = [0.0565 2160 -1.6];
 elseif j>=56
    beta0 = [0.0446 2160 -1.577];
     elseif j>=53
    beta0 = [0.033 2000 -1.165];
 elseif j>=51
    beta0 = [0.0321 2000 -0.985];
     elseif j>=50
    beta0 = [0.0321 2000 -0.985];
 elseif j>=49
    beta0 = [0.0371 1800 -0.86];
elseif j>=46
    beta0 = [0.0436 1700 -1.62];
elseif j>=45
    beta0 = [0.0436 1700 -1.62];
elseif j>=44
    beta0 = [0.0436 1700 -1.62];
elseif j>=40
    beta0 = [0.03 1591 0.06];
elseif j>=37
         beta0 = [0.0298 1433 0.0];
elseif j>=31
         beta0 = [0.0293 1433 0.1768];
elseif j>=24
          beta0= [0.035 677 -1.22];
        %beta0 = [0.04 -1000 0.1];%guesses for coefficients 
 elseif j>=20
         beta0= [0.035 677 -1.22];
elseif j>=15
       beta0= [0.035 677 -1.22];
 elseif j>=14
     beta0= [0.035 677 -1.22];
elseif j>=10
        beta0 = [0.0297 677 -1.725];
elseif j>=7
       beta0=[0.0297 201 -1.725];
elseif j>=2
        beta0 = [0.0294 41 -1.9];
else 
        beta0 = [0.043 0 0.5];
    end

   beta0(2)=B(g,1);
%   if j>=183
%         beta0 = [0.1896 7200 0.5547];
%      elseif j>=147
%         beta0 = [0.07 5800 1.02];
%      elseif j>=124
%         beta0 = [0.0768 4852 0.488]
%     elseif j>=112
%         beta0 = [0.0677 4375 0.587];
%     elseif j>=99
%         beta0=[0.0423 4138 0.3722]; 
%     elseif j>=88
%         beta0 = [0.0351 3817 0.3393];
%      elseif j>=84
%      beta0 = [0.0566 3380 0.3981]
%     elseif j>=72
%      beta0 = [0.0494 2824 0.4879]
%  elseif j>=70
%      beta0 = [0.0292 2980 0.2972]
%  elseif j>=59
%     beta0 = [0.035 2260 0.4009];
%  elseif j>=54
%     beta0 = [0.039 2149 0.427];
%  elseif j>=52
%     beta0 = [0.0354 2400 0.3348];
% elseif j>=46
%     beta0 = [0.0337 2000 0.3172];
%     elseif j>=31
%          beta0 = [0.0293 1433 0.2966];
% elseif j>=28
%          beta0 = [0.06 1433 0.6];
%         %beta0 = [0.04 -1000 0.1];%guesses for coefficients 
%  elseif j>=15
%      beta0= [0.0261 598 0.273]
%  elseif j>=14
%      beta0= [0.0261 479 0.273]
% elseif j>=10
%         beta0 = [0.045 677 0.48];
% elseif j>=7
%        beta0=[0.0214 201 0.324];
% elseif j>=3
%         beta0 = [0.023 41 0.26];
% else 
%         beta0 = [0.043 0 0.5];
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
filename = 'TH_DP6_18mgFe_s58_05_17_18_T2_v6_3_30';

%%%%%%%'TH_VS55_s53_04_12_18_T4_v6_3_30';
%%%'TH_VS55_s53_04_12_18_T2_v6_3_30'


%'TH_VS55_14mgFe_s49_03_05_18_T4_v6_3_30';

    save (filename);
end

