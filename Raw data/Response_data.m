prolif = cell(4,6);
prolif{1,1} = [0.84,0.89,1.27];
prolif{2,1} = [0.72,1.08,1.01];
prolif{3,1} = [0.86,0.66,0.74];
prolif{4,1} = [0.43,0.43,0.59];
prolif{1,2} = [0.98,1.01,1.45];
prolif{2,2} = [0.71,1.08,1.01];
prolif{3,2} = [0.76,0.60,0.66];
prolif{4,2} = [0.33,0.33,0.48];
prolif{1,3} = [1.13,1.18,1.66];
prolif{2,3} = [0.72,1.06,1.01];
prolif{3,3} = [0.64,0.47,0.55];
prolif{4,3} = [0.32,0.31,0.42];
prolif{1,4} = [1.66,1.71,1.88];
prolif{2,4} = [0.68,1.01,0.94];
prolif{3,4} = [0.33,0.22,0.20];
prolif{4,4} = [0.12,0.12,0.13];
prolif{1,5} = [2.97,2.63,3.10];
prolif{2,5} = [0.66,0.92,0.87];
prolif{3,5} = [0.26,0.17,0.16];
prolif{4,5} = [0.02,0.02,0.03];
prolif{1,6} = [3.89,3.81,4.22];
prolif{2,6} = [0.61,0.88,0.86];
prolif{3,6} = [0.21,0.13,0.13];
prolif{4,6} = [0.011,0.002,0.008];

Responses.proliferation = prolif;

G1_p21_pos = cell(4,6);
G1_p21_pos{1,1} = [1.48,1.41,1.32];
G1_p21_pos{2,1} = [6.5,6.5,7.04];
G1_p21_pos{3,1} = [4.96,4.19,3.9];
G1_p21_pos{4,1} = [0.918,0.901,1.04];
G1_p21_pos{1,2} = [5.11,2.67,2.79];
G1_p21_pos{2,2} = [10.5,9.37,8.47];
G1_p21_pos{3,2} = [12.9,8.39,4.38];
G1_p21_pos{4,2} = [3.23,1.33,0.46];
G1_p21_pos{1,3} = [9.77,7.33,5.92];
G1_p21_pos{2,3} = [8.18,9.34,8.67];
G1_p21_pos{3,3} = [12.2,8.19,5.11];
G1_p21_pos{4,3} = [3.15,0.64,0.094];
G1_p21_pos{1,4} = [12.8,15.2,6];
G1_p21_pos{2,4} = [7.45,7.8,6.98];
G1_p21_pos{3,4} = [14.5,7.97,5.98];
G1_p21_pos{4,4} = [3.1,2.7,0.14];
G1_p21_pos{1,5} = [1.49,1.65,1.47];
G1_p21_pos{2,5} = [5.56,5.19,7.2];
G1_p21_pos{3,5} = [10.1,9.9,9.82];
G1_p21_pos{4,5} = [0.695,0.66,0.439];
G1_p21_pos{1,6} = [0.607,0.615,0.966];
G1_p21_pos{2,6} = [5.1,3.65,4.76];
G1_p21_pos{3,6} = [11.6,10.9,12.4];
G1_p21_pos{4,6} = [0.697,0.593,0.737];

Responses.G1_p21_pos = G1_p21_pos;

G2_p21_pos = cell(4,6);
G2_p21_pos{1,1} = [0.425,0.665,0.756];
G2_p21_pos{2,1} = [6.58,6.16,7.1];
G2_p21_pos{3,1} = [5.14,4.32,4.45];
G2_p21_pos{4,1} = [0.464,0.545,0.499];
G2_p21_pos{1,2} = [2.13,0.85,0.9];
G2_p21_pos{2,2} = [11.7,12,10.7];
G2_p21_pos{3,2} = [13.1,8.26,8.15];
G2_p21_pos{4,2} = [1.1,0.24,0.43];
G2_p21_pos{1,3} = [3.17,0.87,0.98];
G2_p21_pos{2,3} = [16.2,16.5,14.4];
G2_p21_pos{3,3} = [16.9,16.3,13.9];
G2_p21_pos{4,3} = [2.7,0.11,0.16];
G2_p21_pos{1,4} = [2.45,1.19,0.89];
G2_p21_pos{2,4} = [46.1,49.7,47.3];
G2_p21_pos{3,4} = [54.1,47.2,76.5];
G2_p21_pos{4,4} = [2.24,0.38,0.19];
G2_p21_pos{1,5} = [0.24,0.216,0.224];
G2_p21_pos{2,5} = [62.9,63.1,64.3];
G2_p21_pos{3,5} = [60.9,62.1,61.6];
G2_p21_pos{4,5} = [0.486,0.48,0.405];
G2_p21_pos{1,6} = [0.0852,0.0853,0.105];
G2_p21_pos{2,6} = [75.8,82.6,77.8];
G2_p21_pos{3,6} = [71.6,72.1,70.4];
G2_p21_pos{4,6} = [0.522,0.517,0.582];

