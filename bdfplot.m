function bdfplot(nbanks,  equityZero, equityZeroBeforeShock, equity)

figure
axes('Parent',gcf,'FontSize',24);
xlabel('banks','FontSize',20,'FontName','Cambria');
ylabel('Equity','FontSize',20,'FontName','Cambria');

hold on
grid
plot(1:nbanks, equity,'d-.','Color', [0.95 0.4 0.3],'LineWidth',3,'MarkerSize',20)
plot(1:nbanks, equityZero,'s-.','Color', [0.1 0.3 0.95],'LineWidth',3,'MarkerSize',20)
plot(1:nbanks, equityZeroBeforeShock,'s-.','Color', [0.3 0.75 0.1],'LineWidth',3,'MarkerSize',20)
