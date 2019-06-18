%Thermal contraction calculations for Transient Hot Wire
clc
close all
clear all
%Delta_r = r_0* integral(alpha*dT) from T1 to T2
T1 = 300;   %Starting temperature of system, K
T2 = 150;   %Ending temperature of system, K
r_0 = 12.5e-6%Starting radius, m

%fit a line to glycerol data
a_g = [
1.0e2, 1.0e-4
1.0e2, 1.0e-4
1.0e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.1e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.2e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.3e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.4e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 1.0e-4
1.5e2, 9.8e-5
1.5e2, 9.8e-5
1.5e2, 9.5e-5
1.5e2, 9.5e-5
1.6e2, 9.3e-5
1.6e2, 9.3e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.0e-5
1.6e2, 9.3e-5
1.7e2, 9.3e-5
1.7e2, 9.5e-5
1.7e2, 9.5e-5
1.7e2, 9.8e-5
1.7e2, 9.8e-5
1.7e2, 9.8e-5
1.7e2, 9.8e-5
1.7e2, 1.0e-4
1.7e2, 1.0e-4
1.7e2, 1.1e-4
1.7e2, 1.1e-4
1.7e2, 1.1e-4
1.7e2, 1.1e-4
1.7e2, 1.2e-4
1.7e2, 1.2e-4
1.7e2, 1.2e-4
1.7e2, 1.2e-4
1.7e2, 1.2e-4
1.7e2, 1.2e-4
1.7e2, 1.2e-4
1.7e2, 1.3e-4
1.7e2, 1.3e-4
1.7e2, 1.3e-4
1.7e2, 1.3e-4
1.8e2, 1.3e-4
1.8e2, 1.4e-4
1.8e2, 1.4e-4
1.8e2, 1.4e-4
1.8e2, 1.5e-4
1.8e2, 1.5e-4
1.8e2, 1.5e-4
1.8e2, 1.5e-4
1.8e2, 1.5e-4
1.8e2, 1.6e-4
1.8e2, 1.6e-4
1.8e2, 1.6e-4
1.8e2, 1.6e-4
1.8e2, 1.7e-4
1.8e2, 1.7e-4
1.8e2, 1.7e-4
1.8e2, 1.7e-4
1.8e2, 1.8e-4
1.8e2, 1.8e-4
1.8e2, 1.8e-4
1.8e2, 1.9e-4
1.8e2, 1.9e-4
1.8e2, 1.9e-4
1.8e2, 1.9e-4
1.8e2, 2.0e-4
1.8e2, 2.0e-4
1.8e2, 2.0e-4
1.8e2, 2.0e-4
1.8e2, 2.1e-4
1.8e2, 2.1e-4
1.8e2, 2.1e-4
1.8e2, 2.1e-4
1.8e2, 2.2e-4
1.8e2, 2.2e-4
1.8e2, 2.2e-4
1.9e2, 2.2e-4
1.9e2, 2.3e-4
1.9e2, 2.3e-4
1.9e2, 2.3e-4
1.9e2, 2.4e-4
1.9e2, 2.4e-4
1.9e2, 2.4e-4
1.9e2, 2.4e-4
1.9e2, 2.5e-4
1.9e2, 2.5e-4
1.9e2, 2.5e-4
1.9e2, 2.5e-4
1.9e2, 2.6e-4
1.9e2, 2.6e-4
1.9e2, 2.6e-4
1.9e2, 2.6e-4
1.9e2, 2.7e-4
1.9e2, 2.7e-4
1.9e2, 2.7e-4
1.9e2, 2.8e-4
1.9e2, 2.8e-4
1.9e2, 2.8e-4
1.9e2, 2.8e-4
1.9e2, 2.9e-4
1.9e2, 2.9e-4
1.9e2, 2.9e-4
1.9e2, 2.9e-4
1.9e2, 3.0e-4
1.9e2, 3.0e-4
1.9e2, 3.0e-4
1.9e2, 3.0e-4
1.9e2, 3.1e-4
1.9e2, 3.1e-4
1.9e2, 3.1e-4
1.9e2, 3.1e-4
1.9e2, 3.2e-4
1.9e2, 3.2e-4
1.9e2, 3.2e-4
1.9e2, 3.3e-4
1.9e2, 3.3e-4
1.9e2, 3.3e-4
1.9e2, 3.3e-4
1.9e2, 3.4e-4
1.9e2, 3.4e-4
1.9e2, 3.4e-4
1.9e2, 3.4e-4
1.9e2, 3.5e-4
1.9e2, 3.5e-4
2.0e2, 3.5e-4
2.0e2, 3.5e-4
2.0e2, 3.6e-4
2.0e2, 3.6e-4
2.0e2, 3.6e-4
2.0e2, 3.6e-4
2.0e2, 3.7e-4
2.0e2, 3.7e-4
2.0e2, 3.7e-4
2.0e2, 3.8e-4
2.0e2, 3.8e-4
2.0e2, 3.8e-4
2.0e2, 3.8e-4
2.0e2, 3.9e-4
2.0e2, 3.9e-4
2.0e2, 3.9e-4
2.0e2, 3.9e-4
2.0e2, 4.0e-4
2.0e2, 4.0e-4
2.0e2, 4.0e-4
2.0e2, 4.0e-4
2.0e2, 4.1e-4
2.0e2, 4.1e-4
2.0e2, 4.1e-4
2.0e2, 4.2e-4
2.0e2, 4.2e-4
2.0e2, 4.2e-4
2.0e2, 4.2e-4
2.0e2, 4.3e-4
2.0e2, 4.3e-4
2.0e2, 4.3e-4
2.0e2, 4.3e-4
2.0e2, 4.4e-4
2.0e2, 4.4e-4
2.0e2, 4.4e-4
2.0e2, 4.4e-4
2.0e2, 4.5e-4
2.0e2, 4.5e-4
2.0e2, 4.5e-4
2.0e2, 4.5e-4
2.0e2, 4.6e-4
2.0e2, 4.6e-4
2.0e2, 4.6e-4
2.0e2, 4.7e-4
2.0e2, 4.7e-4
2.0e2, 4.7e-4
2.0e2, 4.7e-4
2.0e2, 4.8e-4
2.0e2, 4.8e-4
2.1e2, 4.8e-4
2.1e2, 4.8e-4
2.1e2, 4.8e-4
2.1e2, 4.9e-4
2.1e2, 4.9e-4
2.1e2, 4.9e-4
2.1e2, 4.9e-4
2.1e2, 5.0e-4
2.1e2, 5.0e-4
2.1e2, 5.0e-4
2.1e2, 5.1e-4
2.1e2, 5.1e-4
2.1e2, 5.1e-4
2.1e2, 5.1e-4
2.1e2, 5.2e-4
2.1e2, 5.2e-4
2.1e2, 5.2e-4
2.1e2, 5.2e-4
2.1e2, 5.3e-4
2.1e2, 5.3e-4
2.1e2, 5.3e-4
2.1e2, 5.3e-4
2.1e2, 5.4e-4
2.1e2, 5.4e-4
2.1e2, 5.4e-4
2.1e2, 5.4e-4
2.1e2, 5.4e-4
2.1e2, 5.5e-4
2.1e2, 5.5e-4
2.1e2, 5.5e-4
2.1e2, 5.5e-4
2.1e2, 5.6e-4
2.1e2, 5.6e-4
2.1e2, 5.6e-4
2.1e2, 5.6e-4
2.2e2, 5.6e-4
2.2e2, 5.6e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.7e-4
2.2e2, 5.6e-4
2.2e2, 5.6e-4
2.2e2, 5.6e-4
2.2e2, 5.6e-4
2.3e2, 5.5e-4
2.3e2, 5.5e-4
2.3e2, 5.5e-4
2.3e2, 5.5e-4
2.3e2, 5.4e-4
2.3e2, 5.4e-4
2.3e2, 5.4e-4
2.3e2, 5.4e-4
2.3e2, 5.3e-4
2.3e2, 5.3e-4
2.3e2, 5.3e-4
2.3e2, 5.3e-4
2.3e2, 5.3e-4
2.3e2, 5.2e-4
2.3e2, 5.2e-4
2.3e2, 5.2e-4
2.3e2, 5.2e-4
2.3e2, 5.2e-4
2.3e2, 5.1e-4
2.3e2, 5.1e-4
2.3e2, 5.1e-4
2.3e2, 5.1e-4
2.3e2, 5.0e-4
2.3e2, 5.0e-4
2.3e2, 5.0e-4
2.3e2, 5.0e-4
2.4e2, 4.9e-4
2.4e2, 4.9e-4
2.4e2, 4.9e-4
2.4e2, 4.9e-4
2.4e2, 4.9e-4
2.4e2, 4.9e-4
2.4e2, 4.8e-4
2.4e2, 4.8e-4
2.4e2, 4.8e-4
2.4e2, 4.8e-4
2.4e2, 4.8e-4
2.4e2, 4.8e-4
2.4e2, 4.7e-4
2.4e2, 4.7e-4
2.4e2, 4.7e-4
2.4e2, 4.7e-4
2.4e2, 4.7e-4
2.4e2, 4.6e-4
2.4e2, 4.6e-4
2.4e2, 4.6e-4
2.4e2, 4.6e-4
2.4e2, 4.6e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.5e2, 4.5e-4
2.6e2, 4.5e-4
2.6e2, 4.5e-4
2.6e2, 4.5e-4
2.6e2, 4.5e-4
2.6e2, 4.5e-4
2.6e2, 4.5e-4
2.6e2, 4.5e-4
2.6e2, 4.6e-4
2.6e2, 4.6e-4
2.6e2, 4.6e-4
2.6e2, 4.6e-4
2.6e2, 4.6e-4
2.6e2, 4.6e-4
2.6e2, 4.6e-4
2.6e2, 4.6e-4
2.6e2, 4.7e-4
2.6e2, 4.7e-4
2.6e2, 4.7e-4
2.7e2, 4.7e-4
2.7e2, 4.7e-4
2.7e2, 4.7e-4
2.7e2, 4.7e-4
2.7e2, 4.7e-4
2.7e2, 4.7e-4
2.7e2, 4.7e-4
2.7e2, 4.7e-4
2.7e2, 4.7e-4
2.7e2, 4.8e-4
2.7e2, 4.8e-4
2.7e2, 4.8e-4
2.7e2, 4.8e-4
2.7e2, 4.8e-4
2.7e2, 4.8e-4
2.7e2, 4.8e-4
2.7e2, 4.8e-4
2.8e2, 4.8e-4
2.8e2, 4.8e-4
2.8e2, 4.8e-4
2.8e2, 4.8e-4
2.8e2, 4.8e-4
2.8e2, 4.8e-4
2.8e2, 4.8e-4
2.8e2, 4.8e-4
2.8e2, 4.9e-4
2.8e2, 4.9e-4
2.8e2, 4.9e-4
2.8e2, 4.9e-4
2.8e2, 4.9e-4
2.8e2, 4.9e-4
2.8e2, 4.9e-4
2.8e2, 4.9e-4
2.8e2, 4.9e-4
2.8e2, 4.9e-4
2.9e2, 4.9e-4
2.9e2, 4.9e-4
2.9e2, 4.9e-4
2.9e2, 4.9e-4
2.9e2, 4.9e-4
2.9e2, 4.9e-4
2.9e2, 5.0e-4
2.9e2, 5.0e-4
2.9e2, 5.0e-4
2.9e2, 5.0e-4
2.9e2, 5.0e-4
2.9e2, 5.0e-4
2.9e2, 5.0e-4
2.9e2, 5.0e-4
2.9e2, 5.0e-4
2.9e2, 5.0e-4
2.9e2, 5.0e-4
2.9e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.0e2, 5.0e-4
3.1e2, 5.0e-4
3.1e2, 5.0e-4
3.1e2, 5.0e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.1e2, 4.9e-4
3.2e2, 4.9e-4
3.2e2, 4.9e-4
3.2e2, 4.9e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.2e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.3e2, 4.8e-4
3.4e2, 4.8e-4
3.4e2, 4.8e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.4e2, 4.7e-4
3.5e2, 4.7e-4
3.5e2, 4.7e-4
];
a_p = polyfit(a_g(:,1),a_g(:,2), 13);
a_p1 = polyval(a_p, linspace(100,350,250));
figure (1)
plot(linspace(100,350,250),a_p1,'-r')
hold on
plot(a_g(:,1),a_g(:,2),'or')

