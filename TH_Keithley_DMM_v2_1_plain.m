%Lili E. Ehrlich
clc 
clear all
close all

analysisprogram = mfilename('fullpath')
savefile = 'TH_H2Otest_s20_08_13_14_300K_t1';

%set TH parameters
R_room = 16.5
T_room = 18.3
L = 75e-3;%mm
beta = 3.72e-3; %coefficient of thermoresistance of platinum- 3.729e-3
ampl = 30e-3
N_P = 1; %Number of Power Cycles
dt = N_P/60; %sec
N_start = 3;
N_end = 40;
N_index = N_start:N_end;
%total_scans = dt*h_time;


%open keithley and agilent devices
g1 = gpib('keithley',0,12);%open current source
fopen(g1);

g2 = gpib('keithley',0,22);%open DMM
g2.InputBufferSize = 100000;
fopen(g2);

%"query"? devices
fprintf(g1, '*IDN?');
idn1 = fscanf(g1);

fprintf(g2, '*IDN?');
idn2 = fscanf(g2);


%ask DMM to measure resistance in autorange
fprintf(g2,'MEASure:RESistance?'); % To measure current the command is MEASURE:CURRENT:DC?
R_nominal = fscanf(g2,'%f');
R_nominal



%set the voltage range, resolution. Set the amount of measurements in
%number of power cycles, turn off the autozero feature, turn off the
%display on the device.

fprintf(g2, 'MEASure:VOLTage:DC?');
V_begin = fscanf(g2,'%f');
V_begin
fprintf(g2, 'CONFigure:VOLTage:DC 1, 0.00001');
fprintf(g2, 'SENSe:VOLTage:DC:NPLCycles %f',N_P);
fprintf(g2, 'SENSe:ZERO:AUTO OFF');
fprintf(g2, 'DISPlay 0');

% Set the trigger delay to 0, set the sample count to 512, and tell the DMM to automatically trigger
fprintf(g2, 'TRIGger:DELay 0.0');
fprintf(g2, 'SAMPle:COUNt 40');
fprintf(g2, 'TRIGger:SOURce IMMediate');
fprintf(g1,'CURRent %f',ampl);
fprintf(g1,'OUTPut ON')
%pause(0.3);
fprintf(g2, 'INITiate');
fprintf(g1,'OUTPut ON')
pause(5)
fprintf(g2, 'FETCh?');
A = fscanf(g2);
V = str2num(A);
fprintf(g1,'OUTPut OFF')


% Enable the DMM display
%turn current on and off

fprintf(g1,'OUTPut OFF')
fprintf(g2, 'DISPlay 1');
fprintf(g2,'SYSTEM:LOCAL');
fclose(g1);
fclose(g2);

%Transient Hotwire stuff

t = ([1:length(V)]).*dt;
R_wire_meas = V/ampl;
R_meas_1 = R_wire_meas(1);
q = ((ampl^2)*(R_meas_1))./L;
%Delta_R = R_wire_meas-R_meas_1;
Delta_T = ((R_wire_meas/R_room)-1)./beta;

figure(1);
plot(t,V,'ob');
xlabel('Time [s]')
ylabel('Voltage [V]')
hold on

figure(2); 
plot(t,R_wire_meas,'om');
xlabel('Time [s]');
ylabel('Resistance [Ohms]')
hold on

figure(3);
plot(t,Delta_T,'or'); hold on;
xlabel('Time [s]')
ylabel('DeltaT [K]')

figure(4);
semilogx(t,Delta_T,'or')
xlabel('ln(t)')
ylabel('DeltaT [K]')
hold on;

figure(5);
beta0 = [0.02 0 0.2];
P = nlinfit(t,Delta_T,@(b,x)(b(1)*log(x-b(2))+b(3)),beta0);
f = P(1)*log(t-P(2))+P(3);
plot(t,f)
hold on
plot(t,Delta_T, 'ob')
k =q/(4*pi*P(1))
e = sum((Delta_T-f).^2)

% Q=polyfit(log(t(N_start:N_end)),Delta_T(N_start:N_end),1);
% k=((q)/(4*pi))/Q(1);
% k

Rk = (R_nominal-R_room)/(beta*R_room)+T_room+273
Rc = (R_nominal-R_room)/(beta*R_room)+T_room

% semilogx((t),(P(1).*log(t)+P(2)),'LineWidth',2)

save (savefile);
