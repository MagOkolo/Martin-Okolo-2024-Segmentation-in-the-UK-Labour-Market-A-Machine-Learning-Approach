
%ALTERNATIVE CLUSTERING ALGORITHMS 

% We now sort the rescaled data into two clusters using the K-means algorithm, using 
% the euclidian distance measure
[idx_kmean_2,C_2] = kmeans(X,2,'distance','sqeuclidean','Replicates',50);
% Now we calculate the % of cases where data points are allocated
% to the same cluster with k-Means and k-Medians
C_euclid = confusionmat(IDX_2,idx_kmean_2);
pc_same_kmean_1=(C_euclid(1,1)+C_euclid(2,2))/nobs;
pc_same_kmean_2=(C_euclid(1,2)+C_euclid(2,1))/nobs;
pc_same_kmean=max(pc_same_kmean_1,pc_same_kmean_2);
% Now we use fuzzy c-Means clustering 
[center_2,U_2] = fcm(X,2);
% U_2 contains the probabilities that each data point belongs to either
% cluster. We allocate a data point to the cluster for which this
% probability is higher
idx_2_fuz=zeros(nobs,1);
for k=1:nobs
    if U_2(1,k) >0.5 idx_2_fuz(k,:)=1; 
else idx_2_fuz(k,:)=2;
    end
end
% Now we calculate the % of cases where data points are allocated
% to the same cluster with fuzzy c-Means and k-Medians
C_fuzz = confusionmat(IDX_2,idx_2_fuz);
pc_same_fuzz_1=(C_fuzz(1,2)+C_fuzz(2,1))/nobs;
pc_same_fuzz_2=(C_fuzz(1,1)+C_fuzz(2,2))/nobs;
pc_same_fuzz=max(pc_same_fuzz_1,pc_same_fuzz_2);

