% The following script creates 
lv_x = 1; % Latent variable on x-axis
lv_y = 2; % Latent variable on y-axis
t = 6; % Timepoints

colors = zeros(4,3);

colors(1,:) = [0 0 0]./255; % Color, 0 uM dose
colors(2,:) = [0 0 1]; % Color, 0.5 uM dose
colors(3,:) = [160 89 167]./255; % Color, 2 uM dose
colors(4,:) = [1 0 0]; % Color, 10 uM dose
font_size = 20;

%Calculates the percent variance explained by each latent variable
percent_variance = zeros(3,1);
for i = 1:3
    percent_variance(i,1) = ssy_m(i+1,2)-ssy_m(i,2);
end

% Plot the percent variance explained of each LV
figure(1);
bar(1:3,percent_variance,'FaceColor',[0.5 0.5 0.5],'LineWidth',0.75,'BarWidth',0.95);
set(gca,'FontSize',20,'LineWidth',1,'XTick',[1 2 3],'YTick',0:10:50);
set(findobj(gcf,'type','axes'),'FontWeight','Bold');
title('Percent variance explained','FontSize',14);
xlabel('LV','FontSize',22);
ylabel('Percent variance (%)','FontSize',18);
box off;

% Plot the RMSEP of a the model in a LV 1 model, LV 1+2 model, and LV 3
% model
figure(2);
bar(1:3,Results.RMSEP,'FaceColor',[0 0 0],'LineWidth',0.75,'BarWidth',0.95);
ylim([1.8 2.8]);
set(gca,'FontSize',20,'LineWidth',1,'XTick',[1 2 3],'YTick',[1.8 2.0 2.2 2.4 2.6 2.8]);
set(findobj(gcf,'type','axes'),'FontWeight','Bold');
title('Root mean square error of prediction','FontSize',14);
xlabel('LV','FontSize',22);
ylabel('RMSEP','FontSize',18);
box off;

% Shaping data for scatter plots
calib_plot = reshape(calibrated,4,10*6);
val_plot = reshape(xvalypred,4,10*6);
pred_calib_val = zeros(4,60);

exp_val = zeros(4,60);
exp_sem = zeros(4,60);

pred_calib_val(:,1:6) = calib_plot(:,1:6);

marker_symbols = cell(10,1);
marker_symbols{1,1} = 'h';
marker_symbols{2,1} = '*';
marker_symbols{3,1} = 'o';
marker_symbols{4,1} = 'o';
marker_symbols{5,1} = 'o';
marker_symbols{6,1} = 'd';
marker_symbols{7,1} = '^';
marker_symbols{8,1} = '^';
marker_symbols{9,1} = 's';
marker_symbols{10,1} = 's';

count = 1;
for i = 2:11
    for j = [2,6,10,14,18,22]
        exp_val(1,count) = Responses_raw_data_no_logit{j,i};
        exp_val(2,count) = Responses_raw_data_no_logit{j+1,i};
        exp_val(3,count) = Responses_raw_data_no_logit{j+2,i};
        exp_val(4,count) = Responses_raw_data_no_logit{j+3,i};
        
        exp_sem(1,count) = Responses_sem_no_logit{j,i};
        exp_sem(2,count) = Responses_sem_no_logit{j+1,i};
        exp_sem(3,count) = Responses_sem_no_logit{j+2,i};
        exp_sem(4,count) = Responses_sem_no_logit{j+3,i};
        count = count + 1;
    end
end

% Converting predicted values from calibration and validation models from
% logit() transformed values to percent positive
for i = 7:60
    for j = 1:4
        pred_calib_val(j,i) = exp(calib_plot(j,i))/(1+exp(calib_plot(j,i)))*100;
        val_plot(j,i) = exp(val_plot(j,i))/(1+exp(val_plot(j,i)))*100;
    end
end

exp_flat = reshape(exp_val,1,240);
calib_flat = reshape(pred_calib_val,1,240);
val_flat = reshape(val_plot,1,240);

size = [75,150,225,300,375,450];
counter = 1;
h = zeros(10,1);
s = zeros(6,1);

order = [13,19,25,31,37,43,49,55,1,7];
order_2 = [3,4,5,6,7,8,9,10,1,2];