G=zeros(T1-T2);
for m=1:151
    T2 = m+149;
    %integral of alpha taken over temperatures of interest
    a_g = polyint(a_p,0);
    a_g1 = polyval(a_g, T1);
    a_g2 = polyval(a_g, T2);
    %Divide alpha by 1/3 in this case because of the change from volumetric
    %expansion to linear expansion
    Delta_r = (1/3)*r_0*(a_g1-a_g2);
    G(m)=Delta_r;
    m=m+1;
end
T1 = 300
T2 = 150
figure(2)
plot(linspace(T2,T1,T1-T2),G(:,1),'^-r')
hold on

%evaluate the same information for ice based on a known line of best fit
%for alpha (volumetric)
figure (1)
i_p = [0.67e-6 -24.86e-6];
i_p1 = polyval(i_p, linspace(100,350,250));
plot(linspace(100,350,250),i_p1,'-b')
hold on
m=1;
F=zeros(T1-T2);
for m=1:151
    T2 = m+149;
    %integral of alpha taken over temperatures of interest
    a_i = polyint(i_p,0);
    a_i1 = polyval(a_i, T1);
    a_i2 = polyval(a_i, T2);
    %Divide alpha by 1/3 in this case because of the change from volumetric
    %expansion to linear expansion
    Delta_r = (1/3)*r_0*(a_i1-a_i2);
    F(m)=Delta_r;
    m=m+1;
