set more off 
capture log close
use "/Users/cruz/Desktop/STATA/GSS1972_2014 .dta", clear
log using "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO5/Cruz_Memo5.log", replace



tab prestg10, missing nolabel 

gen class=1 if prestg10<=35
replace class=2 if prestg10>35 & prestg10<=48
replace class=3 if prestg10>48
replace class=. if prestg10==.i

label variable class "Categorical variable measuring social class"
label define class1 1 "Lower Class" 2 "Middle Class" 3 "Upper Class"
label values class class1


tab helppoor, missing nolabel
recode helppoor (5=1) (4=2) (3=3) (2=4) (1=5) (.d=.) (.i=.) (.n=.), gen (newhelppoor)
tab helppoor newhelppoor, m

tab newhelppoor, nolabel missing

tab helpblk, nolabel missing
recode helpblk (5=1) (4=2) (3=3) (2=4) (1=5) (.d=.) (.i=.) (.n=.), gen (newhelpblk)
tab helpblk, nolabel m
tab newhelpblk, nolabel m

tab race, nolabel missing
tab prestg10, nolabel missing



oneway newhelpblk class, tabulate bonferroni
oneway newhelppoor class, tabulate bonferroni 
oneway newhelpblk race, tabulate bonferroni 
oneway newhelppoor race, tabulate bonferroni 






