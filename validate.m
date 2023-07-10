% Next we cross-validate the results in the case of two clusters 
% To do this, we randomly split the data into two sub-samples
% The size of each sub-sample is determined by the integer sss
% (sub sample size): this an interger between 1-99

% The first sub-sample is a random selection of the first sssth centiles of the data   
% If sss=50, the data are randomly split into two equally-sized sub-samples
% If sss=10, the first sub-sample contains a random sample of 10% of
% the data, with the other sub-sample containing the other 90%
% etc
rng('default');
sample_1=fix(valid_split*nobs);
sample_2=nobs-sample_1;
% There are N observations in our data set 
% PERM randomly re-orders the integers between 1-N
% The variable perm contains the results of this 
% perm is used to randomly select data points into different sub-samples
rng('default');
perm=randperm(nobs);
% We next create the sub-samples
data_sample_1=X(perm(:,1:sample_1),:);
data_sample_2=X(perm(:,sample_1+1:nobs),:);
% Now we apply the k-medoids algorithm to the sub-samples 
rng('default');
[IDX_2_sample_1, C_job_2a, SUMD_job_2a, D_job_2a, MIDX_job_2a, INFO_job_2a] = kmedoids(data_sample_1,2,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
rng('default');
[IDX_2_sample_2, C_job_2b, SUMD_job_2b, D_job_2b, MIDX_job_2b, INFO_job_2b] = kmedoids(data_sample_2,2,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
% Next we get the clusters that each data point in sub-sample 1 was allocated to
% when we clustered with the full sample
IDX_2_check_sample_1=zeros(sample_1,1);
for ii=1:sample_1
IDX_2_check_sample_1(ii,:)=IDX_2(perm(1,ii),1);
end
% Now we do the same for sub-sample 2
IDX_2_check_sample_2=zeros(nobs-sample_1,1);
for ii=1:nobs-sample_1
 IDX_2_check_sample_2(ii,:)=IDX_2(perm(1,sample_1+ii),1);
 end
% We now compare the clusters obtained for the full sample with the clusters
%obtained for samples 1 and 2
C_sample_1 = confusionmat(IDX_2_sample_1,IDX_2_check_sample_1);
C_sample_2 = confusionmat(IDX_2_sample_2,IDX_2_check_sample_2);
% Now we calculate the percentage of cases where a data point is allocated  
% to the same cluster when we use the first sub-sample as when we use the 
%full sample
%(please note that there are different versions of this calculation depending on
%whether or not the first cluster for the full sample is the same as the
%first cluster for the sub sample
pc_same_1_a=(C_sample_1(1,2)+C_sample_1(2,1))/sample_1;
pc_same_1_b=(C_sample_1(1,1)+C_sample_1(2,2))/sample_1;
pc_same_1=max(pc_same_1_a,pc_same_1_b);
%now do the same for the second sub-sample
pc_same_2_a=(C_sample_2(1,2)+C_sample_2(2,1))/sample_2;
pc_same_2_b=(C_sample_2(1,1)+C_sample_2(2,2))/sample_2;
pc_same_2=max(pc_same_2_a,pc_same_2_b);
pc_same=(sample_1/nobs)*pc_same_1+(sample_2/nobs)*pc_same_2;