end
figure(2)
T1 = 300;
T2 = 150;
plot(linspace(T2,T1,T1-T2),F(:,1),'^-b')

%evaluate the same information for Platinum based on a known line of best fit
%for alpha (volumetric)
a_pt=[100,6.72e-6
    120,7.29e-6
    140,7.72e-6
    160,8.03e-6
    180,8.26e-6
    200,8.42e-6
    250,8.74e-6
    300,8.94e-6
    350,9.10e-6];
a_ptt = polyfit(a_pt(:,1),a_pt(:,2), 1);
a_ptt1 = polyval(a_ptt, linspace(100,350,250));
figure (1)
plot(linspace(100,350,250),3*a_ptt1,'-g')
hold on
plot(a_pt(:,1),3*a_pt(:,2),'og')
hold on
m=1;
H=zeros(T1-T2);
for m=1:151
    T2 = m+149;
    %integral of alpha taken over temperatures of interest
    a_pi = polyint(a_ptt,0);
    a_pi1 = polyval(a_pi, T1);
    a_pi2 = polyval(a_pi, T2);
    %already in terms of linear expansion so no need to multiply by 1/3
    Delta_r = r_0*(a_pi1-a_pi2);
    H(m)=Delta_r;
    m=m+1;
end
figure(2)
T1 = 300;
T2 = 150;
plot(linspace(T2,T1,T1-T2),H(:,1),'^-g')

