Signals_PCA = zscore(cell2mat(Signals_raw_data(2:25,2:27)));
Signals_PCA = reshape(Signals_PCA,4,26*6); %Reshape the data so that doses are rows and timepoints and signals are columns

[coeff,score,~,~,explained] = pca(Signals_PCA,'Centered',false); %PCA

pca_signals = cell(26,2);

colors = zeros(4,3);

colors(1,:) = [0 0 0]./255;
colors(2,:) = [0 0 1];
colors(3,:) = [160 89 167]./255;
colors(4,:) = [252 77 59]./255; 

%PCA scores
figure;
scatter(score(1,1),-score(1,2),300,colors(1,:),'filled','MarkerEdgeColor','k','LineWidth',0.75);
hold on;
scatter(score(2,1),-score(2,2),300,colors(2,:),'filled','MarkerEdgeColor','k','LineWidth',0.75);
scatter(score(3,1),-score(3,2),300,colors(3,:),'filled','MarkerEdgeColor','k','LineWidth',0.75);
scatter(score(4,1),-score(4,2),300,colors(4,:),'filled','MarkerEdgeColor','k','LineWidth',0.75);
plot([0,score(2,1)],[0,-score(2,2)],'k');
plot([0,score(4,1)],[0,-score(4,2)],'k');
xlim([-5,15]);
ylim([-15, 10]);
title('Scores');
xlabel('PC 1');
ylabel('PC 2');
set(gca,'FontSize',36,'LineWidth',1,'XTick',-10:5:15,'YTick',-10:5:10);
set(findobj(gcf,'type','axes'),'FontWeight','Bold');

pca_signals{1,1} = Signals_raw_data{1,2};
pca_signals{1,2} = coeff(1:6,:);
pca_signals{2,1} = Signals_raw_data{1,3};
pca_signals{2,2} = coeff(7:12,:);
pca_signals{3,1} = Signals_raw_data{1,4};
pca_signals{3,2} = coeff(13:18,:);
pca_signals{4,1} = Signals_raw_data{1,5};
pca_signals{4,2} = coeff(19:24,:);
pca_signals{5,1} = Signals_raw_data{1,6};
pca_signals{5,2} = coeff(25:30,:);
pca_signals{6,1} = Signals_raw_data{1,7};
pca_signals{6,2}= coeff(31:36,:);
pca_signals{7,1} = Signals_raw_data{1,8};
pca_signals{7,2} = coeff(37:42,:);
pca_signals{8,1} = Signals_raw_data{1,9};
pca_signals{8,2} = coeff(43:48,:);
pca_signals{9,1} = Signals_raw_data{1,10};
pca_signals{9,2} = coeff(49:54,:);
pca_signals{10,1} = Signals_raw_data{1,11};
pca_signals{10,2} = coeff(55:60,:);
pca_signals{11,1}= Signals_raw_data{1,12};
pca_signals{11,2} = coeff(61:66,:);
pca_signals{12,1} = Signals_raw_data{1,13};
pca_signals{12,2} = coeff(67:72,:);
pca_signals{13,1} = Signals_raw_data{1,14};
pca_signals{13,2} = coeff(73:78,:);
pca_signals{14,1} = Signals_raw_data{1,15};
pca_signals{14,2} = coeff(79:84,:);
pca_signals{15,1} = Signals_raw_data{1,16};
pca_signals{15,2} = coeff(85:90,:);
pca_signals{16,1} = Signals_raw_data{1,17};
pca_signals{16,2} = coeff(91:96,:);
pca_signals{17,1} = Signals_raw_data{1,18};
pca_signals{17,2} = coeff(97:102,:);
pca_signals{18,1} = Signals_raw_data{1,19};
pca_signals{18,2} = coeff(103:108,:);
pca_signals{19,1} = Signals_raw_data{1,20};
pca_signals{19,2} = coeff(109:114,:);
pca_signals{20,1} = Signals_raw_data{1,21};
pca_signals{20,2} = coeff(115:120,:);
pca_signals{21,1} = Signals_raw_data{1,22};
pca_signals{21,2} = coeff(121:126,:);
pca_signals{22,1} = Signals_raw_data{1,23};
pca_signals{22,2} = coeff(127:132,:);
pca_signals{23,1} = Signals_raw_data{1,24};
pca_signals{23,2} = coeff (133:138,:);
pca_signals{24,1} = Signals_raw_data{1,25};
pca_signals{24,2} = coeff(139:144,:);
pca_signals{25,1} = Signals_raw_data{1,26};
pca_signals{25,2} = coeff(145:150,:);
pca_signals{26,1} = Signals_raw_data{1,27};
pca_signals{26,2} = coeff(151:156,:);

size = [75,150,300,450,700,900];
axis_font = 40;

s_vector = [score(2,1),-score(2,2),0];
a_vector = [score(4,1),-score(4,2),0];

t = [6,12,24,48,72,96];
fate_values = cell(26,2);

%Calculation of the projections along the senescence axis (s_vector) and
%the apoptosis axis (a_vector)
for i = 1:26
    temp = zeros(6,2);
    for j = 1:6
        temp(j,1) = cos(atan2(norm(cross(s_vector,[pca_signals{i,2}(j,1),-pca_signals{i,2}(j,2),0])),dot(s_vector,[pca_signals{i,2}(j,1),-pca_signals{i,2}(j,2),0])));
        temp(j,2) = cos(atan2(norm(cross(a_vector,[pca_signals{i,2}(j,1),-pca_signals{i,2}(j,2),0])),dot(a_vector,[pca_signals{i,2}(j,1),-pca_signals{i,2}(j,2),0])));
    end
    fate_values{i,1} = temp(:,1);
    fate_values{i,2} = temp(:,2);
