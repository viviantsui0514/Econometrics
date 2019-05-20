cd "C:/Users/vivian/Desktop"
//unicode analyze dataoutput.txt
//unicode encoding set Big5
//unicode translate dataoutput.txt
import delimited C:\Users\vivian\Desktop\dataoutput.txt, encoding(UTF-8)

drop if 轉投資名稱 == "1"
drop if 地區 == "5"
drop if 子公司實收資本額ntd == 0
gen 年份 = int(年月/100)

gen tsedate = date(設立日期, "YMD")
format tsedate %tdCCYY
gen year = year(tsedate)
gen 設立年數 = 年份 - year

tabulate 地區 if 年份 == 2001
tabulate 地區 if 年份 == 2018

gen 年份變數 = 1 
replace 年份變數 = 0 if 年份 < 2009 

gen 地區變數 = real(地區)

gen 母公司生產力 =母公司實收資本額/員工人數



gen 三級 = 0
replace 三級 = 1 if tse產業別 == 27 
replace 三級 = 1 if tse產業別 == 30
replace 三級 = 1 if tse產業別 == 14
replace 三級 = 1 if tse產業別 == 15
replace 三級 = 1 if tse產業別 == 16
replace 三級 = 1 if tse產業別 == 17
replace 三級 = 1 if tse產業別 == 18
replace 三級 = 1 if tse產業別 == 23
replace 三級 = 1 if tse產業別 == 19
replace 三級 = 1 if tse產業別 == 20

mlogit 地區變數 子公司實收資本額ntd i.三級 母公司生產力 員工人數 設立年數 年份變數 , baseoutcome(0)

mlogit 地區變數 子公司實收資本額ntd i.三級 母公司生產力 員工人數 設立年數 i.年份 , baseoutcome(0)