Responses.G2_p21_pos = G2_p21_pos;

CC3_CPARP_pos = cell(4,6);
CC3_CPARP_pos{1,1} = [0.59,0.41,0.93,0.99,0.3,0.425,0.48,0.793];
CC3_CPARP_pos{2,1} = [0.2,0.348,0.329];
CC3_CPARP_pos{3,1} = [3.03,3.55,11,4.7,1.99,0.45,0.575,0.438];
CC3_CPARP_pos{4,1} = [5.45,8.88,21,16.8,6.05,8.04,9.38,8.86];
CC3_CPARP_pos{1,2} = [0.87,1.07,0.6,1.09,1];
CC3_CPARP_pos{2,2} = [0.702,0.568,0.618];
CC3_CPARP_pos{3,2} = [11.4,5.19,5.57,9.68,7.37];
CC3_CPARP_pos{4,2} = [18.2,18.1,15.8,24.2,31.2];
CC3_CPARP_pos{1,3} = [1.09,1.09,0.59,1.24,1.43,0.6];
CC3_CPARP_pos{2,3} = [0.347,0.434,0.371];
CC3_CPARP_pos{3,3} = [4.39,5.65,3.46,6.52,3.39,1.68];
CC3_CPARP_pos{4,3} = [18.9,19.6,12.6,19.7,16.7,10.8];
CC3_CPARP_pos{1,4} = [4.67,1.46,1.3];
CC3_CPARP_pos{2,4} = [0.148,0.208,0.214];
CC3_CPARP_pos{3,4} = [6.22,1,5.2,1.2];
CC3_CPARP_pos{4,4} = [27.4,25.9,27];
CC3_CPARP_pos{1,5} = [2.08,0.82,0.937,1.25,1.37];
CC3_CPARP_pos{2,5} = [0.303,0.283,0.377];
CC3_CPARP_pos{3,5} = [1.56,1.24,1.05,0.805,0.817];
CC3_CPARP_pos{4,5} = [40.8,32.5,41.2,39.3,43.7];
CC3_CPARP_pos{1,6} = [1,1.06,1.02,1.07,1.01];
CC3_CPARP_pos{2,6} = [0.71,1.01,0.657];
CC3_CPARP_pos{3,6} = [2.45,1.48,0.975,1.3,1.22];
CC3_CPARP_pos{4,6} = [16.7,22.2,42.9,43.8,41.4];

Responses.apoptosis = CC3_CPARP_pos;

CycB_pos = cell(4,6);
CycB_pos{1,1} = [76.8,76.7,76.8];
CycB_pos{2,1} = [83,81.1,81.8];
CycB_pos{3,1} = [83.6,83.9,85.6];
CycB_pos{4,1} = [83.5,87,84.7];
CycB_pos{1,2} = [74.1,73.6,71.5];
CycB_pos{2,2} = [82.3,83.4,82.5];
CycB_pos{3,2} = [56.3,77.9,80.7];
CycB_pos{4,2} = [44.1,51.4,53.5];
CycB_pos{1,3} = [51.9,54.7,49.6];
CycB_pos{2,3} = [74.8,73.9,75.6];
CycB_pos{3,3} = [73.7,79.5,79.5];
CycB_pos{4,3} = [43,48.5,40.2];
CycB_pos{1,4} = [31,40.1,32.1];
CycB_pos{2,4} = [63.7,63,66.3];
CycB_pos{3,4} = [33.2,34,37.4];
CycB_pos{4,4} = [52.8,36.5];
CycB_pos{1,5} = [36.2,32.8,36.1,35.9];
CycB_pos{2,5} = [64.3,64.9,65.5];
CycB_pos{3,5} = [20.8,17,16.8,19.2];
CycB_pos{4,5} = [55.1,62.8,61.4];
CycB_pos{1,6} = [27.3,27,27.6,23.9];
CycB_pos{2,6} = [34.2,34.7,36.8];
CycB_pos{3,6} = [13.8,7.6,8.42,6.97];
CycB_pos{4,6} = [67.6,59.5,52.6,56.6];

