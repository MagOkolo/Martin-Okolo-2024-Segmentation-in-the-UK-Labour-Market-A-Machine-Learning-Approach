
clear


use data_main_results

/* this generates Table 1) */
tabstat grad A_level_plus GCSE_plus highSOC medSOC lowSOC contemp_short contemp_long [aweight=weight]
tabstat female kids_below2 kids_2_9 young non_white London SE temp zhc public_sector  job_search  [aweight=weight] 

/* this calculates the % of individuals in each cluster */
tab IDX_2

/* this generates columns (i) and (ii) of Table 3)*/
bysort IDX_2: tabstat highSOC medSOC lowSOC grad A_level_plus GCSE_plus contemp_short contemp_long [aweight=weight]
bysort IDX_2: tabstat female kids_below2 kids_2_9 young non_white London SE temp zhc public_sector  job_search  [aweight=weight] 

/* these generate column (iii) of Table 3) */

tabulate highSOC IDX_2 [aweight=weight], row 
tabulate medSOC IDX_2 [aweight=weight], row 
tabulate lowSOC IDX_2 [aweight=weight], row 
tabulate grad IDX_2 [aweight=weight], row 
tabulate A_level_plus IDX_2 [aweight=weight], row 
tabulate GCSE_plus IDX_2 [aweight=weight], row 
tabulate lowSOC IDX_2 [aweight=weight], row 
tabulate contemp_short IDX_2 [aweight=weight], row 
tabulate  contemp_long IDX_2 [aweight=weight], row 
tabulate female IDX_2 [aweight=weight], row 
tabulate kids_below2  IDX_2 [aweight=weight], row 
tabulate  kids_2_9 IDX_2 [aweight=weight], row 
tabulate young IDX_2 [aweight=weight], row 
tabulate non_white IDX_2 [aweight=weight], row 
tabulate London IDX_2 [aweight=weight], row 
tabulate SE IDX_2 [aweight=weight], row 
tabulate temp IDX_2 [aweight=weight], row 
tabulate zhc IDX_2 [aweight=weight], row 
tabulate public_sector IDX_2 [aweight=weight], row 
tabulate   job_search IDX_2 [aweight=weight], row 


/* this generates the bottow row of Table 7) */
tabstat g_h_hp g_h_lp g_m_hp g_m_lp g_l_hp g_l_lp
tabstat ng_h_hp ng_h_lp ng_m_hp ng_m_lp ng_l_hp ng_l_lp


/* this generates the rest of Table 7) */
tabstat hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp zhc public_sector  job_search if g_h_hp==1
tabstat hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp zhc public_sector  job_search if g_m_hp==1
tabstat hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp zhc public_sector  job_search if g_m_lp==1
tabstat hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp zhc public_sector  job_search if g_l_hp==1
tabstat hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp zhc public_sector  job_search if ng_h_hp==1
tabstat hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp zhc public_sector  job_search if ng_h_lp==1
tabstat hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp zhc public_sector  job_search if ng_m_hp==1
tabstat hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp zhc public_sector  job_search if ng_m_lp==1
tabstat hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp zhc public_sector  job_search if ng_l_hp==1
tabstat hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp zhc public_sector  job_search if ng_l_lp==1




