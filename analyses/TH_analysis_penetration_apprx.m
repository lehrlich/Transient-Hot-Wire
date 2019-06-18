clear all
clc

ampl = 0.080;   %amps
res = 16;       %ohms
L = 0.070;      %m, length of wire
q = ((ampl^2)*res)/L; %W/m, heat per unit length of wire

%t = linspace(0.001, 3, 1000);      %sec, heating/response time


l2 = 0.25;  %W/m-K, thermal conductivity of teflon at 25C


l1 = 71.6;  %W/m-K, thermal conductivity of Pt at 25C
c1 = (25.86)/195.08;%J/g-K
p1 = 21.86*100e3;%g/m3

l3 = 5;   %W/m-K, thermal conductivity of ice at 173 K
c3 = 1.3*1000; %J/kg-K
p3 = 925.4; %kg/m3

k1 = l1/(p1*c1);
%k1 = 71.6/0.13/21.45/(100)^3;   %m2/s, thermal diffusivity of Pt at 25C 
k2 = 0.124e-6;  %m2/s, thermal diffusivity of PTFE at 25C
k3 = l3/(p3*c3);
%k3 = 3.48/925.7/1.389/1000; %m2/s, thermal diffusivity of ice at 173 K

a = 1.27e-5;%m, radius of bare Pt wire
r0 = 1.397e-5;  %m, radius of wire with coating


k2=k3;
l2=l3;


for i=1:200
t(i)=i/60;
Lp(i)=(2*k3*t(i))^(1/2);
end
figure
plot(t,Lp*1000)
ylabel('Penetration Depth, mm')
xlabel('Time, sec')
hold on
plot(50/60,Lp(50)*1000,'or')
Lp(50)*1000


%G=vpa(F,6);
%below is approximate solution for large values of (k3*t)/r^2. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for i=1:101
%     r(i)=r0+(i-1)/10000;
%     A=log((4*k3*t)/(r0^2*D))+(2*l3/l2)*(log(r0/r(i)));
%     B=(1/t)*(((r1^2)/4)*(1/k2-1/(2*k1)));
%     C=((r0^2)/4)*(2/k3-2/k2+r(i)^2/(k2*r0^2));
%     E=(r1^2/(2*l2))*(l2/k2-l1/k1)*log(r0^2/(r1*r(i)));
%     F=(1/(2*l3))*(log((4*k3*t)/(r0^2*D)))*(r1^2*(l2/k2-l1/k1)+r0^2*(l3/k3-l2/k2));
% 
%     v(i)=(k3*t)/r(i)^2;
%     Delta_T(i)=(q/(4*pi*l3))*(A+B+C+E+F);
% 
% end
% 
% figure(4)
% plot(r-r0,Delta_T,'-r')
% figure(5)
% plot(r-r0,v,'-r');
% 