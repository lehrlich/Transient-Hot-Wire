%For which current amplitudes does the voltage of our platinum sensor
%behave as I^3?
clear all
clc

%First load and get data from -20C test
for i=1:6
    %load data from file
    no = num2str(i);
    file0 = strcat('TH_2MDMSOtest','_s18_03_27_14_250K_','t',no);
    load (file0);
    D10(i)=V(10)-V(1);
    I(i)=ampl^3;
    D50(i)=V(50)-V(1);
    D99(i)=V(99)-V(1);
end
for i=10:14
    %load data from file
    no = num2str(i);
    file0 = strcat('TH_2MDMSOtest','_s18_03_27_14_250K_','t',no);
    load (file0);
    D10(i)=V(10)-V(1);
    I(i)=ampl^3;
    D50(i)=V(50)-V(1);
    D99(i)=V(99)-V(1);
end
for i=18:32
    %load data from file
    no = num2str(i);
    file0 = strcat('TH_2MDMSOtest','_s18_03_27_14_250K_','t',no);
    load (file0);
    D10(i)=V(10)-V(1);
    I(i)=ampl^3;
    D50(i)=V(50)-V(1);
    D99(i)=V(99)-V(1);
end
for i=34:47
    %load data from file
    no = num2str(i);
    file0 = strcat('TH_2MDMSOtest','_s18_03_27_14_250K_','t',no);
    load (file0);
    D10(i)=V(10)-V(1);
    I(i)=ampl^3;
    D50(i)=V(50)-V(1);
    D99(i)=V(99)-V(1);
end
p10=polyfit(I,D10,1)
p50=polyfit(I,D50,1)
p99=polyfit(I,D99,1)

figure(1)
%subplot(1,3,1)
plot(I,D10,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','g');
hold on;
plot(I,polyval(p10,I),'-g')
  
plot(I,D50,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r');
hold on;
plot(I,polyval(p50,I),'-r')

plot(I,D99,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
hold on;
plot(I,polyval(p99,I),'-b')

clear all
for i=1:8
    %load data from file
    no = num2str(i);
    file0 = strcat('TH_2MDMSOtest','_s18_03_27_14_230K_','t',no);
    load (file0);
    D10(i)=V(10)-V(1);
    I(i)=ampl^3;
    D50(i)=V(50)-V(1);
    D99(i)=V(99)-V(1);
end

p10=polyfit(I,D10,1)
p50=polyfit(I,D50,1)
p99=polyfit(I,D99,1)

figure(2)
%subplot(1,3,2)
plot(I,D10,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','g');
hold on;
plot(I,polyval(p10,I),'-g')

plot(I,D50,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r');
hold on;
plot(I,polyval(p50,I),'-r')

plot(I,D99,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
hold on;
plot(I,polyval(p99,I),'-b')

clear all
for i=1:8
    %load data from file
    no = num2str(i);
    file0 = strcat('TH_2MDMSOtest','_s18_03_27_14_190K_','t',no);
    load (file0);
    D10(i)=V(10)-V(1);
    I(i)=ampl^3;
    D50(i)=V(50)-V(1);
    D99(i)=V(99)-V(1);
end

p10=polyfit(I,D10,1)
p50=polyfit(I,D50,1)
p99=polyfit(I,D99,1)

figure(3)
%subplot(1,3,1)
plot(I,D10,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','g');
hold on;
plot(I,polyval(p10,I),'-g')
  
plot(I,D50,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r');
hold on;
plot(I,polyval(p50,I),'-r')

plot(I,D99,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
hold on;
plot(I,polyval(p99,I),'-b')


clear all
for i=1:8
    %load data from file
    no = num2str(i);
    file0 = strcat('TH_3MDMSOtest','_s18_03_29_14_188K_','t',no);
    load (file0);
    D10(i)=V(10)-V(1);
    I(i)=ampl^3;
    D50(i)=V(50)-V(1);
    D99(i)=V(99)-V(1);
end

p10=polyfit(I,D10,1)
p50=polyfit(I,D50,1)
p99=polyfit(I,D99,1)

figure(4)
%subplot(1,3,2)
plot(I,D10,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','g');
hold on;
plot(I,polyval(p10,I),'-g')

plot(I,D50,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r');
hold on;
plot(I,polyval(p50,I),'-r')

plot(I,D99,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
hold on;
plot(I,polyval(p99,I),'-b')

clear all
for i=1:5
    %load data from file
    no = num2str(i);
    file0 = strcat('TH_5MDMSOtest','_s18_03_31_14_173K_','t',no);
    load (file0);
    D10(i)=V(10)-V(1);
    I(i)=ampl^3;
    D50(i)=V(50)-V(1);
    D99(i)=V(99)-V(1);
end

p10=polyfit(I,D10,1)
p50=polyfit(I,D50,1)
p99=polyfit(I,D99,1)

figure(5)
%subplot(1,3,2)
plot(I,D10,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','g');
hold on;
plot(I,polyval(p10,I),'-g')

plot(I,D50,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r');
hold on;
plot(I,polyval(p50,I),'-r')

plot(I,D99,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
hold on;
plot(I,polyval(p99,I),'-b')

clear all
for i=1:4
    %load data from file
    no = num2str(i);
    file0 = strcat('TH_H2ODMSOtest','_s18_04_08_14_300K_','t',no);
    load (file0);
    D10(i)=V(10)-V(1);
    I(i)=ampl^3;
    D50(i)=V(50)-V(1);
    D99(i)=V(99)-V(1);
end
for i=6:7
    %load data from file
    no = num2str(i);
    file0 = strcat('TH_H2ODMSOtest','_s18_04_08_14_300K_','t',no);
    load (file0);
    D10(i)=V(10)-V(1);
    I(i)=ampl^3;
    D50(i)=V(50)-V(1);
    D99(i)=V(99)-V(1);
end

p10=polyfit(I,D10,1)
p50=polyfit(I,D50,1)
p99=polyfit(I,D99,1)

figure(5)
%subplot(1,3,2)
plot(I,D10,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','g');
hold on;
plot(I,polyval(p10,I),'-g')

plot(I,D50,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r');
hold on;
plot(I,polyval(p50,I),'-r')

plot(I,D99,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');
hold on;
plot(I,polyval(p99,I),'-b')
