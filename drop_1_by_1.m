
% check importance of variables by dropping them from the datset,
% clustering and doing a confusion matrix with the assignements from the
% full dataset

gamma_stat=zeros(nvar,1);
pc_same_alt_1=zeros(nvar,1);
pc_same_alt_2=zeros(nvar,1);
for j=1:nvar
%     nchar = fprintf('Processing %d of %d', j, 10);
%     pause(0.10);
%     fprintf(repmat('\b', 1, nchar));
  fprintf('variable[%d]',j)
C_alt_data=zeros(nobs,nvar);
rng('default');
IDX_C=zeros(nobs,1);
C_alt_data=X;
C_alt_data(:,j) = [];
[IDX_C] = kmedoids(C_alt_data,2,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
C_alt_conf = confusionmat(IDX_2,IDX_C);
pc_same_alt_1(j)=(C_alt_conf(1,1)+C_alt_conf(2,2))/nobs;
pc_same_alt_2(j)=(C_alt_conf(1,2)+C_alt_conf(2,1))/nobs;
gamma_stat(j)=max(pc_same_alt_1(j),pc_same_alt_2(j));
end
