clearvars; clear session; close all; clc;
load 'uk_clustering_data';
rng('default');
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
colmin = min(data);
colmax = max(data);
X = rescale(data,'InputMin',colmin,'InputMax',colmax);
nobs=size(X,1);
nvar=size(X,2);
% This does the clustering, for k=2,...,8 clusters
cluster_2_8
% size_sil is the proportion of the sample to use in calculating sil stats
size_sil=1;
% This generates Figure 1
sil_stats
% This generates the results reported in section 4.4.1
sil_stats_by_decile_uk
% This generates Figure 2
plot_clusters
% This generates Table 9
drop_1_by_1
gamma_1=1-gamma_stat;
% This generates Table 10
run_validate

