% these codes
% use the baseline specification
% splits the data into 10 random deciles 
% for each decile in turn, it
%   (i) clusters the data using k=2..8 clusters
%   (ii) calculates silhouette statistics for each value of k, 
%   (iii) calcuates the value of k that:
%       (a) gives the highest average silhouette: this is in best_av_k
%       (b) gives the lowest percentage of negative silhouettes: this is in
%       best_min_k

rng('default');
sil_stats_c=NaN(6,2,10);


% state that will drvide sample into 10 random deciles by setting
% valid_split=0.1
valid_split=0.1;
i_1=fix(valid_split*nobs);
i_2=2*i_1;
i_3=3*i_1;
i_4=4*i_1;
i_5=5*i_1;
i_6=6*i_1;
i_7=7*i_1;
i_8=8*i_1;
i_9=9*i_1;
i_10=10*i_1;


% this is the key step: it randomly permutes the sample
% using the randperm function
perm=randperm(nobs);


% the first 10% of the shuffled data is put into data_subsample_1
% this is the first random decile
% the second 10% is put into data_subsample_2, etc
% this is the second random decile
% etc
data_subsample_1=X(perm(:,1:i_1),:);
data_subsample_2=X(perm(:,i_1+1:i_2),:);
data_subsample_3=X(perm(:,i_2+1:i_3),:);
data_subsample_4=X(perm(:,i_3+1:i_4),:);
data_subsample_5=X(perm(:,i_4+1:i_5),:);
data_subsample_6=X(perm(:,i_5+1:i_6),:);
data_subsample_7=X(perm(:,i_6+1:i_7),:);
data_subsample_8=X(perm(:,i_7+1:i_8),:);
data_subsample_9=X(perm(:,i_8+1:i_9),:);
data_subsample_10=X(perm(:,i_9+1:i_10),:);

% we next define a 3-d matrix called data_subsample
% this will hold data for each decline: data_subsample_1 through data_subsample_10 
% the dimension of data_subsample is i_1 x nvar x 10
% where i_1 is the number of obs in each decile
% nvar is the number of variables used in clustering
% and 10 is the number of deciles
data_subsample=zeros(i_1,nvar,10);
data_subsample(:,:,1)=data_subsample_1;
data_subsample(:,:,2)=data_subsample_2;
data_subsample(:,:,3)=data_subsample_3;
data_subsample(:,:,4)=data_subsample_4;
data_subsample(:,:,5)=data_subsample_5;
data_subsample(:,:,6)=data_subsample_6;
data_subsample(:,:,7)=data_subsample_7;
data_subsample(:,:,8)=data_subsample_8;
data_subsample(:,:,9)=data_subsample_9;
data_subsample(:,:,10)=data_subsample_10;
s_s=NaN(i_1,8);
max_av_sil=NaN(1,10);
best_av_k=NaN(1,10);
min_neg_sil=NaN(1,10);
best_min_k=NaN(1,10);

% now we go through the data decile-by-decile, clustering and calculating 
% silhouette stats for each decile in turn
% this loops over each decile: ii indexes the decile
for ii=1:10
      fprintf('decile[%d]',ii)
      data_decile(:,:)=data_subsample(:,:,ii);
% when ii=1, data_decile contains the first decile; 
% when ii=2, data_decile uses the second decile, etc.
% we next cluster each decile for each of k=2,..,8 clusters
[IDX_2_c] = kmedoids(data_decile,2,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
[IDX_3_c] = kmedoids(data_decile,3,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
[IDX_4_c] = kmedoids(data_decile,4,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
[IDX_5_c] = kmedoids(data_decile,5,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
[IDX_6_c] = kmedoids(data_decile,6,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
[IDX_7_c] = kmedoids(data_decile,7,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
[IDX_8_c] = kmedoids(data_decile,8,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
% we next calculate silhouette stats for each value of k 
sil_stats_sub_sample_deciles
% the silhousette stats are stored in 2_s2, s_s3, s_s4 etc
% s_s2 contains the silhouette stats for each observation in the case where
% k=2; so s_s2 has dimension i_1 x 1
% s_s3 contains the silhouette stats for each observation in the case where
% k=3, etc
% we next store these in s_s, which has dimension i_1 x 8
for i=1:i_1
        s_s(i,2)=s_s2(i,1);
        s_s(i,3)=s_s3(i,1);
        s_s(i,4)=s_s4(i,1);
        s_s(i,5)=s_s6(i,1);
        s_s(i,6)=s_s6(i,1);
        s_s(i,7)=s_s7(i,1);
        s_s(i,8)=s_s8(i,1);
end
% we next calculate the average sil stat
% and store this in sil_stats_c
% sil_stats_c has dimension 8 x 2 x 10
% where j=2,..8 is the number of clusters
% 2 is the number of different stats
% 10 is the number of deciles
    for j=2:8
            sil_stats_c(j,1,ii)=mean(s_s(:,j));
 % the average sil stat for each value of k for decile ii is stored in
 % the second element of sil_stats_c
 % next we calculate the % of negative sil stats
 % to do this, we construct count to measure the number of negative silhouettes 
            count=0;
        for i=1:i_1
                if s_s(i,j)<0
                 count=count+1;    
                end
        end
% we get the % of negative silhouettes by 
%dividing count by the number of obs in each decile         
        sil_stats_c(j,2,ii)=count/i_1;
    end
% we have now looped across all values for k
% we now calculate the highest value of the average sil stat
% across all values of k and store this in max_av_sil
% the value of k that gives this max average sil stat is
% stored in best_av_k
% so if the highest average sil stat is found for k=2,
% then best_av_k=2
[max_sil1, best_k1] = max(sil_stats_c(:,1,ii));
max_av_sil(1,ii)=max_sil1;
best_av_k(1,ii)=best_k1;
% we now calculate the smallest value of the % of negative sil stats
% across all values of k and store this in min_neg_sil
% the value of k that gives this min negative sil stat is
% stored in best_min_k
% so if the lowest % of negative sil stats is found for k=2,
% then best_min_k=2
[min_sil2, best_k2] = min(sil_stats_c(:,2,ii));
min_neg_sil(1,ii)=min_sil2;
best_min_k(1,ii)=best_k2;
% we have now finished with the current decile and  move onto the next
end