Responses.cycB_pos = CycB_pos;

G2_cycB_neg = cell(4,6);
G2_cycB_neg{1,1} = [0.724,1.55,1.05];
G2_cycB_neg{2,1} = [0.776,0.877,0.784];
G2_cycB_neg{3,1} = [0.698,0.546,0.518];
G2_cycB_neg{4,1} = [1.95,1.57,1.75];
G2_cycB_neg{1,2} = [1.32,1.31,1.59];
G2_cycB_neg{2,2} = [1.76,1.6,1.62];
G2_cycB_neg{3,2} = [2.53,3.22,1.83];
G2_cycB_neg{4,2} = [4.74,7.34,5.77];
G2_cycB_neg{1,3} = [2.01,1.49,2.23];
G2_cycB_neg{2,3} = [9.55,10.1,9.61];
G2_cycB_neg{3,3} = [6.71,7.73,7.69];
G2_cycB_neg{4,3} = [10,8.29,10];
G2_cycB_neg{1,4} = [3.08,1.99,2.88];
G2_cycB_neg{2,4} = [23.7,24.7,21.7];
G2_cycB_neg{3,4} = [46.7,54,49.9];
G2_cycB_neg{4,4} = [16.5,17];
G2_cycB_neg{1,5} = [2.58,1.56,1.12,1.64];
G2_cycB_neg{2,5} = [34.8,37.4,39.3];
G2_cycB_neg{3,5} = [65.2,69.6,69.7,67.4];
G2_cycB_neg{4,5} = [14,16.3,13.9,15.7];
G2_cycB_neg{1,6} = [3.06,1.47,1.45,0.937];
G2_cycB_neg{2,6} = [56.1,58.1,54.7];
G2_cycB_neg{3,6} = [70.5,77.4,77.6,77.1];
G2_cycB_neg{4,6} = [2.18,15.5,19,18.3];

Responses.G2_cycB_neg = G2_cycB_neg;

Endo = cell(4,6);
Endo{1,1} = [0.753,0.946,0.776];
Endo{2,1} = [1.24,1.24,1.4];
Endo{3,1} = [0.776,0.855,0.782];
Endo{4,1} = [1.03,0.986,0.975];
Endo{1,2} = [1.86,3.08,1.96];
Endo{2,2} = [1.71,1.69,1.47];
Endo{3,2} = [2.08,1.47,2.49];
Endo{4,2} = [1.82,1.24,2.73];
Endo{1,3} = [1.62,1.22,2.42];
Endo{2,3} = [2.21,1.96,1.66];
Endo{3,3} = [2.31,1.74,4.1];
Endo{4,3} = [1.23,1.61,3.45];
Endo{1,4} = [2.45,1.15,1.58];
Endo{2,4} = [2.97,2.59,2.53];
Endo{3,4} = [2.67,2.04,4.98];
Endo{4,4} = [2.67,1.82,5.17];
Endo{1,5} = [0.625,0.479,0.521];
Endo{2,5} = [2.73,2.65,2.74];
Endo{3,5} = [0.871,0.88,1.19];
Endo{4,5} = [3.63,3.73,3.92];
Endo{1,6} = [0.262,0.559,0.569];
Endo{2,6} = [3.08,2.87,3.58];
Endo{3,6} = [0.871,0.88,1.19];
Endo{4,6} = [3.51,2.85,4.04];

Responses.endo = Endo;

G1 = cell(4,6);
G1{1,1} = [27.7,25.9,24.5];
G1{2,1} = [18.1,19.3,17.8];
G1{3,1} = [17.1,17.2,17.9];
G1{4,1} = [29.6,29.9,27.9];
G1{1,2} = [31.4,19.1,25.6];
G1{2,2} = [14.7,14.5,14.6];
G1{3,2} = [7.77,21,15.4];
G1{4,2} = [30.3,42.8,29.7];
G1{1,3} = [44.4,53.3,45.7];
G1{2,3} = [11.7,12,10.7];
G1{3,3} = [5.42,18.2,7.92];
G1{4,3} = [29.9,40.8,20.7];
G1{1,4} = [63,60,50.5];
G1{2,4} = [6.87,7.76,6.97];
G1{3,4} = [6.26,19.2,7.45];
G1{4,4} = [30,32.6,26.8];
G1{1,5} = [54.7,57.4,58.4];
G1{2,5} = [4.65,5.31,6.13];
G1{3,5} = [12,11.9,10.3];
G1{4,5} = [32.3,32.3,30.4];
G1{1,6} = [68.3,66.8,69.5];
G1{2,6} = [4.12,4.18,3.38];
G1{3,6} = [13.5,13.1,13.8];
G1{4,6} = [32.5,32.3,32.1];

