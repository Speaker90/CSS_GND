
%%20191204_Figure1_centrality_distribution
pos1 = [0.15 0.75 0.15 0.15];
pos2 = [0.36 0.75 0.15 0.15];
pos3 = [0.57 0.75 0.15 0.15];
pos4 = [0.78 0.75 0.15 0.15];

subplot('position',pos1);
semilogx(unique_deg,distribution_deg,'o','Markersize',3); 
xlabel('Degree k','FontSize',10);
ylabel('Frequency p(k)','FontSize',10);


subplot('position',pos2);
semilogx(unique_bet,distribution_bet,'o','Markersize',3); 
xlabel('Betweenness b','FontSize',10);
ylabel('Frequency p(b)','FontSize',10);


subplot('position',pos3);
semilogx(unique_clo,distribution_clo,'o','Markersize',3); 
xlabel('Closeness c','FontSize',10);
ylabel('Frequency p(c)','FontSize',10);


subplot('position',pos4);
semilogx(unique_eig,distribution_eig,'o','Markersize',3); 
xlabel('Eigenvector e','FontSize',10);
ylabel('Frequency p(e)','FontSize',10);
savefig('Figure1CentralityDistribution')
%%
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);%设置图的位置
set(gcf, 'PaperSize', [25 25]); %Keep the same paper size，设置pdf纸张的大小，
saveas(gcf, 'Figure1CentralityDistribution.pdf');%保存命令，即在当前目录下生成名为WithMargin的pdf

%% 20191204_Figure2_cost_degree_and_weight
%%
subplot('Position',[0.2 0.2 0.2 0.2]);
plot(cost_degree{1},LCC_fraction{1},'o','MarkerSize',2);hold on
plot(cost_degree{2},LCC_fraction{2},'d','MarkerSize',2);hold on
plot(cost_degree{3},LCC_fraction{3},'+','MarkerSize',2);hold on
plot(cost_degree{4},LCC_fraction{4},'s','MarkerSize',2);hold on
plot(cost_degree{5},LCC_fraction{5},'x','MarkerSize',2);hold on
plot(cost_degree{6},LCC_fraction{6},'*','MarkerSize',2);hold on
plot(cost_degree{7},LCC_fraction{7},'p','MarkerSize',2);hold on
plot(cost_degree{8},LCC_fraction{8},'h','MarkerSize',2);hold on
plot(cost_degree{9},LCC_fraction{9},'<','MarkerSize',2);hold off
xticks([0:0.2:1]);
legend('DC','BC','CC','EC','ADC','ABC','ACC','AEC','GND','Fontsize',8,'NumColumns',5)
%legend('boxoff')
xlabel('Cost (degree\_based)')
ylabel('GCC Size')

subplot('Position',[0.5 0.2 0.2 0.2]);
plot(fraction_removed{1},LCC_fraction{1},'o','MarkerSize',2);hold on
plot(fraction_removed{2},LCC_fraction{2},'d','MarkerSize',2);hold on
plot(fraction_removed{3},LCC_fraction{3},'+','MarkerSize',2);hold on
plot(fraction_removed{4},LCC_fraction{4},'s','MarkerSize',2);hold on
plot(fraction_removed{5},LCC_fraction{5},'x','MarkerSize',2);hold on
plot(fraction_removed{6},LCC_fraction{6},'*','MarkerSize',2);hold on
plot(fraction_removed{7},LCC_fraction{7},'p','MarkerSize',2);hold on
plot(fraction_removed{8},LCC_fraction{8},'h','MarkerSize',2);hold on
plot(fraction_removed{9},LCC_fraction{9},'<','MarkerSize',2);hold off
xlabel('Fraction Removed Node')
ylabel('GCC Size')
savefig('Figure2Costdegree');

xticks([0:0.2:1]);
%legend('DC','BC','CC','EC','ADC','ABC','ACC','AEC','GND','Fontsize',4)
xlabel('Fraction Removed Node')
ylabel('GCC Size')

savefig('Figure2costdegree');

