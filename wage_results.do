clear

use data_wage_regressions

/* this generates column (i) of Table 2 */
regress log_wage grad A_level_plus GCSE_plus /*
*/  highSOC medSOC contemp_short contemp_long /*
*/ female kids_below2 kids_2_9 young non_white London SE temp zhc public_sector  job_search, robust 

/* this generates column (ii) of Table 2 */
regress log_wage grad A_level_plus GCSE_plus /*
*/   contemp_short contemp_long /*
*/ female kids_below2 kids_2_9 young non_white London SE temp zhc public_sector  job_search if highSOC==1


/* this generates column (iii) of Table 2 */
regress log_wage grad A_level_plus GCSE_plus /*
*/  contemp_short contemp_long /*
*/ female kids_below2 kids_2_9 young non_white London SE temp zhc public_sector  job_search if medSOC==1

/* this generates column (iv) of Table 2 */
regress log_wage grad A_level_plus GCSE_plus /*
*/  contemp_short contemp_long /*
*/ female kids_below2 kids_2_9 young non_white London SE temp zhc public_sector  job_search if lowSOC==1

/* this generates column (v) of Table 2 */
regress log_wage grad A_level_plus GCSE_plus /*
*/  highSOC medSOC contemp_short contemp_long /*
*/ female kids_below2 kids_2_9 young non_white London SE zhc public_sector  job_search if temp==1

/* this generates column (vi) of Table 2 */
regress log_wage grad A_level_plus GCSE_plus /*
*/  highSOC medSOC /*
*/ female kids_below2 kids_2_9 young non_white London SE temp zhc public_sector  job_search if contemp_long==1 


/*
gen g_h=0
replace g_h=1 if grad==1 & highSOC==1
gen g_m=0
replace g_m=1 if grad==1 & medSOC==1
gen g_l=0
replace g_l=1 if grad==1 & lowSOC==1
gen ng_h=0

gen g_nh=0
replace g_nh=1 if grad==1 & medSOC==1
replace g_nh=1 if grad==1 & lowSOC==1

gen g_nl=0
replace g_nl=1 if grad==1 & medSOC==1
replace g_nl=1 if grad==1 & highSOC==1


replace ng_h=1 if grad==0 & highSOC==1
gen ng_m=0
replace ng_m=1 if grad==0 & medSOC==1
gen ng_l=0
replace ng_l=1 if grad==0 & lowSOC==1

tabstat g_h g_m g_l ng_h ng_m ng_l

gen ng_h_hp=0
replace ng_h_hp=1 if ng_h==1 & IDX_2==2
gen ng_h_lp=0
replace ng_h_lp=1 if ng_h==1 & IDX_2==1

gen ng_m_hp=0
replace ng_m_hp=1 if ng_m==1 & IDX_2==2
gen ng_m_lp=0
replace ng_m_lp=1 if ng_m==1 & IDX_2==1

gen ng_l_hp=0
replace ng_l_hp=1 if ng_l==1 & IDX_2==2
gen ng_l_lp=0
replace ng_l_lp=1 if ng_l==1 & IDX_2==1

gen g_m_hp=0
replace g_m_hp=1 if g_m==1 & IDX_2==2
gen g_m_lp=0
replace g_m_lp=1 if g_m==1 & IDX_2==1

gen g_h_hp=0
replace g_h_hp=1 if g_h==1 & IDX_2==2
gen g_h_lp=0
replace g_h_lp=1 if g_h==1 & IDX_2==1

gen g_l_hp=0
replace g_l_hp=1 if g_l==1 & IDX_2==2
gen g_l_lp=0
replace g_l_lp=1 if g_l==1 & IDX_2==1

tabstat g_h_hp g_h_lp g_m_hp g_m_lp g_l_hp g_l_lp
tabstat ng_h_hp ng_h_lp ng_m_hp ng_m_lp ng_l_hp ng_l_lp

gen h_hp=0
replace h_hp=1 if highSOC==1 & IDX_2==2
gen h_lp=0
replace h_lp=1 if highSOC==1 & IDX_2==1



gen g_hp=0
gen ng_hp=0
gen g_lp=0
gen ng_lp=0

replace g_hp=1 if grad==1 & IDX_2==2
replace ng_hp=1 if grad==0 & IDX_2==2
replace g_lp=1 if grad==1 & IDX_2==1
replace ng_lp=1 if grad==0 & IDX_2==1

*/

/* this gives the first row of  column (i) of Table 4) */
teffects ra (log_wage contemp_short contemp_long female kids_below2 kids_2_9 young non_white London SE public_sector temp ) (hp) if ng_h==1

/* this gives the second row of  column (i) of Table 4) */
teffects ra (log_wage contemp_short contemp_long female kids_below2 kids_2_9 young non_white London SE public_sector temp ) (hp) if ng_l==1

/* this gives the first row of  column (ii) of Table 4) */
teffects ipw (log_wage) (hp contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp public_sector ,probit) if ng_h==1

tebalance overid, nolog

/* this gives the second row of  column (ii) of Table 4) */
teffects ipw (log_wage) (hp contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp public_sector ,probit) if ng_l==1

tebalance overid, nolog

/* this gives the first row of  column (iii) of Table 4) */
teffects aipw (log_wage contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp public_sector  ) ///
(hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp public_sector ) if ng_h==1

tebalance overid, nolog

/* this gives the second row of  column (iii) of Table 4) */
teffects aipw (log_wage contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp public_sector  ) ///
(hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp public_sector ) if ng_l==1

tebalance overid, nolog

/* this gives the first row of  column (iv) of Table 4) */
teffects psmatch (log_wage) (hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp public_sector , probit ) if ng_h==1, nneighbor(3)

/* this gives the second row of  column (iv) of Table 4) */
teffects psmatch (log_wage) (hp  contemp_short contemp_long female kids_below2 kids_2_9  young non_white London SE temp public_sector , probit ) if ng_l==1, nneighbor(3)

