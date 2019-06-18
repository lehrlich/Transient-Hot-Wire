q = 0.3575; %W/m, heat per unit length of wire

%t = linspace(0.001, 3, 1000);      %sec, heating/response time

l1 = 71.6;  %W/m-K, thermal conductivity of Pt at 25C
l2 = 0.25;  %W/m-K, thermal conductivity of teflon at 25C
l3 = 3.5;   %W/m-K, thermal conductivity of ice at 173 K

k1 = 71.6/0.13/21.45/(100)^3;   %m2/s, thermal diffusivity of Pt at 25C 
k2 = 0.124e-6;  %m2/s, thermal diffusivity of PTFE at 25C
k3 = 3.48/925.7/1.389/1000; %m2/s, thermal diffusivity of ice at 173 K

r1 = 1.27e-5;%m, radius of bare Pt wire
r0 = 1.397e-5;  %m, radius of wire with coating

D = 1.781;

A = 2*l3/l2*log(r0/r1)+l3/(2*l1)+log(4*k3/(r0^2*D));

C1 = r1^2/8*(((l3-l2)/l1)*(1/k1-1/k2)+4/k2-2/k1);
C2 = r0^2/2*(1/k3-1/k2)+r1^2/l2*(l2/k2-l1/k1)*log(r0/r1);
C3 = 1/(2*l3)*(r1^2*(l2/k2-l1/k1)+r0^2*(l3/k3-l2/k2));

C = C1+C2+C3*log(4*k3/(r0^2*D));
B = C3;

for m=1:30000
    t=m/10000;
    G(m) = (1/t)*(B*log(t)+C);
    V(m) = log(t);
    Z(m) = G(m)/V(m);
    m=m+1;
end

m=linspace(1/10000,3,30000)
figure(1)
plot(m,Z,'or')