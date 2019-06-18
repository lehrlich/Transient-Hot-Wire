%Lili E. Ehrlich
clear all
clc
close all
%set TH parameters
R_contacts = 0; %ohms
R_room = 16.5%does not include subtracting contact resistance
T_room = 18.3
L = 68e-3;%mm
beta = 3.727e-3; %coefficient of thermoresistance of platinum- 3.729e-3
ampl = 40e-3; %sets amplitude of driving current in mA
sampl = 4e-3;%sets amplitude of low current for temperature measurement in mA
N_P = 1; %Number of Power Cycles for ampl
N_P1 = 10;%Number of Power Cycles for sampl
dt = N_P/60; %sec
%recObj = audiorecorder;
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


%start measurements
tic


B = zeros(2,2);
a=300;
for m = 1:a
    n=m+1;
    %ask DMM to measure resistance in autorange
    %fprintf(g2,'MEASure:RESistance?'); % To measure current the command is MEASURE:CURRENT:DC?
    %R_nominal = fscanf(g2,'%f');
    %R_nominal

    %set the voltage range, resolution. Set the amount of measurements in
    %number of power cycles, turn off the autozero feature, turn off the
    %display on the device.


    fprintf(g2, 'CONFigure:VOLTage:DC 1, 0.00001');
    fprintf(g2, 'SENSe:VOLTage:DC:NPLCycles %f',N_P);
    fprintf(g2, 'SENSe:ZERO:AUTO OFF');
    fprintf(g2, 'DISPlay 0');

    % Set the trigger delay to 0, set the sample count to 512, and tell the DMM to automatically trigger
    fprintf(g2, 'TRIGger:DELay 0.0');
    fprintf(g2, 'SAMPle:COUNt 300');
    fprintf(g2, 'TRIGger:SOURce IMMediate');
    B(m,1) = toc;
    fprintf(g2, 'INITiate');
    fprintf(g1,'CURRent %f',sampl);
    fprintf(g1,'OUTPut ON')
    %pause(0.3);
    pause(10/6)
    fprintf(g1,'CURRent %f',ampl);
    %record(recObj);
    fprintf(g1,'OUTPut ON')
    pause(20/6)
    fprintf(g2, 'FETCh?');
    A = fscanf(g2);
    %stop(recObj);
    V = str2num(A);
    fprintf(g1,'OUTPut OFF')
    %y = getaudiodata(recObj);
    
    fprintf(g2, 'DISPlay 1');
    fprintf(g2,'SYSTEM:LOCAL');
    
    R_wire_meas_sampl = V(1:95)/sampl;
    R_meas_1_sampl = R_wire_meas_sampl(1);
    
    R_wire_meas_ampl = V(96:300)/ampl;
    R_meas_1_ampl  = R_wire_meas_ampl(1);
    
    B(m,2) = R_meas_1_sampl;
    
    B(m,3) = B(m,1)+(10/6);
    
    B(m,4) = R_meas_1_ampl;
    
    no = num2str(m);
    savefile =  strcat('TH_H2O','_s20_08_13_14_','T8_t',no);
    save (savefile);
    
    pause(34);

end

    fclose(g1);
    fclose(g2);