R_2 = 1 - sum((exp_flat-calib_flat).^2)/sum((exp_flat-mean(calib_flat)).^2); % Model R^2
corr_1 = corrcoef(exp_flat,calib_flat); % Pearson correlation of calibration model
% Below generates experimental vs predicted scatter plot from the
% calibration model
fig = figure(3);
ax(1) = axes(fig);
for i = order
    if order_2(counter) == 2
        s1 = scatter(pred_calib_val(1,i:(i+5)),exp_val(1,i:(i+5)),size,colors(1,:),marker_symbols{order_2(counter),1},'MarkerEdgeColor',colors(1,:),'LineWidth',2.5);
        hold on;
        e1 = errorbar(pred_calib_val(1,i:(i+5)),exp_val(1,i:(i+5)),exp_sem(1,i:(i+5)),'LineStyle','none');
        e1.Color = 'k';
        e1.LineWidth = 1;
        s2 = scatter(pred_calib_val(2,i:(i+5)),exp_val(2,i:(i+5)),size,colors(2,:),marker_symbols{order_2(counter),1},'MarkerEdgeColor',colors(2,:),'LineWidth',2.5);
        e2 = errorbar(pred_calib_val(2,i:(i+5)),exp_val(2,i:(i+5)),exp_sem(2,i:(i+5)),'LineStyle','none');
        e2.Color = 'k';
        e2.LineWidth = 1;
        s3 = scatter(pred_calib_val(3,i:(i+5)),exp_val(3,i:(i+5)),size,colors(3,:),marker_symbols{order_2(counter),1},'MarkerEdgeColor',colors(3,:),'LineWidth',2.5);
        e3 = errorbar(pred_calib_val(3,i:(i+5)),exp_val(3,i:(i+5)),exp_sem(3,i:(i+5)),'LineStyle','none');
        e3.Color = 'k';
        e3.LineWidth = 1;
        s4 = scatter(pred_calib_val(4,i:(i+5)),exp_val(4,i:(i+5)),size,colors(4,:),marker_symbols{order_2(counter),1},'MarkerEdgeColor',colors(4,:),'LineWidth',2.5);
        e4 = errorbar(pred_calib_val(4,i:(i+5)),exp_val(4,i:(i+5)),exp_sem(4,i:(i+5)),'LineStyle','none');
        e4.Color = 'k';
        e4.LineWidth = 1;
        set(gca,'FontSize',14,'LineWidth',1);
        set(findobj(gcf,'type','axes'),'FontWeight','Bold','XTick',0:20:100,'YTick',0:20:100);
        title('Calibration model values','FontSize',14);
        xlabel({'Predicted values','(fold-change or % positive)'},'FontSize',14);
        ylabel({'Experimental values','(fold-change or % positive'},'FontSize',14);
        annotation('textbox',[0.7,0.2,0.2,0.2],'String', {strcat('R^2 = ',num2str(R_2)),strcat('r = ',num2str(corr_1(1,2)))},'FitBoxToText','on');
        xlim([-0.5 100]);
        ylim([-0.5 100]);
        h(counter) = scatter(pred_calib_val(1,i:(i+5)),exp_val(1,i:(i+5)),100,colors(1,:),marker_symbols{order_2(counter),1},'MarkerEdgeColor',colors(1,:),'LineWidth',0.5);
    else
        s1 = scatter(pred_calib_val(1,i:(i+5)),exp_val(1,i:(i+5)),size,colors(1,:),marker_symbols{order_2(counter),1},'filled','MarkerEdgeColor','k','LineWidth',0.75);
        hold on;
        s1.MarkerFaceAlpha = 0.8;
        e1 = errorbar(pred_calib_val(1,i:(i+5)),exp_val(1,i:(i+5)),exp_sem(1,i:(i+5)),'LineStyle','none');
        e1.Color = 'k';
        e1.LineWidth = 1;
        s2 = scatter(pred_calib_val(2,i:(i+5)),exp_val(2,i:(i+5)),size,colors(2,:),marker_symbols{order_2(counter),1},'filled','MarkerEdgeColor','k','LineWidth',0.75);
        s2.MarkerFaceAlpha = 0.8;
        e2 = errorbar(pred_calib_val(2,i:(i+5)),exp_val(2,i:(i+5)),exp_sem(2,i:(i+5)),'LineStyle','none');
        e2.Color = 'k';
        e2.LineWidth = 1;
        s3 = scatter(pred_calib_val(3,i:(i+5)),exp_val(3,i:(i+5)),size,colors(3,:),marker_symbols{order_2(counter),1},'filled','MarkerEdgeColor','k','LineWidth',0.75);
        s3.MarkerFaceAlpha = 0.8;
        e3 = errorbar(pred_calib_val(3,i:(i+5)),exp_val(3,i:(i+5)),exp_sem(3,i:(i+5)),'LineStyle','none');
        e3.Color = 'k';
        e3.LineWidth = 1;
        s4 = scatter(pred_calib_val(4,i:(i+5)),exp_val(4,i:(i+5)),size,colors(4,:),marker_symbols{order_2(counter),1},'filled','MarkerEdgeColor','k','LineWidth',0.75);
        s4.MarkerFaceAlpha = 0.8;
        e4 = errorbar(pred_calib_val(4,i:(i+5)),exp_val(4,i:(i+5)),exp_sem(4,i:(i+5)),'LineStyle','none');
        e4.Color = 'k';
        e4.LineWidth = 1;
        set(gca,'FontSize',14,'LineWidth',1);
        set(findobj(gcf,'type','axes'),'FontWeight','Bold','XTick',0:20:100,'YTick',0:20:100);
        title('Calibration model values','FontSize',18);
        xlabel({'Predicted values','(fold-change or % positive)'},'FontSize',14);
        ylabel({'Experimental values','(fold-change or % positive'},'FontSize',14);
        annotation('textbox',[0.7,0.2,0.2,0.2],'String', {strcat('R^2 = ',num2str(R_2)),strcat('r = ',num2str(corr_1(1,2)))},'FitBoxToText','on');
        xlim([-0.5 100]);
        ylim([-0.5 100]);
        if order_2(counter) == 3
            sp_1=s1;
            sp_2=s2;
            sp_3=s3;
            sp_4=s4;
        end
        h(counter) = scatter(pred_calib_val(1,i:(i+5)),exp_val(1,i:(i+5)),100,colors(1,:),marker_symbols{order_2(counter),1},'filled','MarkerEdgeColor','k','LineWidth',0.75);
    end
    counter = counter+1;
