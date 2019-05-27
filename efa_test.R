###Explanatory Factor Analysis

#Use library
library(psych)

#hoge data 何かデータ（データフレーム）
data<-hogehoge

#Number of remove variable 削除したい項目の数
Rmdata_num<-4

#Criteria for adoption 採用する基準
min_loadings<-0.4
CumulativeVar<-0.5

#Number of factor 因子数
factor_num<-5

#log data 保存するデータ各種
t<-proc.time()
Reslist<-c()
check_vec<-c()

#Number of combination of remove variable 削除する項目の全組み合わせ（インデックス）
SearchItemDf<-t(combn(x=1:ncol(data),m=Rmdata_num))

for(i in (1:nrow(SearchItemDf))){
  if(i%%100==0){print(i)}
  
  rm_data<-data[,-(SearchItemDf[i,])]
  efa <- factanal(rm_data,factors=factor_num,rotation="promax")
  
  if(any(apply(efa$loadings,1,function(x){max(abs(x))<min_loadings}))){
    next
  }
  if(any(apply(efa$loadings,1,function(x){max(abs(x))>1}))){
    next
  }
  print("min,max=OK")
  #check_vec<-append(check_vec,SearchItemDf[i,])
  
  if(min(colSums(efa$loadings*efa$loadings))<1){
    next
  }
  if(max(cumsum(colSums(efa$loading*efa$loading)/dim(efa$loading)[1]))<CumulativeVar){
    next
  }
  print("eigen,CV=OK")
  
  if(efa$PVAL<0.05){
    next
  }
  print("p=OKOKOKOKOKOKOKOK")
  
  Reslist<-append(Reslist,i)
}
print(proc.time()-t)

print(Reslist)

#Index of remove data 削除する項目のインデックス
print(SearchItemDf[Reslist,])

