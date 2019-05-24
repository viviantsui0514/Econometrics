use "C:\Users\vivian\Desktop\east.dta" 

egen 年度總和 =  total(期末累計匯出金額ntd), by( 年份 )
twoway (scatter 年度總和 年份)


drop 年月 簡稱 轉投資名稱 地區 


egen 公司年度總和 = total(期末累計匯出金額ntd), by( 公司代碼 年份 )

by 公司代碼 年份 : gen count=_n

by 公司代碼 年份 : gen count2=_N
keep if count==count2

egen 產業投資數量 = total(count), by( tse產業別 年份 )


xtset 公司代碼 年份

xtreg 公司年度總和 產業投資數量 count,re


