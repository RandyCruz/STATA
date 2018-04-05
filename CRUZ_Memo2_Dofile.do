capture log close
set more off

use "/Users/cruz/Desktop/STATA/GSS1972_2014 .dta", clear

log using "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO2/Memo2_Log.log", replace

describe
summarize

****recode missing variables***
tab helpblk, nolabel m
recode helpblk .d=. .n=. .i=.
tab helpblk, nolabel m

tab racdif1, nolabel m
recode racdif1 .d=. .n=. .i=.
tab racdif1, nolabel m


tab racdif2, nolabel m
recode racdif2 .d=. .n=. .i=.
tab racdif2, nolabel m

tab racmar, nolabel m 
recode racmar .d=. .n=. .i=.
tab racmar, nolabel m

tab helppoor, nolabel m 
recode helppoor .d=. .n=. .i=.
tab helppoor, nolabel m

****Recode Var so make more intuitive X Create Dummy Var for binary var***

recode helpblk (5=1) (4=2) (3=3) (2=4) (1=5) (.=.), generate(newhelpblk)
tab helpblk newhelpblk, m

recode racdif1 (1=1) (2=0) (.=.), generate(newracdif1)
tab racdif1 newracdif1, m

recode racdif2 (1=0) (2=1) (.=.), generate(newracdif2)
tab racdif2 newracdif2, m

recode racmar (1=0) (2=1) (.=.), generate(newracmar)
tab racmar newracmar, m

recode helppoor (5=1) (4=2) (3=3) (2=4) (1=5) (.=.), generate(newhelppoor)
tab helppoor newhelppoor, m

tab year newhelppoor, m

*** Mean X Variable************

bysort year: egen meanhelpblk=mean(newhelpblk)
bysort year: egen meanracdif1=mean(newracdif1)
bysort year: egen meanracdif2=mean(newracdif2)
bysort year: egen meanracmar=mean(newracmar)
bysort year: egen meanhelppoor=mean(newhelppoor)

**** Create Graph*******************

twoway line meanracdif1 year, xtitle("Year") ytitle("Average Score of Respondents(racdif1)") ylabel(0 (0.2) 1)
twoway line meanracdif2 year, xtitle("Year") ytitle("Average Score of Respondents(racdif2)") ylabel(0 (0.2) 1.4)
twoway line meanracmar year, xtitle("Year") ytitle("Average Score of Respondents(racmar)") ylabel(0 (0.2) 1)
twoway line meanhelpblk year, xtitle("Year") ytitle("Average Score of Respondents(helpblk)") ylabel(1 (1) 5)
twoway line meanhelppoor year, xtitle("Year") ytitle("Average Score of Respondents(helppoor)") ylabel(1 (1) 5)

