%%
set(gca,'looseInset',[0 0 0 0])
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);%设置图的位置
set(gcf, 'PaperSize', [25 25]); %Keep the same paper size，设置pdf纸张的大小，
saveas(gcf, 'GCC_degree_based.pdf');%保存命令，即在当前目录下生成名为WithMargin的pdf

%% Figure3_cost_weight
subplot('Position',[0.2 0.2 0.2 0.2]);
plot(cost_weight{1},LCC_fraction_weight{1},'o','MarkerSize',2);hold on
plot(cost_weight{2},LCC_fraction_weight{2},'d','MarkerSize',2);hold on
plot(cost_weight{3},LCC_fraction_weight{3},'+','MarkerSize',2);hold on
plot(cost_weight{4},LCC_fraction_weight{4},'s','MarkerSize',2);hold on
plot(cost_weight{5},LCC_fraction_weight{5},'x','MarkerSize',2);hold on
plot(cost_weight{6},LCC_fraction_weight{6},'*','MarkerSize',2);hold on
plot(cost_weight{7},LCC_fraction_weight{7},'p','MarkerSize',2);hold on
plot(cost_weight{8},LCC_fraction_weight{8},'h','MarkerSize',2);hold on
plot(cost_weight{9},LCC_fraction_weight{9},'<','MarkerSize',2);hold off
xticks([0:0.2:1]);
legend('DC','BC','CC','EC','ADC','ABC','ACC','AEC','GND','Fontsize',8,'NumColumns',5)
xlabel('Cost (weight\_based)')
ylabel('GCC Size');
%legend('boxoff');

subplot('Position',[0.5 0.2 0.2 0.2]);
plot(fraction_removed_weight{1},LCC_fraction_weight{1},'o','MarkerSize',2);hold on
plot(fraction_removed_weight{2},LCC_fraction_weight{2},'d','MarkerSize',2);hold on
plot(fraction_removed_weight{3},LCC_fraction_weight{3},'+','MarkerSize',2);hold on
plot(fraction_removed_weight{4},LCC_fraction_weight{4},'s','MarkerSize',2);hold on
plot(fraction_removed_weight{5},LCC_fraction_weight{5},'x','MarkerSize',2);hold on
plot(fraction_removed_weight{6},LCC_fraction_weight{6},'*','MarkerSize',2);hold on
plot(fraction_removed_weight{7},LCC_fraction_weight{7},'p','MarkerSize',2);hold on
plot(fraction_removed_weight{8},LCC_fraction_weight{8},'h','MarkerSize',2);hold on
plot(fraction_removed_weight{9},LCC_fraction_weight{9},'<','MarkerSize',2);hold off
xticks([0:0.2:1]);
%xlim([0,0.5]);
%legend('DC','BC','CC','EC','ADC','ABC','ACC','AEC','GND','Fontsize',4)
xlabel('Fraction Removed Node')
ylabel('GCC Size')
savefig('Figure3CostWeight');

%%
set(gca,'looseInset',[0 0 0 0])
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);%设置图的位置
set(gcf, 'PaperSize', [25 25]); %Keep the same paper size，设置pdf纸张的大小，
saveas(gcf, 'GCC_weighted_based.pdf');%保存命令，即在当前目录下生成名为WithMargin的pdf



%% 20191204_Figure4_Weighted 
subplot('Position',[0.2 0.2 0.2 0.2]);
plot(cost_weight(1:length(fraction_LCC_weight_based)),fraction_LCC_weight_based,'o','Markersize',2); hold on 
plot(cost_A_weighted,fraction_LCC_A_weight_based,'d','Markersize',2); hold on
plot(cost,gcc,'s','Markersize',2);hold off
legend('WDC','AWDC','GND','Fontsize',8);
xticks([0:0.2:1]);
xlabel('Cost (weight\_based)')
ylabel('GCC size');
legend('boxoff');

subplot('Position',[0.5 0.2 0.2 0.2]);
plot(fraction_removed{1},fraction_LCC_weight_based,'o','Markersize',2); hold on 
plot(fraction_removed{2},fraction_LCC_A_weight_based,'d','Markersize',2); hold on
plot(fraction_removed{3},gcc,'s','Markersize',2);hold off
%legend('WDC','AWDC','GND','Fontsize',4);
xticks([0:0.2:1]);
xlabel('Fraction Removed Node')
ylabel('GCC size');
savefig('Figure4WeightDegree');


