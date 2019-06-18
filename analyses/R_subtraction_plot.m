load TH_705MDMSO_s5_02_26_13_T2_H

dt = t_next-t_now

R = [1:140]*dt

plot(R,H(1:140,2),'-b')
hold on

for m=1:140
    
  no = num2str(m);
    file1 = strcat('TH_705MDMSO','_s5_02_26_13_','T2_t',no);
    load (file1)
    t = ([1:N_end]).*dt+t_now;
    R_plot= R_wire_meas(1:N_end);
    plot(t,R_plot,'ro')
    m=m+1;
end