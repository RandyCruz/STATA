capture log close
set more off
use "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO4/WLS_educ.dta", clear
log using "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO4/MEMO_4.log", replace


sort idpub
merge 1:1 idpub using "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO4/WLS_health.dta"
drop _merge



describe
summarize

tab resp_edu, missing

gen RESPEDU=1 if resp_edu<=12
replace RESPEDU=2 if resp_edu>12 & resp_edu<16
replace RESPEDU=3 if resp_edu>=16

label variable RESPEDU "Respondents Education"
label define resp_edu1 1 "HS or Less" 2 "Some College" 3 "College Graduate"
label values RESPEDU resp_edu1


tab spouse_edu, missing

gen SPOUEDU=1 if spouse_edu<=12
replace SPOUEDU=2 if spouse_edu>12 & spouse_edu<16
replace SPOUEDU=3 if spouse_edu>=16

label variable SPOUEDU "Spouses Education"
label define spouse_edu1 1 "HS or Less" 2 "Some College" 3 "College Graduate"
label values SPOUEDU spouse_edu1

**Answer to part one about Assortive Mating*****
tab RESPEDU SPOUEDU, row chi2

***Creating 3 dummy variables for marriage

describe 

tab sexrsp

gen EAM=1 if RESPEDU==SPOUEDU
    replace EAM=2 if RESPEDU>SPOUEDU & sexrsp==1
	replace EAM=2 if RESPEDU<SPOUEDU & sexrsp==2
	replace EAM=3 if RESPEDU>SPOUEDU & sexrsp==2
	replace EAM=3 if RESPEDU<SPOUEDU & sexrsp==1
label variable EAM "Dummy Variable Respresenting Marital Types" 
label define EAM_Label 1 "Homogamous Marriage" 2 "Hypergamous Marriage" 3 "Hypogamous Marriage"
label value EAM EAM_Label	
	
tab EAM



gen Homogamous=1 if (EAM==1 & RESPEDU==1)
	replace Homogamous=2 if (EAM==1 & RESPEDU==2)
	replace Homogamous=3 if (EAM==1 & RESPEDU==3)
label def Homogamouslabel 1 "both HS" 2 "both some college" 3 "both college grads"
label value Homogamous Homogamouslabel

	
gen Hypergamous=1 if (EAM==2 & RESPEDU==1)
	replace Hypergamous=2 if (EAM==2 & RESPEDU==2)
	replace Hypergamous=3 if (EAM==2 & RESPEDU==3)
label def Hypergamouslabel 1 "resp HS" 2 "resp some college" 3 "resp college grads"
label value Hypergamous Hypergamouslabel

gen Hypogamous=1 if (EAM==3 & RESPEDU==1)
	replace Hypogamous=2 if (EAM==3 & RESPEDU==2)
	replace Hypogamous=3 if (EAM==3 & RESPEDU==3)
label value Hypogamous Hypergamouslabel	
	
tab Homogamous health, row chi2
tab Hypergamous health, row chi2
tab Hypogamous health, row chi2
tab EAM health, row chi2
tab RESPEDU health, row chi2
tab SPOUEDU health, row chi2