%%
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);%设置图的位置
set(gcf, 'PaperSize', [25 25]); %Keep the same paper size，设置pdf纸张的大小，
saveas(gcf, 'Figure4WeightDegree.pdf');%保存命令，即在当前目录下生成名为WithMargin的pdf



%%
subplot('Position',[0.1 0.5 0.2 0.2]);
plot(CostDegD1{1},LCCFracD1{1},'o','MarkerSize',2);hold on
plot(CostDegD1{2},LCCFracD1{2},'d','MarkerSize',2);hold on
plot(CostDegD1{3},LCCFracD1{3},'+','MarkerSize',2);hold on
plot(CostDegD1{4},LCCFracD1{4},'s','MarkerSize',2);hold on
plot(CostDegD1{5},LCCFracD1{5},'x','MarkerSize',2);hold on
plot(CostDegD1{6},LCCFracD1{6},'*','MarkerSize',2);hold on
plot(CostDegD1{7},LCCFracD1{7},'p','MarkerSize',2);hold on
plot(CostDegD1{8},LCCFracD1{8},'h','MarkerSize',2);hold on
plot(CostDegD1{9},LCCFracD1{9},'<','MarkerSize',2);hold on
xticks([0:0.2:1]);
title('day 01-03-2018')
legend('DC','BC','CC','EC','ADC','ABC','ACC','AEC','GND','Fontsize',8,'NumColumns',5)
%legend('boxoff')
xlabel('Cost (degree\_based)')
ylabel('GCC Size')


subplot('Position',[0.4 0.5 0.2 0.2]);
plot(CostDegD2{1},LCCFracD2{1},'o','MarkerSize',2);hold on
plot(CostDegD2{2},LCCFracD2{2},'d','MarkerSize',2);hold on
plot(CostDegD2{3},LCCFracD2{3},'+','MarkerSize',2);hold on
plot(CostDegD2{4},LCCFracD2{4},'s','MarkerSize',2);hold on
plot(CostDegD2{5},LCCFracD2{5},'x','MarkerSize',2);hold on
plot(CostDegD2{6},LCCFracD2{6},'*','MarkerSize',2);hold on
plot(CostDegD2{7},LCCFracD2{7},'p','MarkerSize',2);hold on
plot(CostDegD2{8},LCCFracD2{8},'h','MarkerSize',2);hold on
plot(CostDegD2{9},LCCFracD2{9},'<','MarkerSize',2);hold on
xticks([0:0.2:1]);
%legend('DC','BC','CC','EC','ADC','ABC','ACC','AEC','GND','Fontsize',8,'NumColumns',5)
%legend('boxoff')
title('day 01-09-2018')
xlabel('Cost (degree\_based)')
ylabel('GCC Size')

subplot('Position',[0.7 0.5 0.2 0.2]);
plot(CostDegD3{1},LCCFracD3{1},'o','MarkerSize',2);hold on
plot(CostDegD3{2},LCCFracD3{2},'d','MarkerSize',2);hold on
plot(CostDegD3{3},LCCFracD3{3},'+','MarkerSize',2);hold on
plot(CostDegD3{4},LCCFracD3{4},'s','MarkerSize',2);hold on
plot(CostDegD3{5},LCCFracD3{5},'x','MarkerSize',2);hold on
plot(CostDegD3{6},LCCFracD3{6},'*','MarkerSize',2);hold on
plot(CostDegD3{7},LCCFracD3{7},'p','MarkerSize',2);hold on
plot(CostDegD3{8},LCCFracD3{8},'h','MarkerSize',2);hold on
plot(CostDegD3{9},LCCFracD3{9},'<','MarkerSize',2);hold on
xticks([0:0.2:1]);
%legend('DC','BC','CC','EC','ADC','ABC','ACC','AEC','GND','Fontsize',8,'NumColumns',5)
%legend('boxoff')
title('day 01-01-2019')

xlabel('Cost (degree\_based)')
ylabel('GCC Size')