end


Q_2 = 1 - sum((exp_flat-val_flat).^2)/sum((exp_flat-mean(val_flat)).^2); % Q^2 of validation model
corr_2 = corrcoef(exp_flat,val_flat); % Pearson correlation for the vakudation model

counter = 1;
% Below generates experimental vs predicted scatter plot from the
% cross-validation model
fig = figure(4);
ax(2) = axes(fig);
for i = order
    if order_2(counter) == 2
        s1 = scatter(val_plot(1,i:(i+5)),exp_val(1,i:(i+5)),size,colors(1,:),marker_symbols{order_2(counter),1},'MarkerEdgeColor',colors(1,:),'LineWidth',2.5);
        hold on;
        e1 = errorbar(val_plot(1,i:(i+5)),exp_val(1,i:(i+5)),exp_sem(1,i:(i+5)),'LineStyle','none');
        e1.Color = 'k';
        e1.LineWidth = 1;
        s2 = scatter(val_plot(2,i:(i+5)),exp_val(2,i:(i+5)),size,colors(2,:),marker_symbols{order_2(counter),1},'MarkerEdgeColor',colors(2,:),'LineWidth',2.5);
        e2 = errorbar(val_plot(2,i:(i+5)),exp_val(2,i:(i+5)),exp_sem(2,i:(i+5)),'LineStyle','none');
        e2.Color = 'k';
        e2.LineWidth = 1;
        s3 = scatter(val_plot(3,i:(i+5)),exp_val(3,i:(i+5)),size,colors(3,:),marker_symbols{order_2(counter),1},'MarkerEdgeColor',colors(3,:),'LineWidth',2.5);
        e3 = errorbar(val_plot(3,i:(i+5)),exp_val(3,i:(i+5)),exp_sem(3,i:(i+5)),'LineStyle','none');
        e3.Color = 'k';
        e3.LineWidth = 1;
        s4 = scatter(val_plot(4,i:(i+5)),exp_val(4,i:(i+5)),size,colors(4,:),marker_symbols{order_2(counter),1},'MarkerEdgeColor',colors(4,:),'LineWidth',2.5);
        e4 = errorbar(val_plot(4,i:(i+5)),exp_val(4,i:(i+5)),exp_sem(4,i:(i+5)),'LineStyle','none');
        e4.Color = 'k';
        e4.LineWidth = 1;
        set(gca,'FontSize',14,'LineWidth',1);
        set(findobj(gcf,'type','axes'),'FontWeight','Bold','XTick',0:20:100,'YTick',0:20:100);
        title('Cross-validation model values','FontSize',14);
        xlabel({'Predicted values','(fold-change or % positive)'},'FontSize',14);
        ylabel({'Experimental values','(fold-change or % positive'},'FontSize',14);
        annotation('textbox',[0.7,0.2,0.2,0.2],'String', {strcat('Q^2 = ',num2str(Q_2)),strcat('r = ',num2str(corr_2(1,2)))},'FitBoxToText','on');
        xlim([-0.5 100]);
        ylim([-0.5 100]);
    else
        s1 = scatter(val_plot(1,i:(i+5)),exp_val(1,i:(i+5)),size,colors(1,:),marker_symbols{order_2(counter),1},'filled','MarkerEdgeColor','k','LineWidth',0.75);
        hold on;
        s1.MarkerFaceAlpha = 0.8;
        e1 = errorbar(val_plot(1,i:(i+5)),exp_val(1,i:(i+5)),exp_sem(1,i:(i+5)),'LineStyle','none');
        e1.Color = 'k';
        e1.LineWidth = 1;
        s2 = scatter(val_plot(2,i:(i+5)),exp_val(2,i:(i+5)),size,colors(2,:),marker_symbols{order_2(counter),1},'filled','MarkerEdgeColor','k','LineWidth',0.75);
        s2.MarkerFaceAlpha = 0.8;
        e2 = errorbar(val_plot(2,i:(i+5)),exp_val(2,i:(i+5)),exp_sem(2,i:(i+5)),'LineStyle','none');
        e2.Color = 'k';
        e2.LineWidth = 1;
        s3 = scatter(val_plot(3,i:(i+5)),exp_val(3,i:(i+5)),size,colors(3,:),marker_symbols{order_2(counter),1},'filled','MarkerEdgeColor','k','LineWidth',0.75);
        s3.MarkerFaceAlpha = 0.8;
        e3 = errorbar(val_plot(3,i:(i+5)),exp_val(3,i:(i+5)),exp_sem(3,i:(i+5)),'LineStyle','none');
        e3.Color = 'k';
        e3.LineWidth = 1;
        s4 = scatter(val_plot(4,i:(i+5)),exp_val(4,i:(i+5)),size,colors(4,:),marker_symbols{order_2(counter),1},'filled','MarkerEdgeColor','k','LineWidth',0.75);
        s4.MarkerFaceAlpha = 0.8;
        e4 = errorbar(val_plot(4,i:(i+5)),exp_val(4,i:(i+5)),exp_sem(4,i:(i+5)),'LineStyle','none');
        e4.Color = 'k';
        e4.LineWidth = 1;
        set(gca,'FontSize',14,'LineWidth',1);
        set(findobj(gcf,'type','axes'),'FontWeight','Bold','XTick',0:20:100,'YTick',0:20:100);
        title('Cross-validation model values','FontSize',14);
        xlabel({'Predicted values','(fold-change or % positive)'},'FontSize',14);
        ylabel({'Experimental values','(fold-change or % positive'},'FontSize',14);
        annotation('textbox',[0.7,0.2,0.2,0.2],'String', {strcat('Q^2 = ',num2str(Q_2)),strcat('r = ',num2str(corr_2(1,2)))},'FitBoxToText','on');
        xlim([-0.5 100]);
        ylim([-0.5 100]);
        if order_2(counter) == 3
            sp_1=s1;
            sp_2=s2;
            sp_3=s3;
            sp_4=s4;
        end
        h(counter) = scatter(val_plot(1,i:(i+5)),exp_val(1,i:(i+5)),100,colors(1,:),marker_symbols{order_2(counter),1},'filled','MarkerEdgeColor','k','LineWidth',0.75);
    end
    counter = counter+1;
