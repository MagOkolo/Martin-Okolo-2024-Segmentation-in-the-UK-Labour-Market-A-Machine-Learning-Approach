clear

import excel "m_to_e_alt_2.xlsx", sheet("Sheet1") firstrow


// This generates columns (iii) and (iv) of Table 4)

bysort IDX_2: tabstat grad A_level_plus GCSE_plus highSOC medSOC lowSOC tenure_short tenure_long [aweight=weight]
bysort IDX_2: tabstat female kids_below2 kids_2_9 age_lt_30 non_white London SE temp zhc public_sector  job_search  [aweight=weight] 


