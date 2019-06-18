%Lili E.
clear all
clc
%close all
%remember to change the file names and reference values accordingly
R_room=16;
T_room=23;
R_ansys = []
t_ansys = []
G = zeros(1000,4);
[a,b] = size(G);
analysisprogram = mfilename('fullpath')

j=92;
  %load previous file
    no = num2str(j-1);

    file0 = strcat('TH_1MDMSO','_s16_01_17_14_','T2_t',no);
    %file0 = strcat('TH_6MDMSO','_s16_01_20_14_','T2_t',no);
    %file0 = strcat('TH_705MDMSO','_s17_02_05_14_','T2_t',no);
    load(file0)
    %intermediate resistance measurements (F1) from before previous THW 
    %measurement are now considered in fit so that three sets are used
    F0=F1;
    R_wire_meas=R_wire_meas;
    R_meas_1=R_meas_1;
    
    %load present file
    no = num2str(j);
    file1 = strcat('TH_1MDMSO','_s16_01_17_14_','T2_t',no);
    %file1 = strcat('TH_6MDMSO','_s16_01_20_14_','T2_t',no);
    %file1 = strcat('TH_705MDMSO','_s17_02_05_14_','T2_t',no);
    load (file1)
    R_wire_meas=R_wire_meas;
    R_meas_1=R_meas_1;
    
    F1=F1;
    F2=F2;
    
    
    %q = ((ampl^2)*(R_meas_1))./L;
    q = ((ampl^2)*(R_meas_1-0.4))./L;%include contact resistance in heat 
    
    %convert to temperature
    T_wire_meas=(R_wire_meas-R_room)/(beta*R_room)+T_room;

    
    R_now = B(j,2);%first resistance measurement of THW
    T_now=(R_now-R_room)/(beta*R_room)+T_room;

    t_now = B(j,1);%toc @ time that ampl was initiated
    
    %indices for fitting R_nom and T_nom
    N2_start = 175;
    N2_end   = 200;
    
   
    %time matrix for F0
    t0=linspace(T(j-1,1),T(j-1,1)+(200/6),200);
    
    %time matrix for F1
    t1= linspace(T(j,1),T(j,1)+(200/6),200);
    
    %time matrix for F2
    t2= linspace(T(j+1,1),T(j+1,1)+(200/6),200);
    
    
    %full matrices for intermediate resistance measurements
    R_nom = horzcat(F0(N2_start:N2_end), F1(N2_start:N2_end),...
        F2(N2_start:N2_end));
    
    %convert to temperature
    T_nom = (R_nom-R_room)/(beta*R_room)+T_room;

    t_nom = horzcat(t0(N2_start:N2_end), t1(N2_start:N2_end),...
        t2(N2_start:N2_end));
    
    %indices for THW
    N_start = 1;
    N_end = 150;
    N_index = N_start:N_end;
    
    %below used for ANSYS model
    %R_ansys = horzcat(R_ansys,F1,R_wire_meas);
    %t_ansys = horzcat(t_ansys,T1,linspace(t_now,t_now+(200/60),200));
    %T_ansys = ((R_ansys-R_room)/(beta*R_room))+T_room
    
    %fit a 2nd order polynomial to intermediate temperature measurements
    R_p = polyfit(t_nom, T_nom, 2);
    R_p1 = polyval(R_p, linspace(t_now,t_now+(N_end/60),N_end));
    R_p2 = polyval(R_p, linspace(t0(N2_start),T(j+1,1)+(200/6),200));
    
    figure (2)
    plot(t_nom,T_nom,'og');
    hold on
    plot(linspace(t0(N2_start),T(j+1,1)+(200/6),200),R_p2,'-b');
    hold on
    plot(linspace(t_now,t_now+(N_end/60),N_end),T_wire_meas(1:N_end),...
        'or','MarkerSize',2)

    %subtract temperature change during THW from THW
    T_correct = T_wire_meas(N_start:N_end)-R_p1;
    t = t_now+([N_start:N_end]).*dt;
    
       
    %fit a log function to THW data
    beta0 = [0.01 1000 0.1];%guesses for coefficients
    %opts = statset('nlinfit');
    %opts.RobustWgtFun = 'bisquare';%use robust fitting parameters
    [P,r,J,COVB,mse]= nlinfit(t,T_correct,@(b,x)(b(1)*log(x-b(2))+b(3)),beta0);
    %P=polyfit(log(t(N_index)),Delta_T(N_index),1);%linear fit
    k=((q)/(4*pi))/P(1);
    k
    
    figure(3) 
    subplot(2,3,1)
    plot(t,T_correct,'or')
    hold on
    plot(t,P(1)*log(t-P(2))+P(3),'-b')
    title('Experimental data with linefit')
    xlabel('Time, s')
    ylabel('{\Delta}T,{\circ}C')
    
    subplot(2,3,2)
    plot(t,r,'or')
    title('Residuals vs. time')
    xlabel('Time, s')
    ylabel('Residual, {\Delta}T')
    
    subplot(2,3,3)
    plot(P(1)*log(t-P(2))+P(3),r,'ob')
    title('Residuals vs. predicted values')
    xlabel('Predicted Values from Fit, {\Delta}T')
    ylabel('Residual, {\Delta}T')
    
    subplot(2,3,4)
    plot(r(1:149),r(2:150),'or')
    title('Residuals vs. lagged residuals')
    xlabel('Lagged Residual (i-1), {\Delta}T')
    ylabel('Residual (i), {\Delta}T')
    
    subplot(2,3,5)
    hist(real(r))
    title('Histogram of residuals')
    xlabel('Residual')
    ylabel('Count')
    
    subplot(2,3,6)
    normplot(r)
    xlabel('Residual')