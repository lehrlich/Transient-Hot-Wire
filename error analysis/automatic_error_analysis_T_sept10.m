load TH_H2Otest_t1T1_s10_04_10_13

T_ref = 296
R_ref = 15.36

%T = Tref +(1/beta)*(V(m)/(ampl*R_ref)-1)
m=1
for m=1:100

d_T_ref = 1;
d_v_meas = V(m)*0.00004+0.000007
d_v_meas_1 = V(1)*0.00004+0.000007
d_ampl = (ampl*0.001)+0.00005
d_R_room = 0.2
d_beta = 0.0002

DTref = 1;
DV = 1/(ampl*beta*R_ref);
Dampl = -V(m)/(ampl^2*beta*R_ref);
DRref = -V(m)/(beta*R_ref^2*ampl);
Dbeta = -(1/beta^2)*((V(m)/(ampl*R_ref))-1);

DT(m) = ((d_T_ref*DTref)^2+(d_v_meas*DV)^2+(d_ampl*Dampl)^2+(d_R_room*DRref)^2+(d_beta*Dbeta)^2)^0.5

m=m+1;
end
%d_t = log((0.5*dt)/t(m)+1);
%d_c = 1-0.9955;