end

% Signal treatment scores plotted on LV2 vs LV1
figure(5);
s1 = scatter(Xfactors{1}(1,lv_x),Xfactors{1}(1,lv_y),150,colors(1,:),'filled','MarkerEdgeColor','k');
hold on;
s2 = scatter(Xfactors{1}(2,lv_x),Xfactors{1}(2,lv_y),150,colors(2,:),'filled','MarkerEdgeColor','k');
s3 = scatter(Xfactors{1}(3,lv_x),Xfactors{1}(3,lv_y),150,colors(3,:),'filled','MarkerEdgeColor','k');
s4 = scatter(Xfactors{1}(4,lv_x),Xfactors{1}(4,lv_y),150,colors(4,:),'filled','MarkerEdgeColor','k');
xlim([-6 6]);
set(gca, 'XTick', [-6 -4 -2 0 2 4 6])
xlabel('Latent variable #1');
ylim([-6 6]);
set(gca, 'YTick', [-6 -4 -2 0 2 4 6]);
ylabel('Latent variable #2');
yline(0, '--','Color',[0.5 0.5 0.5],'LineWidth',2);
xline(0, '--','Color',[0.5 0.5 0.5],'LineWidth',2);
title('Scores (s_x)');
set(gca,'FontSize',font_size,'LineWidth',1);
set(findobj(gcf,'type','axes'),'FontWeight','Bold');
l = legend([s1 s2 s3 s4],{'DMSO','0.5 µM','2 µM','10 µM'},'Location','bestoutside');
l.FontWeight = 'normal';

