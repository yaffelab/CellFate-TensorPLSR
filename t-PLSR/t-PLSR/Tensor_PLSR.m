% The below script creates the t-PLSR model
% Code partially adapted from Chitforoushzadeh Z...Janes KA, Science
% Signaling (2016) vol. 9, no. 431, pp. 1–18, 2016 doi: 10.1126/scisignal.aad3373
numsamps=4;
numtimepts=6;
numresp=10;

[Signals_tplsr,mX,sX]=nprocess(Raw_signals, [1 0 0], [0 1 1]);   % Mode 1 centering and mode 2+3 scaling of signal tensor (X)
[Outcome_tplsr,mY,sY]=nprocess(Raw_responses, [1 0 0], [0 1 1]); % Mode 1 centering and mode 2+3 scaling of response tensor (Y)

numcomp=3;
[Xfactors,Yfactors,Core,B,ypred,ssx_m,ssy_m] = npls(Signals_tplsr,Outcome_tplsr,numcomp); % Construction of calibration model

[ycalpred,T,ssx,Xres] = npred(Signals_tplsr,numcomp,Xfactors,Yfactors,Core,B,0); % Generating predictions based on calibration model
ycalpred = reshape(ycalpred,numsamps,numtimepts,numresp);
calibrated = nprocess(ycalpred,[1 0 0],[0 1 1],mY,sY,-1);
[Results, Model] = ncrossreg(Signals_tplsr,Outcome_tplsr,numcomp,0); % Generating cross-validation model 
xvalypred = nprocess(shiftdim(Results.ypred(numcomp,:,:,:),1),[1 0 0],[0 1 1],mY,sY,-1); % Generating predictions on withheld data during cross-validation

numstim = 500; % Number of null models to create
shuff_time_resp_weights = zeros(numstim,6,3);
shuff_resp_weights = zeros(numstim,10,3);

% The following loop generates 500 null models for significance testing
for i = 1:numstim
    shuffle_signals(1,:,:) = shufflematrix(Raw_signals(1,:,:));
    shuffle_signals(2,:,:) = shufflematrix(Raw_signals(2,:,:));
    shuffle_signals(3,:,:) = shufflematrix(Raw_signals(3,:,:));
    shuffle_signals(4,:,:) = shufflematrix(Raw_signals(4,:,:));
    
    shuffle_responses(1,:,:) = shufflematrix(Raw_responses(1,:,:));
    shuffle_responses(2,:,:) = shufflematrix(Raw_responses(2,:,:));
    shuffle_responses(3,:,:) = shufflematrix(Raw_responses(3,:,:));
    shuffle_responses(4,:,:) = shufflematrix(Raw_responses(4,:,:));
    
    [Signals_shuff,mX_s,sX_s]=nprocess(shuffle_signals, [1 0 0], [0 1 1]);   
    [Outcome_shuff,mY_s,sY_s]=nprocess(shuffle_responses, [1 0 0], [0 1 1]);

    [Xfactors_s,Yfactors_s,Core_s,B_s,ypred_s,ssx_s,ssy_s] = npls(Signals_shuff,Outcome_shuff,numcomp);
    
    shuff_time_resp_weights(i,:,:) = Yfactors_s{2};
    shuff_resp_weights(i,:,:) = Yfactors_s{3};
end

        