close all; clc;

methods = {'OLLAWV','NNISDA','MNSVM','$k$NN','J48','JRip','Na\"{i}ve Bayes','Logistic'};
accuracy = [91.29 91.15 91.25 90.05 84.6 86.18 79.96 84.45];
methods2 = methods(2:end);
c = categorical(methods2,'Ordinal',true);
c = reordercats(c,{'NNISDA' 'MNSVM' '$k$NN' 'J48' 'JRip' 'Na\"{i}ve Bayes' 'Logistic'});

accuracyFigure = figure; hold on; grid minor; 
bar(ones(7,1).*91.3,'FaceColor',[.5 .5 .5],'EdgeColor',[.5 .5 .5]);

for i = 2:8
    b(i) = bar(i-1, accuracy(i), 'BarWidth', 0.65);
    %faceColor = b(i).FaceColor;
    %set(b(i),'EdgeColor',faceColor);
end

xlim([0.1 7.9]);

title('Mean Accuracy (\%) Over All Datasets','Interpreter','latex','FontSize',11.5);
ylabel('Mean Accuracy (\%)','Interpreter','latex','FontSize',11.5);
set(gca,'xticklabel',methods(2:end));
set(gca,'TickLabelInterpreter','latex','FontSize',11.5);
ylim([78 100]);
lgd = legend({'OLLAWV','NNISDA','MNSVM','$k$NN','J48','JRip','Na\"{i}ve Bayes','Logistic'},'Interpreter','latex');
lgd.FontSize = 11.5;
saveas(accuracyFigure,'../figures/mean_accuracy','epsc');

%%
methods = {'OLLAWV','NNISDA','MNSVM'};
percentSV = [25.66 44.65 43.79];

svFigure = figure; hold on; grid minor; 
b = bar(1,25.66,'FaceColor',[.5 .5 .5],'EdgeColor',[.5 .5 .5]); % ollawv
bar(2,25.66);
bar(3,25.66);

xticks([1 2 3]); ylim([0 40]);
title('Mean Support Vectors (\%) Over All Datasets','Interpreter','latex','FontSize',11.5);
ylabel('Mean Support Vectors (\%)','Interpreter','latex','FontSize',11.5);
set(gca,'xticklabel',methods(1:end));
set(gca,'TickLabelInterpreter','latex','FontSize',11.5);
lgd = legend({'OLLAWV','NNISDA','MNSVM'},'Interpreter','latex');
lgd.FontSize = 11.5;
saveas(svFigure,'../figures/mean_sv','epsc');

%% 
methods = {'OLLAWV','NNISDA','MNSVM'};

timeFigure = figure; hold on; grid minor; 
b = bar(1,111209,'FaceColor',[.5 .5 .5],'EdgeColor',[.5 .5 .5]); % ollawv
bar(2,221350);
bar(3,191861);

xticks([1 2 3]); ylim([0 240000]);
title('Mean Run Time (s) Over All Datasets','Interpreter','latex','FontSize',11.5);
ylabel('Mean Run Time (s)','Interpreter','latex','FontSize',11.5);
set(gca,'xticklabel',methods(1:end));
set(gca,'TickLabelInterpreter','latex','FontSize',11.5);
lgd = legend({'OLLAWV','NNISDA','MNSVM'},'Interpreter','latex');
lgd.FontSize = 11.5;
saveas(timeFigure,'../figures/mean_time','epsc');