% Labels of signals
signal_labels{1,1} = 'Cyclin A, cyto';
signal_labels{2,1} = 'Cyclin B,cyto';
signal_labels{3,1} = 'IKBa, cyto';
signal_labels{4,1} = 'NF-kB, cyto';
signal_labels{5,1} = 'p-Akt, cyto';
signal_labels{6,1} = 'p-Erk, cyto';
signal_labels{7,1} = 'p-Hsp27, cyto';
signal_labels{8,1} = 'p-Jnk, cyto';
signal_labels{9,1} = 'p-p38, cyto';
signal_labels{10,1} = 'p-S6, cyto';
signal_labels{11,1}= 'Cyclin A, nuclear';
signal_labels{12,1} = 'Cyclin B, nuclear';
signal_labels{13,1} = 'Cyclin D, nuclear';
signal_labels{14,1} = 'Cyclin E, nuclear';
signal_labels{15,1} = 'gamma-H2AX, nuclear';
signal_labels{16,1} = 'NF-kB, nuclear';
signal_labels{17,1} = 'p21, nuclear';
signal_labels{18,1} = 'p27, nuclear';
signal_labels{19,1} = 'p53, nuclear';
signal_labels{20,1} = 'p-Akt, nuclear';
signal_labels{21,1} = 'p-Chk2, nuclear';
signal_labels{22,1} = 'p-Erk, nuclear';
signal_labels{23,1} = 'p-Jnk, nuclear';
signal_labels{24,1} = 'p-c-Jun, nuclear';
signal_labels{25,1} = 'p-p38, nuclear';
signal_labels{26,1} = 'p-Rb, nuclear';

% Signals weights plotted on LV2 vs LV1
figure(6)
c_2 = zeros(26,3);
c_text = zeros(26,3);
%Proliferative signals
p = [3,13];
for i = p
    c_2(i,:) = colors(1,:);
end
%Senescent signals
s = [11,14,17,19,21,24,26];
for i = s
    c_2(i,:) = colors(2,:);
end
%Apoptotic signals
a = [7,15,22,23,25];
for i = a
    c_2(i,:) = colors(4,:);
end
%Not significant
ns = [1,2,4,5,6,8,9,10,12,16,18,20];
sig = [3,11,13,14,15,17,19,21,22,23,24,25];
for i = ns
    c_2(i,:) = [0.5 0.5 0.5];
    c_text(i,:) = [0.5 0.5 0.5];
end
clear p; clear s; clear a; 
text_place = [Xfactors{3}(:,lv_x)+0.0065 Xfactors{3}(:,lv_y)];