Responses.G1 = G1;

S = cell(4,6);
S{1,1} = [54.4,53.1,55.1];
S{2,1} = [67.3,64.5,65];
S{3,1} = [56.6,58.1,57.2];
S{4,1} = [46.6,49.1,50.8];
S{1,2} = [48.2,65.5,50.4];
S{2,2} = [64,68.9,63.5];
S{3,2} = [61.8,61,65.3];
S{4,2} = [43.1,40.2,49.5];
S{1,3} = [33.6,39.6,42.4];
S{2,3} = [46.7,54.6,46.2];
S{3,3} = [56.6,58.6,54.6];
S{4,3} = [40.7,37.5,53.7];
S{1,4} = [23.1,28.2,28.8];
S{2,4} = [2.74,3.33,2.65];
S{3,4} = [20.8,17.7,9.4];
S{4,4} = [29.5,40,34.7];
S{1,5} = [32.3,31.5,29.5];
S{2,5} = [2.45,1.2,1.15];
S{3,5} = [1.82,1.32,1.54];
S{4,5} = [24.9,27.2,27.4];
S{1,6} = [25.4,25.5,23.4];
S{2,6} = [1.52,1.12,1.1];
S{3,6} = [0.964,0.585,0.826];
S{4,6} = [28.3,31.6,27.8];

Responses.S = S;

G2 = cell(4,6);
G2{1,1} = [16,18.6,18.9];
G2{2,1} = [14,15.1,15.1];
G2{3,1} = [24.4,22.9,23.6];
G2{4,1} = [20.6,18.2,18.6];
G2{1,2} = [18.1,13,20.5];
G2{2,2} = [19.1,16.9,18.2];
G2{3,2} = [26.4,15.1,16.2];
G2{4,2} = [20.7,12,17.1];
G2{1,3} = [16.5,12.6,9];
G2{2,3} = [38.5,33.6,39.7];
G2{3,3} = [33.9,18.1,32.3];
G2{4,3} = [20.8,15.5,18.5];
G2{1,4} = [10.2,9.24,9.17];
G2{2,4} = [87.6,86,87.4];
G2{3,4} = [63.3,59.9,75.9];
G2{4,4} = [26.5,19.6,27.5];
G2{1,5} = [11,9.53,10.1];
G2{2,5} = [89.8,90.3,89.4];
G2{3,5} = [82.4,83.6,84.6];
G2{4,5} = [24.4,23,24.1];
G2{1,6} = [5.5,6.65,6.11];
G2{2,6} = [90.1,90.3,91];
G2{3,6} = [82.2,83.8,82.1];
G2{4,6} = [21.1,16.8,21.1];

Responses.G2 = G2;

Responses_raw_data = cell(25,11);
Responses_raw_data(1,2:end) = {'Proliferation','Apoptosis','G1','S','G2','Endo','Cyclin B+','G2 Cyclin B-','G1 p21+','G2 p21+'};
Responses_raw_data(2:end,1) = {'0 uM, 6 hrs','0.5 uM, 6 hrs','2 uM, 6 hrs','10 uM, 6 hrs','0 uM, 12 hrs','0.5 uM, 12 hrs','2 uM, 12 hrs','10 uM, 12 hrs',...
    '0 uM, 24 hrs','0.5 uM, 24 hrs','2 uM, 24 hrs','10 uM, 24 hrs','0 uM, 48 hrs','0.5 uM, 48 hrs','2 uM, 48 hrs','10 uM, 48 hrs',...
    '0 uM, 72 hrs','0.5 uM, 72 hrs','2 uM, 72 hrs','10 uM, 72 hrs','0 uM, 96 hrs','0.5 uM, 96 hrs','2 uM, 96 hrs','10 uM, 96 hrs'};
