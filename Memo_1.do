***** Randy Cruz Memo 1********

use "/Users/cruz/Desktop/NY State Data.dta", clear

set more off
capture log close

log using "/Users/cruz/Desktop/Queens College CUNY MA/SPRING 2017 DATA ANALYTICS ASR GRADUATE/SOC 710 BASIC ANALYTICS/HW/MEMO1/Memo_1.log", replace

tab party
tab party, nolabel
tab branch

tab branch party

gen votediff=wintot-chaltot-rdtot-thtot
tab votediff

gen chaltotal=chaltot+rdtot+thtot
tab chaltotal

gen votemarg=(votediff*100)/wintot
tab votemarg

gen voteper=0
replace voteper=votemarg if votemarg<=10

list voteper party

encode party, gen(party2)

gen dparty=0
replace dparty=party2 if party2==1
tab dparty

gen rparty=0 
replace rparty=party2 if party2==3

gen idcparty=0
replace idcparty=party2 if party2==2

list dparty votemarg if votemarg <=10
list rparty votemarg if votemarg <=10
list name rparty votemarg if rparty==3 & votemarg<=10

list name dparty votemarg if dparty==1 & votemarg<=10