x_mean = mean(reshape(Xfactors{3}(:,lv_x),1,26)); % Mean of the LV1 signal weights
x_std = std(reshape(Xfactors{3}(:,lv_x),1,26)); % The standard deviation of the LV1 weights
line([x_mean,x_mean],[-0.5,0.5],'Color',[0.5 0.5 0.5],'LineWidth',1.5);% Solid gray vertical line
hold on;
line([x_mean+x_std,x_mean+x_std],[-0.5,0.5],'Color',[0.5 0.5 0.5],'LineWidth',1.5,'LineStyle','--'); % + 1 SD (dashed gray vertical line)
line([x_mean-x_std,x_mean-x_std],[-0.5,0.5],'Color',[0.5 0.5 0.5],'LineWidth',1.5,'LineStyle','--'); % - 1 SD (dashed gray vertical line)
y_mean = mean(reshape(Xfactors{3}(:,lv_y),1,26)); % Mean of the LV2 signal weights
y_std = std(reshape(Xfactors{3}(:,lv_y),1,26)); % The standard deviation of the LV2 signal weights
line([-0.2,0.4],[y_mean,y_mean],'Color',[0.5 0.5 0.5],'LineWidth',1.5); % Solid gray horozontal line
line([-0.2,0.4],[y_mean+y_std,y_mean+y_std],'Color',[0.5 0.5 0.5],'LineWidth',1.5,'LineStyle','--'); % + 1 SD (dashed gray horozontal line)
line([-0.2,0.4],[y_mean-y_std,y_mean-y_std],'Color',[0.5 0.5 0.5],'LineWidth',1.5,'LineStyle','--'); % - 1 SD (dashed gray horozontal line)
scatter(Xfactors{3}(:,lv_x),Xfactors{3}(:,lv_y),75,c_2,'filled','MarkerEdgeColor','k'); % Plots scatter plot of weights
text(text_place(:,1),text_place(:,2),signal_labels,'Fontsize',10,'VerticalAlignment','bottom','HorizontalAlignment','left','FontWeight','bold'); % Text labels
xlim([-0.2,0.4]);
ylim([-0.5,0.5]);
set(gca, 'YTick', -0.5:0.1:0.5);
xlabel('Latent variable #1');
ylabel('Latent variable #2');
set(gca,'FontSize',font_size,'LineWidth',1);
set(findobj(gcf,'type','axes'),'FontWeight','Bold');
set(gcf,'Position',[700,300,700,600]);
title('Signal weights (w_s_x)');

% Response labels
response_labels{1,1} = 'Proliferation';
response_labels{2,1} = 'Apoptosis';
response_labels{3,1} = 'G1';
response_labels{4,1} = 'S';
response_labels{5,1} = 'G2';
response_labels{6,1} = 'Endo';
response_labels{7,1} = 'Cyclin B+';
response_labels{8,1} = 'G2 Cyclin B-';
response_labels{9,1} = 'G1 p21+';
response_labels{10,1} = 'G2 p21+';

% Colors for significantly weighted response weights
ns_1 = [3,4,6,7,8,9];
c_3 = zeros(10,3);
c_3(2,:) = colors(4,:);
c_3(5,:) = colors(2,:);
c_3(10,:) = colors(2,:);
for i = ns_1
    c_3(i,:) = [0.5 0.5 0.5];
end

