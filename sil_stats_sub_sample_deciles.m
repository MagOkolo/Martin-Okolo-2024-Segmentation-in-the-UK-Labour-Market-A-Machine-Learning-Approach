rng('default');
 fprintf('2 clusters')
[s_s2] = silhouette(data_decile,IDX_2_c,'hamming');
 fprintf('3 clusters')
 [s_s3] = silhouette(data_decile,IDX_3_c,'hamming');
fprintf('4 clusters')
 [s_s4] = silhouette(data_decile,IDX_4_c,'hamming');
 fprintf('5 clusters')
 [s_s5] = silhouette(data_decile,IDX_5_c,'hamming');
 fprintf('6 clusters')
 [s_s6] = silhouette(data_decile,IDX_6_c,'hamming');
 fprintf('7 clusters')
 [s_s7] = silhouette(data_decile,IDX_7_c,'hamming');
 fprintf('8 clusters')
 [s_s8] = silhouette(data_decile,IDX_8_c,'hamming');
 