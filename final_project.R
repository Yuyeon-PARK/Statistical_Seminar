library(ggplot2)
library(dplyr)


####데이터 로드####
GDP<-read.csv("gdp.csv")
hum<-read.csv("humanities.csv")
int<-read.csv("internet.csv")

head(GDP)
head(hum)
head(int)

####데이터 merge####

GDP<-select(GDP,c(1,2,13))
hum<-select(hum,c(1,2,25))
int<-select(int,c(1,9))
head(GDP)
head(hum)
head(int)

names(int)<-c("country","internet")

total1 <- merge(GDP,hum,by="Country.Code")
total1<-select(total1,1,2,3,5)
names(total1)<-c("code","country","gdp","humanities")
head(total1)

total <- merge(total1,int,by="country")
total <-select(total,-2)
head(total)

####plot#####
pairs(total[,2:4])

####변수변환####
total$lngdp<-log(total$gdp)
pairs(total[,3:5])
head(total)

attach(total)

ggplot(total)+
geom_point(aes(x=internet,y=lngdp),color=humanities)

ggplot(total, aes(x=internet, y=lngdp)) +
  geom_point() + 
  geom_text(label=country)







