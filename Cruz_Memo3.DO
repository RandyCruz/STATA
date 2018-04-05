set more off
capture log close 

use "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO3/school1.dta", clear

log using "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO3/Cruz_MEMO3.log", replace

describe
append using "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO3/school2.dta"

describe
clear

use "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO3/school3.dta", clear
merge 1:1 _n using "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO3/childoutcomes1.dta"

describe
clear

use "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO3/final.dta", clear

describe

tab _merge
drop _merge

tab race
tab WKSESL

gen newmath=1
				replace newmath=1 if math<=27.89
				replace newmath=2 if math>27.89 & math<=35.82
				replace newmath=3 if math>35.82 & math<=43.845 
				replace newmath=4 if math>43.845
				replace newmath=. if math==.
			label variable newmath "Math Scores Distribution by Percentile"
			label define mathlabels 1"0-25th" 2"25-50th" 3"50-75th" 4"75-100th"
			label values newmath mathlabels
			
			
	gen newreading=1 if reading<=28.085
				replace newreading=1 if reading>=0 & reading<=28.085
				replace newreading=2 if reading>28.086 & reading<=33.6
				replace newreading=3 if reading>33.6 & reading<=38.695
				replace newreading=4 if reading>38.695
				replace newreading=. if reading==.
			label variable newreading "Reading Scores Distribution by Percentile"
			label define readinglabels 1"0-25th" 2"25-50th" 3"50-75th" 4"75-100th"
			label values newreading readinglabels
				

gen SES3=1 if WKSESL<=-.34
				replace SES3=1 if WKSESL>=0 & WKSESL<=-.34
				replace SES3=2 if WKSESL>-.34 & WKSESL<=.31
				replace SES3=3 if WKSESL>.31
				replace SES3=. if WKSESL==.
			label variable SES3 "Social Class"
			label define sociallabels 1"Lower" 2"Middle" 3"Upper"
			label values SES3 sociallabels

			
	
	
	tab race
	tab SES3
	tab race SES3, nofreq row		
	tab SES3 newmath, row nofreq chi2
	tab SES3 newreading, row nofreq chi2
	tab race newmath, nofreq row
	tab race newreading, nofreq row
	tab race SES3, nofreq row
	