% Response weights are plotted on LV2 vs LV1
figure(7)
x_mean = mean(reshape(shuff_resp_weights(:,1:10,lv_x),1,10*500)); % Mean of the LV1 null model
x_std = std(reshape(shuff_resp_weights(:,1:10,lv_x),1,10*500)); % The standard deviation of the LV1 null model
line([x_mean,x_mean],[-1,1],'Color',[0.5 0.5 0.5],'LineWidth',1.5);% Solid gray vertical line
hold on;
line([x_mean+x_std,x_mean+x_std],[-1,1],'Color',[0.5 0.5 0.5],'LineWidth',1.5,'LineStyle','--'); % + 1 SD (dashed gray vertical line)
line([x_mean-x_std,x_mean-x_std],[-1,1],'Color',[0.5 0.5 0.5],'LineWidth',1.5,'LineStyle','--'); % - 1 SD (dashed gray vertical line)
y_mean = mean(reshape(shuff_resp_weights(:,1:10,lv_y),1,10*500)); % Mean of the LV2 null model
y_std = std(reshape(shuff_resp_weights(:,1:10,lv_y),1,10*500)); % The standard deviation of the LV2 null model
line([-1,1],[y_mean,y_mean],'Color',[0.5 0.5 0.5],'LineWidth',1.5); % Solid gray horozontal line
line([-1,1],[y_mean+y_std,y_mean+y_std],'Color',[0.5 0.5 0.5],'LineWidth',1.5,'LineStyle','--'); % + 1 SD (dashed gray horozontal line)
line([-1,1],[y_mean-y_std,y_mean-y_std],'Color',[0.5 0.5 0.5],'LineWidth',1.5,'LineStyle','--'); % - 1 SD (dashed gray horozontal line)
scatter(Yfactors{3}(:,lv_x),Yfactors{3}(:,lv_y),75,c_3,'filled','MarkerEdgeColor','k'); % Scatter plot of response weights
text(Yfactors{3}(:,lv_x)+0.015,Yfactors{3}(:,lv_y),response_labels,'Fontsize',10,'VerticalAlignment','bottom','HorizontalAlignment','left','FontWeight','bold'); % Text labels
xlim([-0.6,0.6]);
ylim([-0.6,0.8]);
set(gca, 'YTick', -0.6:0.2:0.8);
xlabel('Latent variable #1');
ylabel('Latent variable #2');
set(gca,'FontSize',font_size,'LineWidth',1);
set(findobj(gcf,'type','axes'),'FontWeight','Bold');
set(gcf,'Position',[700,300,700,600]);
title('Response weights (w_s_y)');

% The following code calculates the VIP scores from the signal weights
model.Xfactors=Xfactors;
model.Yfactors=Yfactors;
model.B=B;
VIPscores = VIPnway(model, 'nway', 0);
VIP_score = cell(2,26);
VIP_score(1,:) = signal_labels;
temp = cell2mat(VIPscores.all(1,3))';

for i = 1:26
    VIP_score{2,i} = sqrt(temp(1,i));
end

[~,order] = sort(cell2mat(VIP_score(2,:)),'descend');
VIP_score = VIP_score(:,order);

colors = zeros(4,3);
colors(1,:) = [0 0 0]./255;
colors(2,:) = [0 0 1];
colors(3,:) = [160 89 167]./255;
colors(4,:) = [1 0 0]; 
grey = [205 205 205]./255;

% This plots the VIP scores ordered from greatest to least as a bar plot
figure(8)
labels = categorical(VIP_score(1,:));
labels = reordercats(labels,VIP_score(1,:));
b = bar(cell2mat(VIP_score(2,:)),'FaceColor','flat','BarWidth',0.95);
b.CData(1,:) = colors(2,:);
b.CData(2,:) = colors(2,:);
b.CData(3,:) = colors(2,:);
b.CData(4,:) = colors(2,:);
b.CData(5,:) = colors(2,:);
b.CData(6,:) = colors(4,:);
b.CData(7,:) = colors(1,:);
b.CData(8,:) = colors(2,:);
b.CData(9,:) = colors(2,:);
b.CData(10,:) = colors(1,:);
b.CData(11,:) = grey;
b.CData(12,:) = grey;
b.CData(13,:) = colors(4,:);
b.CData(14,:) = colors(4,:);
b.CData(15,:) = colors(4,:);
b.CData(16,:) = grey;
b.CData(17,:) = grey;
b.CData(18,:) = grey;
b.CData(19,:) = grey;
b.CData(20,:) = grey;
b.CData(21,:) = colors(4,:);
b.CData(22,:) = grey;
b.CData(23,:) = grey;
b.CData(24,:) = grey;
b.CData(25,:) = grey;
b.CData(26,:) = grey;
ax = gca;
ax.XTickLabelRotation = 45;
ax.YAxis.FontSize = 45;
ax.XTick = 1:26;
ax.XTickLabel = labels;
set(gca,'TickLength',[0,0]);
set(gca,'FontSize',10,'LineWidth',1);
set(gca,'fontweight','bold');
set(findobj(gcf,'type','axes'),'FontWeight','Bold');
title('VIP Scores','FontSize',18);

clear ans ax b B B_s c_2 c_3 c_text colors count counter e1 e2 e3 e4 font_size...
    grey h i j l labels lv_x lv_y marker_symbols ns ns_1 order order_2 s1 s2 s3 s4...
    sig sp_1 sp_2 sp_3 sp_4 t text_place x_mean x_std y_mean y_std







