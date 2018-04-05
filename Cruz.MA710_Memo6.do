clear all 
capture log close
set more off

use "/Users/cruz/Desktop/STATA/GSS1972_2014 .dta", clear
log using "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO6/Cruz_MA710_Memo6.log", replace

gen decade=1 if year>=1970 & year<1980
				replace decade=2 if year>=1980 & year<1990
				replace decade=3 if year>=1990 & year<2000
				replace decade=4 if year>=2000 & year<=2010
				replace decade=. if year==.
			
			label variable decade "Decade"
			
			

			
gen black=1 if race==2
replace black=0 if race==1
label variable black "Black"
			
			label define blacklabels 1"Black" 2"White"
			label values black blacklabels
			
			
gen female=1 if sex==2
replace female=0 if sex==1
label variable female "female"

			label define femalelabel 1"female"
			label values female femalelabel 	
			
			
			
recode income (1=500)(2=2000)(3=3500)(4=4500)(5=5500)(6=6500)(7=7500)(8=9000)(9=12500)(10=17500)(11=22500)(12=25000)(.d=.) (.i=.) (.n=.), gen(newincome)
		label variable newincome "Total Family Income"

		label define newincomelabel 1"$500" 2"$2,000" 3"$3,500" 4"$4,500" 5"$5,500" 6"$6,500" 7"$7,500" 8"$9,000" 9"$12,500" 10"$17,500" 11"22,500" 12"$25,000+"
		label values newincome newincomelabel
		
		
bysort decade: regress newincome black educ age childs

bysort decade: regress newincome female educ age childs
			
