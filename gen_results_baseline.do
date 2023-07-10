clear

import excel "m_to_e_baseline.xlsx", sheet("Sheet1") firstrow

// This generates Table 1)

tabstat grad A_level_plus GCSE_plus highSOC medSOC lowSOC contemp_short contemp_long [aweight=weight]
tabstat female kids_below2 kids_2_9 age_lt_30 non_white London SE temp zhc public_sector  job_search  [aweight=weight] 


// This generates columns (i) and (ii) of Table 2)

bysort IDX_2: tabstat grad A_level_plus GCSE_plus highSOC medSOC lowSOC contemp_short contemp_long [aweight=weight]
bysort IDX_2: tabstat female kids_below2 kids_2_9 age_lt_30 non_white London SE temp zhc public_sector  job_search  [aweight=weight] 


// This generates columns (i)-(iii) of Table 5)

bysort IDX_3: tabstat grad A_level_plus GCSE_plus highSOC medSOC lowSOC contemp_short contemp_long [aweight=weight]
bysort IDX_3: tabstat female kids_below2 kids_2_9 age_lt_30 non_white London SE temp zhc public_sector  job_search  [aweight=weight] 


// This generates columns (iv)-(viii of Table 5)

bysort IDX_4: tabstat grad A_level_plus GCSE_plus highSOC medSOC lowSOC contemp_short contemp_long [aweight=weight]
bysort IDX_4: tabstat female kids_below2 kids_2_9 age_lt_30 non_white London SE temp zhc public_sector  job_search  [aweight=weight] 

tab IDX_2

tab IDX_3

tab IDX_4