a_a=[
1.0e2, 1.2e-5
1.0e2, 1.2e-5
1.0e2, 1.2e-5
1.0e2, 1.2e-5
1.1e2, 1.2e-5
1.1e2, 1.2e-5
1.1e2, 1.2e-5
1.1e2, 1.2e-5
1.1e2, 1.2e-5
1.1e2, 1.2e-5
1.1e2, 1.2e-5
1.1e2, 1.2e-5
1.2e2, 1.2e-5
1.2e2, 1.2e-5
1.2e2, 1.2e-5
1.2e2, 1.2e-5
1.2e2, 1.2e-5
1.3e2, 1.2e-5
1.3e2, 1.2e-5
1.3e2, 1.2e-5
1.3e2, 1.2e-5
1.3e2, 1.2e-5
1.3e2, 1.2e-5
1.4e2, 1.2e-5
1.4e2, 1.2e-5
1.4e2, 1.3e-5
1.4e2, 1.3e-5
1.4e2, 1.3e-5
1.4e2, 1.3e-5
1.5e2, 1.3e-5
1.5e2, 1.3e-5
1.5e2, 1.3e-5
1.5e2, 1.3e-5
1.5e2, 1.3e-5
1.6e2, 1.3e-5
1.6e2, 1.3e-5
1.6e2, 1.3e-5
1.6e2, 1.3e-5
1.6e2, 1.3e-5
1.6e2, 1.3e-5
1.7e2, 1.3e-5
1.7e2, 1.3e-5
1.7e2, 1.3e-5
1.7e2, 1.3e-5
1.7e2, 1.3e-5
1.7e2, 1.3e-5
1.8e2, 1.3e-5
1.8e2, 1.3e-5
1.8e2, 1.3e-5
1.8e2, 1.3e-5
1.8e2, 1.3e-5
1.9e2, 1.3e-5
1.9e2, 1.3e-5
1.9e2, 1.3e-5
1.9e2, 1.3e-5
1.9e2, 1.3e-5
2.0e2, 1.3e-5
2.0e2, 1.3e-5
2.0e2, 1.3e-5
2.0e2, 1.3e-5
2.0e2, 1.4e-5
2.0e2, 1.4e-5
2.1e2, 1.4e-5
2.1e2, 1.4e-5
2.1e2, 1.4e-5
2.1e2, 1.4e-5
2.1e2, 1.4e-5
2.1e2, 1.4e-5
2.2e2, 1.4e-5
2.2e2, 1.4e-5
2.2e2, 1.4e-5
2.2e2, 1.4e-5
2.2e2, 1.4e-5
2.2e2, 1.4e-5
2.2e2, 1.4e-5
2.3e2, 1.4e-5
2.3e2, 1.4e-5
2.3e2, 1.4e-5
2.3e2, 1.4e-5
2.4e2, 1.4e-5
2.4e2, 1.4e-5
2.4e2, 1.4e-5
2.4e2, 1.4e-5
2.4e2, 1.4e-5
2.5e2, 1.4e-5
2.5e2, 1.4e-5
2.5e2, 1.4e-5
2.5e2, 1.4e-5
2.5e2, 1.4e-5
2.6e2, 1.4e-5
2.6e2, 1.4e-5
2.6e2, 1.4e-5
2.6e2, 1.4e-5
2.6e2, 1.4e-5
2.7e2, 1.4e-5
2.7e2, 1.4e-5
2.7e2, 1.4e-5
2.7e2, 1.4e-5
2.7e2, 1.4e-5
2.8e2, 1.4e-5
2.8e2, 1.4e-5
2.8e2, 1.4e-5
2.8e2, 1.4e-5
2.8e2, 1.4e-5
2.9e2, 1.4e-5
2.9e2, 1.4e-5
2.9e2, 1.4e-5
2.9e2, 1.4e-5
2.9e2, 1.4e-5
3.0e2, 1.4e-5
3.0e2, 1.4e-5
3.0e2, 1.4e-5
3.0e2, 1.4e-5
3.1e2, 1.4e-5
3.1e2, 1.4e-5
3.1e2, 1.4e-5
3.1e2, 1.4e-5
3.1e2, 1.4e-5
3.2e2, 1.4e-5
3.2e2, 1.4e-5
3.2e2, 1.4e-5
3.2e2, 1.4e-5
3.2e2, 1.4e-5
3.3e2, 1.4e-5
3.3e2, 1.4e-5
3.3e2, 1.4e-5
3.3e2, 1.4e-5
3.3e2, 1.4e-5
3.4e2, 1.4e-5
3.4e2, 1.4e-5
3.4e2, 1.4e-5
3.4e2, 1.4e-5
3.4e2, 1.4e-5
3.5e2, 1.4e-5
3.5e2, 1.4e-5
3.5e2, 1.4e-5
3.5e2, 1.4e-5
3.5e2, 1.4e-5
]

