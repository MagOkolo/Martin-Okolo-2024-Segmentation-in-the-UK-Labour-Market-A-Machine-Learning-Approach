rng('default');

sample_1=fix(nobs*size_sil);
perm=randperm(nobs);
sil_sample=zeros(sample_1,nvar);
sil_sample_1=zeros(sample_1,nvar);
sil_sample_1=X(perm(1:sample_1),:);
rng('default');
IDX_s2=IDX_2(perm(1:sample_1),:);
rng('default');
IDX_s3=IDX_3(perm(1:sample_1),:);
rng('default');
IDX_s4=IDX_4(perm(1:sample_1),:);
rng('default');
IDX_s5=IDX_5(perm(1:sample_1),:);
rng('default');
IDX_s6=IDX_6(perm(1:sample_1),:);
rng('default');
IDX_s7=IDX_8(perm(1:sample_1),:);
rng('default');
IDX_s8=IDX_8(perm(1:sample_1),:);

%%%
 fprintf('2 clusters')
figure(102)
[s_s2,h_s2] = silhouette(sil_sample_1,IDX_s2,'hamming');
 fprintf('3 clusters')
figure(103)
[s_s3,h_s3] = silhouette(sil_sample_1,IDX_s3,'hamming');
 fprintf('4 clusters')
figure(104)
[s_s4,h_s4] = silhouette(sil_sample_1,IDX_s4,'hamming');
 fprintf('5 clusters')
figure(105)
[s_s5,h_s5] = silhouette(sil_sample_1,IDX_s5,'hamming');
 fprintf('6 clusters')
figure(106)
[s_s6,h_s6] = silhouette(sil_sample_1,IDX_s6,'hamming');
 fprintf('7 clusters')
figure(107)
[s_s7,h_s7] = silhouette(sil_sample_1,IDX_s7,'hamming');
 fprintf('8 clusters')
figure(108)
[s_s8,h_s8] = silhouette(sil_sample_1,IDX_s8,'hamming');


num_neg_sil_stat_s=zeros(8,1);
pc_neg_sil_stat_s=zeros(8,1);
place_hold=zeros(sample_1,1);
s_s=[place_hold,s_s2,s_s3,s_s4,s_s5,s_s6,s_s7,s_s8];

for j=1:8
count=0;
    for i=1:sample_1
        if s_s(i,j)<0
        count=count+1;    
        end
    end
pc_neg_s=count/sample_1;
num_neg_sil_s(j,1)=count;
pc_neg_sil_s(j,1)=pc_neg_s;
end

sil_stats_mean_s=zeros(8,1);
for j=2:8
sil_stats_mean_s(j,1)=mean(s_s(:,j));
end

sil_stat_summary_s=[sil_stats_mean_s,pc_neg_sil_s];

K_list=[2,3,4,5,6,7,8];
K_list_1=[2,3,4,5,6,7,8];
K_list_2=K_list_1;
%K_list=[K_list_1;K_list_2];
xticks=[2,3,4,5,6,7,8];
xticklabels=[2,3,4,5,6,7,8];


% Second, as a bar graph
val_1=sil_stat_summary_s(2:8,1)';
val_2=sil_stat_summary_s(2:8,2)';
vals=[val_1;val_2];
figure(101)
bg=bar(K_list,vals)
legend([bg],'S(K)','\sigma (K)','FontSize',20)


% figure(110)
% plot(K_list, sil_stat_summary_s(2:8,1),'r-','LineWidth',2.5)
% hold on,
% plot(K_list, sil_stat_summary_s(2:8,2),'b-','LineWidth',2.5)
% legend({'Average of Silhouette Values','Proportion of Negative Silhouettes'},'Location','Southeast','FontSize',22,'TextColor','black')
% 