Responses_raw_data_no_logit = cell(25,11);
Responses_raw_data_no_logit(1,2:end) = {'Proliferation','Apoptosis','G1','S','G2','Endo','Cyclin B+','G2 Cyclin B-','G1 p21+','G2 p21+'};
Responses_raw_data_no_logit(2:end,1) = {'0 uM, 6 hrs','0.5 uM, 6 hrs','2 uM, 6 hrs','10 uM, 6 hrs','0 uM, 12 hrs','0.5 uM, 12 hrs','2 uM, 12 hrs','10 uM, 12 hrs',...
    '0 uM, 24 hrs','0.5 uM, 24 hrs','2 uM, 24 hrs','10 uM, 24 hrs','0 uM, 48 hrs','0.5 uM, 48 hrs','2 uM, 48 hrs','10 uM, 48 hrs',...
    '0 uM, 72 hrs','0.5 uM, 72 hrs','2 uM, 72 hrs','10 uM, 72 hrs','0 uM, 96 hrs','0.5 uM, 96 hrs','2 uM, 96 hrs','10 uM, 96 hrs'};
Responses_sem = cell(25,11);
Responses_sem(1,2:end) = {'Proliferation','Apoptosis','G1','S','G2','Endo','Cyclin B+','G2 Cyclin B-','G1 p21+','G2 p21+'};
Responses_sem(2:end,1) = {'0 uM, 6 hrs','0.5 uM, 6 hrs','2 uM, 6 hrs','10 uM, 6 hrs','0 uM, 12 hrs','0.5 uM, 12 hrs','2 uM, 12 hrs','10 uM, 12 hrs',...
    '0 uM, 24 hrs','0.5 uM, 24 hrs','2 uM, 24 hrs','10 uM, 24 hrs','0 uM, 48 hrs','0.5 uM, 48 hrs','2 uM, 48 hrs','10 uM, 48 hrs',...
    '0 uM, 72 hrs','0.5 uM, 72 hrs','2 uM, 72 hrs','10 uM, 72 hrs','0 uM, 96 hrs','0.5 uM, 96 hrs','2 uM, 96 hrs','10 uM, 96 hrs'};
Responses_sem_no_logit = cell(25,11);
Responses_sem_no_logit(1,2:end) = {'Proliferation','Apoptosis','G1','S','G2','Endo','Cyclin B+','G2 Cyclin B-','G1 p21+','G2 p21+'};
Responses_sem_no_logit(2:end,1) = {'0 uM, 6 hrs','0.5 uM, 6 hrs','2 uM, 6 hrs','10 uM, 6 hrs','0 uM, 12 hrs','0.5 uM, 12 hrs','2 uM, 12 hrs','10 uM, 12 hrs',...
    '0 uM, 24 hrs','0.5 uM, 24 hrs','2 uM, 24 hrs','10 uM, 24 hrs','0 uM, 48 hrs','0.5 uM, 48 hrs','2 uM, 48 hrs','10 uM, 48 hrs',...
    '0 uM, 72 hrs','0.5 uM, 72 hrs','2 uM, 72 hrs','10 uM, 72 hrs','0 uM, 96 hrs','0.5 uM, 96 hrs','2 uM, 96 hrs','10 uM, 96 hrs'};
Raw_responses = zeros(4,6,10);
counter = 2;