a_au = polyfit(a_a(:,1),a_a(:,2), 2);
a_au1 = polyval(a_au, linspace(100,350,250));
figure (1)
plot(linspace(100,350,250),3*a_au1,'-y')
hold on
plot(a_a(:,1),3*a_a(:,2),'oy')

m=1;
J=zeros(T1-T2);
for m=1:151
    T2 = m+149;
    %integral of alpha taken over temperatures of interest
    a_aui = polyint(a_au,0);
    a_aui1 = polyval(a_aui, T1);
    a_aui2 = polyval(a_aui, T2);
    %already in terms of linear expansion so no need to multiply by 1/3
    Delta_r = r_0*(a_aui1-a_aui2);
    J(m)=Delta_r;
    m=m+1;
end
figure(2)
T1 = 300;
T2 = 150;
plot(linspace(T2,T1,T1-T2),J(:,1),'^-y')

a_dm = [2*4.796e-7 1.89e-4];
a_dm1 = polyval(a_dm, linspace(100,350,250)-273);
figure(1)
plot(linspace(100,350,250),3*a_dm1,'-c')
hold on

m=1;
L=zeros(T1-T2);
for m=1:151
    T1 = 300-273;
    T2 = m+149-273;
    %integral of alpha taken over temperatures of interest
    a_dmi = polyint(a_dm,0);
    a_dmi1 = polyval(a_dmi, T1);
    a_dmi2 = polyval(a_dmi, T2);
    %already in terms of linear expansion so no need to multiply by 1/3
    Delta_r = r_0*(a_dmi1-a_dmi2);
    L(m)=Delta_r;
    m=m+1;
end
figure(2)
T1 = 300;
T2 = 150;
plot(linspace(T2,T1,T1-T2),L(:,1),'s-c')