end


% Plotting senescent signals
for i = [11,14,24]
    figure;
    subplot(2,1,1);
    scatter(pca_signals{i,2}(:,1),-pca_signals{i,2}(:,2),size,'k','filled','MarkerEdgeColor','w','LineWidth',0.75);
    hold on;
    plot([0,score(2,1)],[0,-score(2,2)],'k');
    plot([0,score(4,1)],[0,-score(4,2)],'k');
    title(pca_signals{i,1});
    xlim([-0.3,0.3]);
    ylim([-0.3,0.3]);
    xticks(-0.3:0.1:0.3);
    yticks(-0.3:0.1:0.3);
    title(pca_signals{i,1});
    xlabel('PC 1');
    ylabel('PC 2');
    set(gca,'FontSize',12,'LineWidth',1)
    subplot(2,1,2);
    plot(t,fate_values{i,1},'-ob','Linewidth',2);
    hold on;
    plot(t,fate_values{i,2},'-or','Linewidth',2);
    yline(0,'k');
    xlim([0,96]);
    ylim([-1,1]);
    xlabel('Time (hrs)');
    ylabel('cos(theta)');
    set(gca,'FontSize',12,'LineWidth',1,'XTick',t,'YTick',-1:0.2:1,'box','off');

end

%Plotting survival signals
for i = [3,13]
    figure;
    subplot(2,1,1);
    scatter(pca_signals{i,2}(:,1),-pca_signals{i,2}(:,2),size,'k','filled','MarkerEdgeColor','w','LineWidth',0.75);
    hold on;
    plot([0,score(2,1)],[0,-score(2,2)],'k');
    plot([0,score(4,1)],[0,-score(4,2)],'k');
    title(pca_signals{i,1});
    xlim([-0.3,0.3]);
    ylim([-0.3,0.3]);
    xticks(-0.3:0.1:0.3);
    yticks(-0.3:0.1:0.3);
    title(pca_signals{i,1});
    xlabel('PC 1');
    ylabel('PC 2');
    set(gca,'FontSize',12,'LineWidth',1)
    subplot(2,1,2);
    plot(t,fate_values{i,1},'-ob','Linewidth',2);
    hold on;
    plot(t,fate_values{i,2},'-or','Linewidth',2);
    yline(0,'k');
    xlim([0,96]);
    ylim([-1,1]);
    xlabel('Time (hrs)');
    ylabel('cos(theta)');
    set(gca,'FontSize',12,'LineWidth',1,'XTick',t,'YTick',-1:0.2:1,'box','off');

end

% Plotting apoptotic signals (gamma-H2AX)
i=15;
figure;
subplot(2,1,1);
scatter(pca_signals{i,2}(:,1),-pca_signals{i,2}(:,2),size,'k','filled','MarkerEdgeColor','w','LineWidth',0.75);
hold on;
plot([0,score(2,1)],[0,-score(2,2)],'k');
plot([0,score(4,1)],[0,-score(4,2)],'k');
title(pca_signals{i,1});
xlim([-0.3,0.3]);
ylim([-0.3,0.3]);
xticks(-0.3:0.1:0.3);
yticks(-0.3:0.1:0.3);
title(pca_signals{i,1});
xlabel('PC 1');
ylabel('PC 2');
set(gca,'FontSize',12,'LineWidth',1)
subplot(2,1,2);
plot(t,fate_values{i,1},'-ob','Linewidth',2);
hold on;
plot(t,fate_values{i,2},'-or','Linewidth',2);
yline(0,'k');
xlim([0,96]);
ylim([-1,1]);
xlabel('Time (hrs)');
ylabel('cos(theta)');
set(gca,'FontSize',12,'LineWidth',1,'XTick',t,'YTick',-1:0.2:1,'box','off');

%Plotting the time-dependent signals
for i = [7,26,21,17,19,23,22,25]
    figure;
    subplot(2,1,1);
    scatter(pca_signals{i,2}(:,1),-pca_signals{i,2}(:,2),size,'k','filled','MarkerEdgeColor','w','LineWidth',0.75);
    hold on;
    plot([0,score(2,1)],[0,-score(2,2)],'k');
    plot([0,score(4,1)],[0,-score(4,2)],'k');
    title(pca_signals{i,1});
    xlim([-0.3,0.3]);
    ylim([-0.3,0.3]);
    xticks(-0.3:0.1:0.3);
    yticks(-0.3:0.1:0.3);
    title(pca_signals{i,1});
    xlabel('PC 1');
    ylabel('PC 2');
    set(gca,'FontSize',12,'LineWidth',1)
    subplot(2,1,2);
    plot(t,fate_values{i,1},'-ob','Linewidth',2);
    hold on;
    plot(t,fate_values{i,2},'-or','Linewidth',2);
    yline(0,'k');
    xlim([0,96]);
    ylim([-1,1]);
    xlabel('Time (hrs)');
    ylabel('cos(theta)');
    set(gca,'FontSize',12,'LineWidth',1,'XTick',t,'YTick',-1:0.2:1,'box','off');

end

