clear

import excel "m_to_e_alt_1.xlsx", sheet("Sheet1") firstrow


// This generates columns (i) and (ii) of Table 4)

bysort IDX_2: tabstat grad A_level_plus GCSE_plus skill1 skill2 skill3 skill4 contemp_short contemp_long [aweight=weight]
bysort IDX_2: tabstat female kids_below2 kids_2_9 age_lt_30 non_white London SE temp zhc public_sector  job_search  [aweight=weight] 