for i = 1:6
    for j = 1:4
        Responses_raw_data{counter,2} = mean(prolif{j,i});
        Responses_raw_data_no_logit{counter,2} = mean(prolif{j,i});
        Responses_sem_no_logit{counter,2} = std(prolif{j,i})/sqrt(size(prolif{j,i},2));
        Raw_responses(j,i,1) = mean(prolif{j,i});
        
        Responses_raw_data_no_logit{counter,3} = mean(CC3_CPARP_pos{j,i});
        Responses_sem_no_logit{counter,3} = std(CC3_CPARP_pos{j,i})/sqrt(size(CC3_CPARP_pos{j,i},2));
        for k = 1:size(CC3_CPARP_pos{j,i},2)
            CC3_CPARP_pos{j,i}(1,k) = log((CC3_CPARP_pos{j,i}(1,k)/100)/(1-CC3_CPARP_pos{j,i}(1,k)/100));
        end
        
        Responses_raw_data{counter,3} = mean(CC3_CPARP_pos{j,i});
        Raw_responses(j,i,2) = mean(CC3_CPARP_pos{j,i});
        
        Responses_raw_data_no_logit{counter,4} = mean(G1{j,i});
        Responses_sem_no_logit{counter,4} = std(G1{j,i})/sqrt(size(G1{j,i},2));
        for k = 1:size(G1{j,i},2)
            G1{j,i}(1,k) = log((G1{j,i}(1,k)/100)/(1-G1{j,i}(1,k)/100));
        end
        Responses_raw_data{counter,4} = mean(G1{j,i});
        Raw_responses(j,i,3) = mean(G1{j,i});
        
        Responses_raw_data_no_logit{counter,5} = mean(S{j,i});
        Responses_sem_no_logit{counter,5} = std(S{j,i})/sqrt(size(S{j,i},2));
        for k = 1:size(S{j,i},2)
            S{j,i}(1,k) = log((S{j,i}(1,k)/100)/(1-S{j,i}(1,k)/100));
        end
        Responses_raw_data{counter,5} = mean(S{j,i});
        Raw_responses(j,i,4) = mean(S{j,i});
        
        Responses_raw_data_no_logit{counter,6} = mean(G2{j,i});
        Responses_sem_no_logit{counter,6} = std(G2{j,i})/sqrt(size(G2{j,i},2));
        for k = 1:size(G2{j,i},2)
            G2{j,i}(1,k) = log((G2{j,i}(1,k)/100)/(1-G2{j,i}(1,k)/100));
        end
        Responses_raw_data{counter,6} = mean(G2{j,i});
        Raw_responses(j,i,5) = mean(G2{j,i});
        
        Responses_raw_data_no_logit{counter,7} = mean(Endo{j,i});
        Responses_sem_no_logit{counter,7} = std(Endo{j,i})/sqrt(size(Endo{j,i},2));
        for k = 1:size(Endo{j,i},2)
            Endo{j,i}(1,k) = log((Endo{j,i}(1,k)/100)/(1-Endo{j,i}(1,k)/100));
        end
        Responses_raw_data{counter,7} = mean(Endo{j,i});
        Raw_responses(j,i,6) = mean(Endo{j,i});
        
        Responses_raw_data_no_logit{counter,8} = mean(CycB_pos{j,i});
        Responses_sem_no_logit{counter,8} = std(CycB_pos{j,i})/sqrt(size(CycB_pos{j,i},2));
        for k = 1:size(CycB_pos{j,i},2)
            CycB_pos{j,i}(1,k) = log((CycB_pos{j,i}(1,k)/100)/(1-CycB_pos{j,i}(1,k)/100));
        end
        Responses_raw_data{counter,8} = mean(CycB_pos{j,i});
        Raw_responses(j,i,7) = mean(CycB_pos{j,i});
        
        Responses_raw_data_no_logit{counter,9} = mean(G2_cycB_neg{j,i});
        Responses_sem_no_logit{counter,9} = std(G2_cycB_neg{j,i})/sqrt(size(G2_cycB_neg{j,i},2));
        for k = 1:size(G2_cycB_neg{j,i},2)
            G2_cycB_neg{j,i}(1,k) = log((G2_cycB_neg{j,i}(1,k)/100)/(1-G2_cycB_neg{j,i}(1,k)/100));
        end
        Responses_raw_data{counter,9} = mean(G2_cycB_neg{j,i});
        Raw_responses(j,i,8) = mean(G2_cycB_neg{j,i});
        
        Responses_raw_data_no_logit{counter,10} = mean(G1_p21_pos{j,i});
        Responses_sem_no_logit{counter,10} = std(G1_p21_pos{j,i})/sqrt(size(G1_p21_pos{j,i},2));
        for k = 1:size(G1_p21_pos{j,i},2)
            G1_p21_pos{j,i}(1,k) = log((G1_p21_pos{j,i}(1,k)/100)/(1-G1_p21_pos{j,i}(1,k)/100));
        end
        Responses_raw_data{counter,10} = mean(G1_p21_pos{j,i});
        Raw_responses(j,i,9) = mean(G1_p21_pos{j,i});
        
        Responses_raw_data_no_logit{counter,11} = mean(G2_p21_pos{j,i});
        Responses_sem_no_logit{counter,11} = std(G2_p21_pos{j,i})/sqrt(size(G2_p21_pos{j,i},2));
        for k = 1:size(G2_p21_pos{j,i},2)
            G2_p21_pos{j,i}(1,k) = log((G2_p21_pos{j,i}(1,k)/100)/(1-G2_p21_pos{j,i}(1,k)/100));
        end
        Responses_raw_data{counter,11} = mean(G2_p21_pos{j,i});
        Raw_responses(j,i,10) = mean(G2_p21_pos{j,i});
        
        counter =counter + 1;
    end
end
        
clear prolif G1_p21_pos G2_p21_pos CC3_CPARP_pos CycB_pos G2_cycB_neg Endo G1 S G2 i j k counter


