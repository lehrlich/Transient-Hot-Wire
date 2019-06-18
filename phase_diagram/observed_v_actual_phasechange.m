a = [-20.0000  -14.0000  -7.5   -3.5000]
b = [-23.8000  -17.6000  -14.8000   -4.0000]

x=[-100:5]
y=x


figure(2)
plot(x,y,'k')
errorbar(a(1), b(1),3.8,'s','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','m');
hold on
errorbar(a(2), b(2),3.8,'*','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','r');
hold on
errorbar(a(3), b(3),3.8,'>','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','y');
hold on
errorbar(a(4), b(4),3.8,'^','LineWidth',1,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor','b');