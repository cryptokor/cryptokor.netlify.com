몽액육즙=c("육","몽","액","즙")
Mong = apply(expand.grid(몽액육즙,몽액육즙,몽액육즙,몽액육즙), 1, paste, collapse = '') 
write.table(Mong, "Mong.txt")

조합 = c("잉","뽀","망","몽")
잉뽀망몽=expand.grid(조합,조합,조합,조합)
코=data.frame(잉뽀망몽$Var1, "월 ", 잉뽀망몽$Var2, "일 ", 잉뽀망몽$Var3, "시 ", 잉뽀망몽$Var4, "분은?") 
apply(코, 1, paste, collapse = '') 
