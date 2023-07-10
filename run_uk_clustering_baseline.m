
% A) SET-UP AND PREP
clearvars; clear session; close all; clc;
load 'lfs_data';
rng('default');
%%%%%%%%%%%%%%%%%%%%
% now define the set of variables to use in clustering 
data=[grad, A_level_plus, GCSE_plus,...
    highSOC,medSOC,lowSOC,...
    contemp_short,contemp_long,...
    female,kids_below2, kids_2_9,...
    young,non_white,...
    London,SE,...
    temp,zhc,...
    public_sector,...
    job_search,...
    ];
% We rescale the data so that all variables are between 0 and 1
% it is recommended to do this with clustering analysis
colmin = min(data);
colmax = max(data);
X = rescale(data,'InputMin',colmin,'InputMax',colmax);

nobs=size(X,1);
nvar=size(X,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% K-MEDOIDS ESTIMATION USING THE FULL SAMPLE FOR A RANGE OF VaLUES FOR K
cluster_2_8
% calculate the centroids for k=2
cent_1=X(MIDX_2(1,1),:)';
cent_2=X(MIDX_2(2,1),:)';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate the OMEGA Statistics 
omega_stats
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   SILHOUETTES and STATISTICS
% size_sil is the proportion of the sample to use in calculating sil stats
size_sil=1;
% the next codes calculate silhouette stats for the whole sample
% Results stored in sil_stat_summary_s
sil_stats
% the next codes do the same for 10 random subsamples
% results stored in best_av_k(1,ii) and best_min_k
sil_stats_by_decile_uk
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Calculate gamma statistics
%  results stored in gamma_stat
gamma_stats
%%%%%%%%%%%%%

% ALTERNATIVE CLUSTERING ALGORITHMS 
% results stored in pc_same_kmean and pc_same_fuzz
alt_algo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SAVE RESULTS INTO AN EXCEL FILE FOR READING INTO STATA

T = table(grad, A_level_plus, GCSE_plus,...
    highSOC,lowSOC,medSOC,...
    contemp_short,contemp_long,...
    female,London,SE,temp,zhc,...
    public_sector,...
    non_white,job_search,...
    kids_below2, kids_2_9,age_lt_30,...
    IDX_2,IDX_3,IDX_4,idx_kmean_2,idx_2_fuz,...
weight);
filename = 'm_to_e_baseline.xlsx';
writetable(T,filename,'Sheet',1);


%  save('demo_data.mat',"grad", "A_level_plus", "GCSE_plus",...
%     "highSOC","medSOC","lowSOC",...
%     "contemp_short","contemp_long",...
%     "female","kids_below2", "kids_2_9",...
%     "young","non_white",...
%     "London","SE",...
%     "temp","zhc",...
%     "public_sector",...
%     "job_search", "weight")
% 
