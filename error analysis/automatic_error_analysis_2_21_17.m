load TH_H2O_s29_10_12_14_T2_t1
A = 0.06284 %A is q/4/pi/k. it is also equal to delta_T/lnt - B/lnt. If we find the error in A from the latter expression, we can find the error in k from the former expression.
C = 0.2738 %maximum uncertainty in slope of line of best fit for rewarming
R_room = R_nominal

for m=1:100

d_v_meas = V(m)*0.00004+0.000007;
d_v_meas_1 = V(1)*0.00004+0.000007;
d_ampl = (ampl*0.001)+0.00005;
d_R_room = 0.2;
d_beta = 0.0002;
d_t = log((0.5*dt)/t(m)+1);
d_c = 1-0.9955;

dv = V(m)-V(1);

c_cont = 0%-1/log(t(m));
t_cont = -((dv/(ampl*R_room*beta))-C)/(t(m)*(log(t(m)))^2);
R_cont = -(dv)/(log(t(m))*ampl*beta*R_room^2);
b_cont = -(dv)/(beta^2*ampl*log(t(m))*R_room);
amp_cont = -(dv)/(beta*ampl^2*log(t(m))*R_room);
v_cont = 1/(R_room*beta*ampl*log(t(m)));
v1_cont = -1/(R_room*beta*ampl*log(t(m)));

d_A(m) = ((c_cont*d_c)^2+(t_cont*d_t)^2+(R_cont*d_R_room)^2+(b_cont*d_beta)^2+(amp_cont*d_ampl)^2+(v_cont*d_v_meas)^2+(v1_cont*d_v_meas_1)^2)^(1/2);

m=m+1
end

mean(horzcat(d_A(1:59),d_A(61:end)))

%excluding cell 60:
0.1439


