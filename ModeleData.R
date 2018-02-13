#CHARGEMENT DES PACKAGES
library(dplyr)
library(lubridate)
library(readxl)
# IMPORTATION DES DONNÉES

Repport<- read_excel("C:/Users/jeanmilou.pierre/Desktop/WeeklyDashboard/Donne_T2/Ad Hoc Reporting Tool_20180212_095003.xlsx")
View(Repport)
Repport<-Repport %>% 
  select(c(1,2,3,4,5,6,8,9,15,16,17))
### LAST 7 DAYS

 ## PENDING LAST 7 DAYS
  # AJOUTS DES LABEL
    # Label des produits
   VEC_LABEL_PRODRUIT=c("SEC - Search Engine Marketing Campaign"="SEC",
                     "SalesForce.com"="SalesForce",
                     "Rate Proposal Tool (RPT)" ="RPT",
                  
                     "Online Merchant Management (OMM)"="OMM",
                     
                     "Merchant Content Tool (MCT)" ="MCT",
                     "DET - Domain and Email Tool" ="DET",
                     "Customer First"="CF",
                     "Content and Asset Management System (CAMS)"="CAMS",
                    
                     "New Back End (NBE)"="CAMS",
                     "Document Entry and Search form (DES-UI)"="CAMS",
                     
                     "Compass"="Compass",
                     "Five9"="Five9",
                     "nxDSMP"="nxDSMP",
                     "nxPageSmart"="nxDSMP",
                     "nxAdSmart"="nxDSMP",
                     
                     "SalesForce"="SalesForce",
                     "YP Analytics"="YP Analytics")



# TEST 1
   # Enlever le produit BC
Repport <- Repport %>% filter(`Product Categorization Product Name` != "Business Center")

# Si le test ci-dessous ne retourne pas true on doit modifier VEC_LABEL_PRODRUIT
length(unique(Repport$`Product Categorization Product Name`))==length(VEC_LABEL_PRODRUIT)

# label des prodruits
Repport$Product<-VEC_LABEL_PRODRUIT[Repport$`Product Categorization Product Name`]

# TEST 2
# Si le test ne retourne pas true on doit modifier VEC_LABEL_PRODRUIT; cad 1 ou 
# plusieurs prudruits n'est pas pris en compte
sum(is.na(Repport$Product))==0
