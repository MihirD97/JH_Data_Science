## Assignment C2 Week 2

#Define pollutantmean function

library(tidyverse)

pollutantmean <- function (directory, pollutant, id=1:332){
  for (i in 1:length(id)){
    temp_dir <- paste(as.character(directory),"/", formatC(id[i], width = 3, format = "d", flag = "0"),".csv",sep = "")      #Using formatC function to pad length of id to 3 with leading 0s
    
    if(exists("df1")){                                                     # Create single dataframe with all individual csv files data
      df1 <- rbind(df1, read.csv(temp_dir))
    } else {
      df1 <- read.csv(temp_dir)
    }
  }
  
  mean(df1[,as.character(pollutant)], na.rm = TRUE)
}
pollutantmean("data/specdata","sulfate",1:10)



complete <- function(directory, id = 1:332){
  for (i in 1:length(id)){
    temp_dir <- paste(as.character(directory),"/", formatC(id[i], width = 3, format = "d", flag = "0"),".csv",sep = "")      #Using formatC function to pad length of id to 3 with leading 0s
    
    if(exists("df1")){                                                     # Create single dataframe with all individual csv files data
      df1 <- rbind(df1, read.csv(temp_dir))
    } else {
      df1 <- read.csv(temp_dir)
    }
  }
  df1 %>% drop_na() %>% count(ID)
}

complete("data/specdata", 1:3)

corr <- function(directory,threshold =0){
  #list1 <- complete(directory)
  #list_threshold <- list1[list1$n>=threshold,]
  corr_list <- rep(NA,332)
  for(i in 1:332){
    temp_dir <- paste(as.character(directory),"/", formatC(i, width = 3, format = "d", flag = "0"),".csv",sep = "")      #Using formatC function to pad length of id to 3 with leading 0s
    temp_df <- read.csv(temp_dir) %>% drop_na()
    count_ID <- nrow(temp_df)
   if(count_ID >= threshold){
     corr_list[i] <- cor(as.numeric(temp_df$sulfate),as.numeric(temp_df$nitrate))
   }
  }
  corr_list[!is.na(corr_list)]
  
}

dat <- corr("data/specdata", 400)
head(dat)


# Questions
RNGversion("3.5.1")  
set.seed(42)
cc <- complete("data/specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "n"])

cr <- corr("data/specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)


cr <- corr("data/specdata", 129)                
cr <- sort(cr)                
no <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(no, round(cr[sample(no, 5)], 4))
print(out)


cr <- corr("data/specdata", 2000)                
no <- length(cr)                
cr <- corr("data/specdata", 1000)                
cr <- sort(cr)
print(c(no, round(cr, 4)))