subplot('Position',[0.1 0.2 0.2 0.2]);
plot(CostWeiD1{1},LCCFracWeiD1{1},'o','MarkerSize',2);hold on
plot(CostWeiD1{2},LCCFracWeiD1{2},'d','MarkerSize',2);hold on
plot(CostWeiD1{3},LCCFracWeiD1{3},'+','MarkerSize',2);hold on
plot(CostWeiD1{4},LCCFracWeiD1{4},'s','MarkerSize',2);hold on
plot(CostWeiD1{5},LCCFracWeiD1{5},'x','MarkerSize',2);hold on
plot(CostWeiD1{6},LCCFracWeiD1{6},'*','MarkerSize',2);hold on
plot(CostWeiD1{7},LCCFracWeiD1{7},'p','MarkerSize',2);hold on
plot(CostWeiD1{8},LCCFracWeiD1{8},'h','MarkerSize',2);hold on
plot(CostWeiD1{9},LCCFracWeiD1{9},'<','MarkerSize',2);hold on
xticks([0:0.2:1]);

%legend('DC','BC','CC','EC','ADC','ABC','ACC','AEC','GND','Fontsize',8,'NumColumns',5)
%legend('boxoff')
xlabel('Cost (weight\_based)')
ylabel('GCC Size')


subplot('Position',[0.4 0.2 0.2 0.2]);
plot(CostWeiD2{1},LCCFracWeiD2{1},'o','MarkerSize',2);hold on
plot(CostWeiD2{2},LCCFracWeiD2{2},'d','MarkerSize',2);hold on
plot(CostWeiD2{3},LCCFracWeiD2{3},'+','MarkerSize',2);hold on
plot(CostWeiD2{4},LCCFracWeiD2{4},'s','MarkerSize',2);hold on
plot(CostWeiD2{5},LCCFracWeiD2{5},'x','MarkerSize',2);hold on
plot(CostWeiD2{6},LCCFracWeiD2{6},'*','MarkerSize',2);hold on
plot(CostWeiD2{7},LCCFracWeiD2{7},'p','MarkerSize',2);hold on
plot(CostWeiD2{8},LCCFracWeiD2{8},'h','MarkerSize',2);hold on
plot(CostWeiD2{9},LCCFracWeiD2{9},'<','MarkerSize',2);hold on
xticks([0:0.2:1]);
%legend('DC','BC','CC','EC','ADC','ABC','ACC','AEC','GND','Fontsize',8,'NumColumns',5)
%legend('boxoff')
xlabel('Cost (weight\_based)')
ylabel('GCC Size')

subplot('Position',[0.7 0.2 0.2 0.2]);
plot(CostWeiD3{1},LCCFracWeiD3{1},'o','MarkerSize',2);hold on
plot(CostWeiD3{2},LCCFracWeiD3{2},'d','MarkerSize',2);hold on
plot(CostWeiD3{3},LCCFracWeiD3{3},'+','MarkerSize',2);hold on
plot(CostWeiD3{4},LCCFracWeiD3{4},'s','MarkerSize',2);hold on
plot(CostWeiD3{5},LCCFracWeiD3{5},'x','MarkerSize',2);hold on
plot(CostWeiD3{6},LCCFracWeiD3{6},'*','MarkerSize',2);hold on
plot(CostWeiD3{7},LCCFracWeiD3{7},'p','MarkerSize',2);hold on
plot(CostWeiD3{8},LCCFracWeiD3{8},'h','MarkerSize',2);hold on
plot(CostWeiD3{9},LCCFracWeiD3{9},'<','MarkerSize',2);hold on
xticks([0:0.2:1]);
%legend('DC','BC','CC','EC','ADC','ABC','ACC','AEC','GND','Fontsize',8,'NumColumns',5)
%legend('boxoff')
xlabel('Cost (weight\_based)')
ylabel('GCC Size')
%%
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);%设置图的位置
set(gcf, 'PaperSize', [25 25]); %Keep the same paper size，设置pdf纸张的大小，
saveas(gcf, 'dynamic_network_three.pdf');%保存命令，即在当前目录下生成名为WithMargin的pdf
