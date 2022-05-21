
#Project:

Competition Bank

#Variable: Spread active - pasive interest rates

#------------------
#O. Set up
#------------------

library(tidyverse)

library(utils)

getwd()

setwd("/Users/luisvicentesotelofarfan/Google\ Drive/IV.Componente\ Político/Comms/HablemosdelFuturo/Banks")

# list.files()

#------------------
#I. Data import 
#------------------

df<-read_csv2("dfBanks.csv")

#------------------
#II. Data Wrangling 
#------------------

# Pre-transformation: Cleansing

# Transformation: Cleansing

rename(df,CountryName = Country_Name)


#FIlter values 

subset1 <- filter(df,Country_Name %in% c("Perú",'Colombia','Chile','Mundo') )

#gather/reshape

library(tidyr)

# From wide to long 

subset1_long <- subset1 %>% gather(year,spread,`2014`,`2015`,`2016`,`2017`,`2018`,`2019`,`2020,`)

# Transformig each variable

subset1_long$year <- as.integer(subset1_long$year)

subset1_long$spread <- as.double(subset1_long$spread)

subset1_long<-arrange(subset1_long,year,spread)


select(subset1_long, -Widht)   # drop variables


subset1_long <- subset1_long %>% rename(SpreadTasaActiva_TasaPasiva=spread)


# subset1_long<-subset1_long %>% mutate(Widht=case_when(Country_Name=="Perú" ~ 2,Country_Name=="Chile" ~1,
					
# 							 Country_Name=="Colombia" ~ 1,Country_Name=="Mundo" ~1))  # append variables


# ggplot (data=subset1_long, mapping=aes(y=SpreadTasaActiva_TasaPasiva,x= year,color=Country_Name,size=5)) +

# geom_point()



ggplot(data=subset1_long,mapping=aes(x=year,y=SpreadTasaActiva_TasaPasiva ,color=Country_Name)) + geom_step()+

scale_color_manual(values=c("Perú"="red", "Chile"="blue", "Colombia"="orange", "Mundo"="green")) +

labs(title="Diferencia en tasas de interés", subtitle="Sistema Bancario:Tasa activa - Tasa Pasiva)", caption="Fuente: World Bank-") + ylab("Spread") + xlab("año") +theme_minimal()+ theme(legend.position="bottom") 








