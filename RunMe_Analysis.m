% Data analysis for "The initial progression of physical and perceptual
% symptoms associated with aniseikonia"

% This script should be run from the top-level directory in the repository

% LOAD DATA
load('Data.mat')

% Data variables:

% Subj:         subject number for each data row
% Ses_glass:    which glasses were worn in each data row (40 = main, 0 = control)

% Physical_*:   data for each subject/session at each timepoint
% col order:    headache, dizziness, nausea
% t1            = baseline
% npre_after    = first stimulation
% adapt         = adaptation period
% npo_after     = second stimuluation
% post          = post test

% Perceptual_*: data for each subject/session at each timepoint
% col order:    difficult to pick up, shape/size, location, swim, blur, double, eye strain, shoulder/neck pain. 

% idx_04, idx_00: indices for when main versus control spectacles were worn for each individual subject, in subject order 1-20

% MSSQ: Motion Sickness questionnaire scores

% Remaining variables indicate the horizontal and vertical fusional ranges
% at 40cm and 6m

% PLOT DATA
Manuscript_plots;

% PREP FOR STATISTICS, which are run in R using the code in the
% Statistical_analysis_R subfolder
Mat_to_csv_for_R; %converts matlab files to csvs for running stats in r