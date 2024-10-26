%This script converts the matlab files into csv files so that statistics can
%be performed on the data in r studio. 

% path to save the data
csv_save_path = './Statistical_analysis_R/R_Data/';

% column labels for physical and perceptual tables
phys_cols = {'subj','H_00','D_00','N_00','H_04','D_04','N_04','one'};
perc_cols = {'subj','Interact_00','Shape_00','Location_00',...
    'Swim_00','Blur_00','Double_00','Eyestrain_00','Neck_00',...
    'Interact_04','Shape_04','Location_04',...
    'Swim_04','Blur_04','Double_04','Eyestrain_04','Neck_04','one'};

%% Baseline and First stimulation task

%Physical baseline
subj = [1:20]';
Physical_t1_t = array2table([subj,Physical_t1(idx_00,:),Physical_t1(idx_04,:),ones(length(subj),1)],'VariableNames',phys_cols);
writetable(Physical_t1_t,strcat(csv_save_path,'Physical_base.csv'));

%Physical first stimulation
Physical_t2_t = array2table([subj,Physical_npre_after(idx_00,:),Physical_npre_after(idx_04,:),ones(length(subj),1)],'VariableNames',phys_cols);
writetable(Physical_t2_t,strcat(csv_save_path,'Physical_npre_after.csv'));

%Perceptual baseline
Perceptual_t1_t = array2table([subj,Perceptual_t1(idx_00,:),Perceptual_t1(idx_04,:),ones(length(subj),1)],'VariableNames',perc_cols);
writetable(Perceptual_t1_t,strcat(csv_save_path,'Perceptual_base.csv'));

%Perceptual first stimulation
Perceptual_t2_t = array2table([subj,Perceptual_npre_after(idx_00,:),Perceptual_npre_after(idx_04,:),ones(length(subj),1)],'VariableNames',perc_cols);
writetable(Perceptual_t2_t,strcat(csv_save_path,'Perceptual_npre_after.csv'));


%% Adaptation

%Physical adapt
Physical_adapt_t = array2table([subj,Physical_adapt(idx_00,:),Physical_adapt(idx_04,:),ones(length(subj),1)],'VariableNames',phys_cols);
writetable(Physical_adapt_t,strcat(csv_save_path,'Physical_adapt.csv'));

%Perceptual adapt
Perceptual_adapt_t = array2table([subj,Perceptual_adapt(idx_00,:), Perceptual_adapt(idx_04,:),ones(length(subj),1)],'VariableNames',perc_cols);
writetable(Perceptual_adapt_t,strcat(csv_save_path,'Perceptual_adapt.csv'));

%% Second stimuluation

%Physical second stimulation
Physical_npo_after_t = array2table([subj,Physical_npo_after(idx_00,:),Physical_npo_after(idx_04,:),ones(length(subj),1)],'VariableNames',phys_cols);
writetable(Physical_npo_after_t,strcat(csv_save_path,'Physical_npo_after.csv'));

%Perceptual second stimulation
Perceptual_npo_after_t = array2table([subj,Perceptual_npo_after(idx_00,:), Perceptual_npo_after(idx_04,:),ones(length(subj),1)],'VariableNames',perc_cols);
writetable(Perceptual_npo_after_t,strcat(csv_save_path,'Perceptual_npo_after.csv'));


%% Post test - difference between groups

%Physical 
Physical_post_t = array2table([subj,Physical_post(idx_00,:),Physical_post(idx_04,:),ones(length(subj),1)],'VariableNames',phys_cols);
writetable(Physical_post_t,strcat(csv_save_path,'Physical_post.csv'));

%Perceptual
Perceptual_post_t = array2table([subj,Perceptual_post(idx_00,:), Perceptual_post(idx_04,:),ones(length(subj),1)],'VariableNames',perc_cols);
writetable(Perceptual_post_t,strcat(csv_save_path,'Perceptual_post.csv'));


%% Difference between the symptoms reported during the first and second naturalistic task

%Physical
Physical_nat_after_dif_unordered = Physical_npo_after - Physical_npre_after;
Physical_nat_after_dif_csvformat = [subj, Physical_nat_after_dif_unordered(idx_00,:),Physical_nat_after_dif_unordered(idx_04,:),zeros(length(subj),1)];
Physical_nat_after_dif_t = array2table(Physical_nat_after_dif_csvformat,'VariableNames',{'subj','H_00','D_00','N_00','H_04','D_04','N_04','zero'});
writetable(Physical_nat_after_dif_t,strcat(csv_save_path,'Physical_nat_after_dif.csv'));

%Perceptual
Perceptual_nat_after_dif_unordered = Perceptual_npo_after - Perceptual_npre_after;
Perceptual_nat_after_dif_csvformat = [subj, Perceptual_nat_after_dif_unordered(idx_00,:),Perceptual_nat_after_dif_unordered(idx_04,:),zeros(length(subj),1)];
Perceptual_nat_after_dif_t = array2table(Perceptual_nat_after_dif_csvformat,'VariableNames',{'subj','Interact_00','Shape_00','Location_00',...
    'Swim_00','Blur_00','Double_00','Eyestrain_00','Neck_00','Interact_04','Shape_04','Location_04','Swim_04','Blur_04','Double_04','Eyestrain_04','Neck_04','zero'});
writetable(Perceptual_nat_after_dif_t,strcat(csv_save_path,'Perceptual_nat_after_dif.csv'));