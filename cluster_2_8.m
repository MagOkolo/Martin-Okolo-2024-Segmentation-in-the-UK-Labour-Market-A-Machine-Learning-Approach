% run the clusteing algorith for k=2,...8
% the random numner generator is reset for each run of the algorith for
% replicability
rng('default');
 fprintf('2 clusters')
[IDX_2, C_2, SUMD_2, D_2, MIDX_2, INFO_2] = kmedoids(X,2,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');;
rng('default');
 fprintf('3 clusters')
 [IDX_3] = kmedoids(X,3,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
rng('default');
 fprintf('4 clusters')
[IDX_4] = kmedoids(X,4,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
rng('default');
 fprintf('5 clusters')
[IDX_5] = kmedoids(X,5,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
rng('default');
 fprintf('6 clusters')
[IDX_6] = kmedoids(X,6,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
rng('default');
 fprintf('7 clusters')
[IDX_7] = kmedoids(X,7,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');
rng('default');
 fprintf('8 clusters')
[IDX_8] = kmedoids(X,8,'distance','hamming','replicates',90,'OnlinePhase','off', 'Algorithm','clara');

