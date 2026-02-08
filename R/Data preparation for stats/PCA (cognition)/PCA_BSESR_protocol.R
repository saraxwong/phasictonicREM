
#install.packages('haven')
#install.packages('ggfortify')
#install.packages('gridExtra')
#install.packages('carData')
#install.packages('car')
#install.packages('factoextra')
#install.packages('mice')
#install.packages('naniar')
#install.packages('COINr')


library("haven")
library("ggplot2")
library("ggfortify")
library("gridExtra")
library("carData")
library("car")
library("factoextra")
library("corrplot")
library("mice")
library("naniar")
library("COINr")
library("mice")
library("naniar")


Folderpath <- 'S:/datasets/Airforce/Behaviour/CPTB cleaned data_PM/'

cpvt <- read_sas(paste0(Folderpath,'cpvt.sas7bdat'))
demog1 <- read_sas(paste0(Folderpath,'/demog1.sas7bdat'))
fir_rir <- read_sas(paste0(Folderpath,'fir_rir.sas7bdat'))
kss <- read_sas(paste0(Folderpath,'kss.sas7bdat'))
nback <- read_sas(paste0(Folderpath,'nback.sas7bdat'))
panas <- read_sas(paste0(Folderpath,'panas.sas7bdat'))
ptt <- read_sas(paste0(Folderpath,'ptt.sas7bdat'))
rand_sched <- read_sas(paste0(Folderpath,'rand_sched.sas7bdat'))
sart <- read_sas(paste0(Folderpath,'sart.sas7bdat'))
vas <- read_sas(paste0(Folderpath,'vas.sas7bdat'))

nback$ntrials <- nback$tcorrt_num + nback$tmis_num + nback$tincrt_num
nback$hit <- nback$tcorrt_num/nback$ntrials
nback$fa <- nback$tincrt_num/nback$ntrials

sart$ntrials <- sart$thit_num + sart$tcjr_num + sart$tfa_num +sart$tmiss_num
sart$hit <- sart$thit_num/85
sart$fa <- sart$tfa_num/15

fir <- subset(fir_rir, testname == 'FIR') 
rir <- subset(fir_rir, testname == 'RIR') 
kss_start <- subset(kss, kss_num == '1')
kss_end <- subset(kss, kss_num == '2')
kss_change <- subset(kss, kss_num == '3')
nback_integrated <- subset(nback, test_measure == 'INTEGRATED')
nback_verbal <- subset(nback, test_measure == 'VERBAL')
nback_spatial <- subset(nback, test_measure == 'SPATIAL')
nback_pictorial <- subset(nback, test_measure == 'PICTORIAL')

nback_integrated_l1_all <- subset(nback_integrated, level == '1' & exp_resp == '3')
nback_integrated_l1_match <- subset(nback_integrated, level == '1' & exp_resp == '1') # hit
nback_integrated_l1_mismatch <- subset(nback_integrated, level == '1' & exp_resp == '2') # fa

nback_integrated_l2_all <- subset(nback_integrated, level == '2' & exp_resp == '3')
nback_integrated_l2_match <- subset(nback_integrated, level == '2' & exp_resp == '1')
nback_integrated_l2_mismatch <- subset(nback_integrated, level == '2' & exp_resp == '2')

nback_verbal_l1_all <- subset(nback_verbal, level == '1' & exp_resp == '3')
nback_verbal_l1_match <- subset(nback_verbal, level == '1' & exp_resp == '1')
nback_verbal_l1_mismatch <- subset(nback_verbal, level == '1' & exp_resp == '2')

nback_verbal_l2_all <- subset(nback_verbal, level == '2' & exp_resp == '3')
nback_verbal_l2_match <- subset(nback_verbal, level == '2' & exp_resp == '1')
nback_verbal_l2_mismatch <- subset(nback_verbal, level == '2' & exp_resp == '2')

nback_verbal_l3_all <- subset(nback_verbal, level == '3' & exp_resp == '3')
nback_verbal_l3_match <- subset(nback_verbal, level == '3' & exp_resp == '1')
nback_verbal_l3_mismatch <- subset(nback_verbal, level == '3' & exp_resp == '2')

nback_spatial_l1_all <- subset(nback_spatial, level == '1' & exp_resp == '3')
nback_spatial_l1_match <- subset(nback_spatial, level == '1' & exp_resp == '1')
nback_spatial_l1_mismatch <- subset(nback_spatial, level == '1' & exp_resp == '2')

nback_spatial_l2_all <- subset(nback_spatial, level == '2' & exp_resp == '3')
nback_spatial_l2_match <- subset(nback_spatial, level == '2' & exp_resp == '1')
nback_spatial_l2_mismatch <- subset(nback_spatial, level == '2' & exp_resp == '2')

nback_pictorial_l1_all <- subset(nback_pictorial, level == '1' & exp_resp == '3')
nback_pictorial_l1_match <- subset(nback_pictorial, level == '1' & exp_resp == '1')
nback_pictorial_l1_mismatch <- subset(nback_pictorial, level == '1' & exp_resp == '2')

nback_pictorial_l2_all <- subset(nback_pictorial, level == '2' & exp_resp == '3')
nback_pictorial_l2_match <- subset(nback_pictorial, level == '2' & exp_resp == '1')
nback_pictorial_l2_mismatch <- subset(nback_pictorial, level == '2' & exp_resp == '2')

panas_pos <- subset(panas, panas_type == 'POSITIVE')
panas_neg <- subset(panas, panas_type == 'NEGATIVE')

vas_l1 <- subset(vas, level == '1')
vas_l2 <- subset(vas, level == '2')
vas_l3 <- subset(vas, level == '3')

colnames(cpvt) <- paste("cpvt", colnames(cpvt), sep = "_")
colnames(fir) <- paste("fir", colnames(fir), sep = "_")
colnames(rir) <- paste("rir", colnames(rir), sep = "_")
colnames(kss_start) <- paste("kss_start", colnames(kss_start), sep = "_")
colnames(kss_end) <- paste("kss_end", colnames(kss_end), sep = "_")
colnames(kss_change) <- paste("kss_change", colnames(kss_change), sep = "_")
colnames(nback_integrated_l1_all) <- paste("nback_integrated_l1_all", colnames(nback_integrated_l1_all), sep = "_")
colnames(nback_integrated_l2_all) <- paste("nback_integrated_l2_all", colnames(nback_integrated_l2_all), sep = "_")
colnames(nback_verbal_l1_all) <- paste("nback_verbal_l1_all", colnames(nback_verbal_l1_all), sep = "_")
colnames(nback_verbal_l2_all) <- paste("nback_verbal_l2_all", colnames(nback_verbal_l2_all), sep = "_")
colnames(nback_verbal_l3_all) <- paste("nback_verbal_l3_all", colnames(nback_verbal_l3_all), sep = "_")
colnames(nback_spatial_l1_all) <- paste("nback_spatial_l1_all", colnames(nback_spatial_l1_all), sep = "_")
colnames(nback_spatial_l2_all) <- paste("nback_spatial_l2_all", colnames(nback_spatial_l2_all), sep = "_")
colnames(nback_pictorial_l1_all) <- paste("nback_pictorial_l1_all", colnames(nback_pictorial_l1_all), sep = "_")
colnames(nback_pictorial_l2_all) <- paste("nback_pictorial_l2_all", colnames(nback_pictorial_l2_all), sep = "_")
colnames(nback_integrated_l1_match) <- paste("nback_integrated_l1_match", colnames(nback_integrated_l1_match), sep = "_")
colnames(nback_integrated_l2_match) <- paste("nback_integrated_l2_match", colnames(nback_integrated_l2_match), sep = "_")
colnames(nback_verbal_l1_match) <- paste("nback_verbal_l1_match", colnames(nback_verbal_l1_match), sep = "_")
colnames(nback_verbal_l2_match) <- paste("nback_verbal_l2_match", colnames(nback_verbal_l2_match), sep = "_")
colnames(nback_verbal_l3_match) <- paste("nback_verbal_l3_match", colnames(nback_verbal_l3_match), sep = "_")
colnames(nback_spatial_l1_match) <- paste("nback_spatial_l1_match", colnames(nback_spatial_l1_match), sep = "_")
colnames(nback_spatial_l2_match) <- paste("nback_spatial_l2_match", colnames(nback_spatial_l2_match), sep = "_")
colnames(nback_pictorial_l1_match) <- paste("nback_pictorial_l1_match", colnames(nback_pictorial_l1_match), sep = "_")
colnames(nback_pictorial_l2_match) <- paste("nback_pictorial_l2_match", colnames(nback_pictorial_l2_match), sep = "_")
colnames(nback_integrated_l1_mismatch) <- paste("nback_integrated_l1_mismatch", colnames(nback_integrated_l1_mismatch), sep = "_")
colnames(nback_integrated_l2_mismatch) <- paste("nback_integrated_l2_mismatch", colnames(nback_integrated_l2_mismatch), sep = "_")
colnames(nback_verbal_l1_mismatch) <- paste("nback_verbal_l1_mismatch", colnames(nback_verbal_l1_mismatch), sep = "_")
colnames(nback_verbal_l2_mismatch) <- paste("nback_verbal_l2_mismatch", colnames(nback_verbal_l2_mismatch), sep = "_")
colnames(nback_verbal_l3_mismatch) <- paste("nback_verbal_l3_mismatch", colnames(nback_verbal_l3_mismatch), sep = "_")
colnames(nback_spatial_l1_mismatch) <- paste("nback_spatial_l1_mismatch", colnames(nback_spatial_l1_mismatch), sep = "_")
colnames(nback_spatial_l2_mismatch) <- paste("nback_spatial_l2_mismatch", colnames(nback_spatial_l2_mismatch), sep = "_")
colnames(nback_pictorial_l1_mismatch) <- paste("nback_pictorial_l1_mismatch", colnames(nback_pictorial_l1_mismatch), sep = "_")
colnames(nback_pictorial_l2_mismatch) <- paste("nback_pictorial_l2_mismatch", colnames(nback_pictorial_l2_mismatch), sep = "_")
colnames(panas_pos) <- paste("panas_pos", colnames(panas_pos), sep = "_")
colnames(panas_neg) <- paste("panas_neg", colnames(panas_neg), sep = "_")
colnames(ptt) <- paste("ptt", colnames(ptt), sep = "_")
colnames(sart) <- paste("sart", colnames(sart), sep = "_")
colnames(vas_l1) <- paste("vas_l1", colnames(vas_l1), sep = "_")
colnames(vas_l2) <- paste("vas_l2", colnames(vas_l2), sep = "_")
colnames(vas_l3) <- paste("vas_l3", colnames(vas_l3), sep = "_")


all_var.active <- cbind(fir[,1:5],fir[,9:12],fir[,15],cpvt[,16],cpvt[,18:20],fir[,16], fir[,19:20],rir[,16], rir[,19:21], kss_start[,16],kss_end[,16],
                        nback_verbal_l1_all[,19],nback_verbal_l2_all[,19],nback_verbal_l3_all[,19],
                        nback_spatial_l1_all[,19],nback_spatial_l2_all[,19],
                        nback_pictorial_l1_all[,19],nback_pictorial_l2_all[,19],
                        nback_verbal_l1_match[,25],nback_verbal_l2_match[,25],nback_verbal_l3_match[,25],
                        nback_spatial_l1_match[,25],nback_spatial_l2_match[,25],
                        nback_pictorial_l1_match[,25],nback_pictorial_l2_match[,25],
                        nback_verbal_l1_mismatch[,26],nback_verbal_l2_mismatch[,26],nback_verbal_l3_mismatch[,26],
                        nback_spatial_l1_mismatch[,26],nback_spatial_l2_mismatch[,26],
                        nback_pictorial_l1_mismatch[,26],nback_pictorial_l2_mismatch[,26],
                        panas_pos[,16],panas_neg[,16],ptt[,15:16],ptt[,21],ptt[,23], sart[,20:21],vas_l1[,16:19],vas_l2[,16:19],vas_l3[,16:19])

# original data has 122 measurements per participant: 122*36 = 4392


# Extract Baseline, SE and SR days
BSESR <- subset(all_var.active, fir_day_type == 'B' | fir_day_type == 'D') #  122 minus 5 adaptation minus 18 and minus 19 CR = 80 measurements per participant: 80*36 = 2880

# Visualize missing data
#vis_miss(all_var.active)
vis_miss(BSESR)

# Count missing values in each column
sapply(BSESR, function(x) sum(is.na(x))) # ~60 missing observations / 2880 for each variable (~2 %)

# Overall missing value count
sum(is.na(BSESR))

# Remove completely missing observations (across all variables) 
rem_obs <- data.frame()

for(o in 1:nrow(BSESR)) {
  if (sum(is.na(BSESR[o,11:64])) == 54) {
    rem_obs <- rbind(rem_obs,as.numeric(o))
  }
}

rows_missing <- nrow(rem_obs) # 55 of 2880 observations (~2 %)
keep_obs <- setdiff(1:nrow(BSESR),rem_obs[,1]) 

BSESR_scr <- BSESR[-rem_obs[,1],]
vis_miss(BSESR_scr)
n_missing <- sum(is.na(BSESR_scr)) # 484 / 180800 missing (0.3 %)

# For each participant impute all columns with median across all observations of that variable of that participant
sub <- unique(BSESR_scr$fir_subj)  
BSESR_scr_imputed <- data.frame()


for(s in 1:length(sub)) {
  
  BSESR_scr_sub <- subset(BSESR_scr, fir_subj == sub[s])
  
  BSESR_sub_imputed <- BSESR_scr_sub
  
  sum(is.na(BSESR_sub_imputed))
  
  for(i in 1:ncol(BSESR_sub_imputed)) {
    if(is.numeric(BSESR_sub_imputed[[i]])) {
      BSESR_sub_imputed[[i]][is.na(BSESR_sub_imputed[[i]])] <- median(BSESR_sub_imputed[[i]], na.rm = TRUE)
    }
  }
  
  sum(is.na(BSESR_sub_imputed))
  
  BSESR_scr_imputed <- rbind(BSESR_scr_imputed, BSESR_sub_imputed)
  
}

vis_miss(BSESR_scr_imputed)
sum(is.na(BSESR_scr_imputed))


### calculate a-prime

# verbal l1
aprime_all <- data.frame()

for(o in 1:nrow(BSESR_scr_imputed)) {
  
  hit <- BSESR_scr_imputed$nback_verbal_l1_match_hit[o]
  fa <- BSESR_scr_imputed$nback_verbal_l1_mismatch_fa[o]
  
  if (hit > fa) {
    aprime <- 1/2 + (hit-fa)*(1+hit-fa)/(4*hit*(1-fa)) 
  }
  else if (fa > hit) {
    aprime <- 1/2 + (fa-hit)*(1+fa-hit)/(4*fa*(1-hit))
  }
  else if (fa == hit) { # if hit == fa then second part becomes 0 in both equations so aprime = 1/2
    aprime <- 1/2
  }
  aprime_all <- rbind(aprime_all,aprime)
  
}

BSESR_scr_imputed$nback_verbal_l1_aprime <- aprime_all[,1]


# verbal l2
aprime_all <- data.frame()

for(o in 1:nrow(BSESR_scr_imputed)) {
  
  hit <- BSESR_scr_imputed$nback_verbal_l2_match_hit[o]
  fa <- BSESR_scr_imputed$nback_verbal_l2_mismatch_fa[o]
  
  if (hit > fa) {
    aprime <- 1/2 + (hit-fa)*(1+hit-fa)/(4*hit*(1-fa)) 
  }
  else if (fa > hit) {
    aprime <- 1/2 + (fa-hit)*(1+fa-hit)/(4*fa*(1-hit))
  }
  else if (fa == hit) { # if hit == fa then second part becomes 0 in both equations so aprime = 1/2
    aprime <- 1/2
  }
  aprime_all <- rbind(aprime_all,aprime)
  
}

BSESR_scr_imputed$nback_verbal_l2_aprime <- aprime_all[,1]



# verbal l2
aprime_all <- data.frame()

for(o in 1:nrow(BSESR_scr_imputed)) {
  
  hit <- BSESR_scr_imputed$nback_verbal_l2_match_hit[o]
  fa <- BSESR_scr_imputed$nback_verbal_l2_mismatch_fa[o]
  
  if (hit > fa) {
    aprime <- 1/2 + (hit-fa)*(1+hit-fa)/(4*hit*(1-fa)) 
  }
  else if (fa > hit) {
    aprime <- 1/2 + (fa-hit)*(1+fa-hit)/(4*fa*(1-hit))
  }
  else if (fa == hit) { # if hit == fa then second part becomes 0 in both equations so aprime = 1/2
    aprime <- 1/2
  }
  aprime_all <- rbind(aprime_all,aprime)
  
}

BSESR_scr_imputed$nback_verbal_l2_aprime <- aprime_all[,1]


# verbal l3
aprime_all <- data.frame()

for(o in 1:nrow(BSESR_scr_imputed)) {
  
  hit <- BSESR_scr_imputed$nback_verbal_l3_match_hit[o]
  fa <- BSESR_scr_imputed$nback_verbal_l3_mismatch_fa[o]
  
  if (hit > fa) {
    aprime <- 1/2 + (hit-fa)*(1+hit-fa)/(4*hit*(1-fa)) 
  }
  else if (fa > hit) {
    aprime <- 1/2 + (fa-hit)*(1+fa-hit)/(4*fa*(1-hit))
  }
  else if (fa == hit) { # if hit == fa then second part becomes 0 in both equations so aprime = 1/2
    aprime <- 1/2
  }
  aprime_all <- rbind(aprime_all,aprime)
  
}

BSESR_scr_imputed$nback_verbal_l3_aprime <- aprime_all[,1]


# spatial l1
aprime_all <- data.frame()

for(o in 1:nrow(BSESR_scr_imputed)) {
  
  hit <- BSESR_scr_imputed$nback_spatial_l1_match_hit[o]
  fa <- BSESR_scr_imputed$nback_spatial_l1_mismatch_fa[o]
  
  if (hit > fa) {
    aprime <- 1/2 + (hit-fa)*(1+hit-fa)/(4*hit*(1-fa)) 
  }
  else if (fa > hit) {
    aprime <- 1/2 + (fa-hit)*(1+fa-hit)/(4*fa*(1-hit))
  }
  else if (fa == hit) { # if hit == fa then second part becomes 0 in both equations so aprime = 1/2
    aprime <- 1/2
  }
  aprime_all <- rbind(aprime_all,aprime)
  
}

BSESR_scr_imputed$nback_spatial_l1_aprime <- aprime_all[,1]


# spatial l2
aprime_all <- data.frame()

for(o in 1:nrow(BSESR_scr_imputed)) {
  
  hit <- BSESR_scr_imputed$nback_spatial_l2_match_hit[o]
  fa <- BSESR_scr_imputed$nback_spatial_l2_mismatch_fa[o]
  
  if (hit > fa) {
    aprime <- 1/2 + (hit-fa)*(1+hit-fa)/(4*hit*(1-fa)) 
  }
  else if (fa > hit) {
    aprime <- 1/2 + (fa-hit)*(1+fa-hit)/(4*fa*(1-hit))
  }
  else if (fa == hit) { # if hit == fa then second part becomes 0 in both equations so aprime = 1/2
    aprime <- 1/2
  }
  aprime_all <- rbind(aprime_all,aprime)
  
}

BSESR_scr_imputed$nback_spatial_l2_aprime <- aprime_all[,1]


# pictorial l1
aprime_all <- data.frame()

for(o in 1:nrow(BSESR_scr_imputed)) {
  
  hit <- BSESR_scr_imputed$nback_pictorial_l1_match_hit[o]
  fa <- BSESR_scr_imputed$nback_pictorial_l1_mismatch_fa[o]
  
  if (hit > fa) {
    aprime <- 1/2 + (hit-fa)*(1+hit-fa)/(4*hit*(1-fa)) 
  }
  else if (fa > hit) {
    aprime <- 1/2 + (fa-hit)*(1+fa-hit)/(4*fa*(1-hit))
  }
  else if (fa == hit) { # if hit == fa then second part becomes 0 in both equations so aprime = 1/2
    aprime <- 1/2
  }
  aprime_all <- rbind(aprime_all,aprime)
  
}

BSESR_scr_imputed$nback_pictorial_l1_aprime <- aprime_all[,1]


# pictorial l2
aprime_all <- data.frame()

for(o in 1:nrow(BSESR_scr_imputed)) {
  
  hit <- BSESR_scr_imputed$nback_pictorial_l2_match_hit[o]
  fa <- BSESR_scr_imputed$nback_pictorial_l2_mismatch_fa[o]
  
  if (hit > fa) {
    aprime <- 1/2 + (hit-fa)*(1+hit-fa)/(4*hit*(1-fa)) 
  }
  else if (fa > hit) {
    aprime <- 1/2 + (fa-hit)*(1+fa-hit)/(4*fa*(1-hit))
  }
  else if (fa == hit) { # if hit == fa then second part becomes 0 in both equations so aprime = 1/2
    aprime <- 1/2
  }
  aprime_all <- rbind(aprime_all,aprime)
  
}

BSESR_scr_imputed$nback_pictorial_l2_aprime <- aprime_all[,1]


# SART 
aprime_all <- data.frame()

for(o in 1:nrow(BSESR_scr_imputed)) {
  
  hit <- BSESR_scr_imputed$sart_hit[o]
  fa <- BSESR_scr_imputed$sart_fa[o]
  
  if (hit > fa) {
    aprime <- 1/2 + (hit-fa)*(1+hit-fa)/(4*hit*(1-fa)) 
  }
  else if (fa > hit) {
    aprime <- 1/2 + (fa-hit)*(1+fa-hit)/(4*fa*(1-hit))
  }
  else if (fa == hit) { # if hit == fa then second part becomes 0 in both equations so aprime = 1/2
    aprime <- 1/2
  }
  aprime_all <- rbind(aprime_all,aprime)
  
}

BSESR_scr_imputed$sart_aprime <- aprime_all[,1]

###

#BSESR_nonan <- na.omit(BSESR)

BSESR_nonan <- BSESR_scr_imputed
BSESR_SE_nonan <- subset(BSESR_scr_imputed, fir_condition == 'SE')
BSESR_SR_nonan <- subset(BSESR_scr_imputed, fir_condition == 'SR')

#BSESR_nonan <- na.omit(BSESR)
#BSESR_SE_nonan <- na.omit(BSESR_SE)
#BSESR_SR_nonan <- na.omit(BSESR_SR)

BSESR_nonan.active = subset(BSESR_nonan, select = -c(1:10,31:44,51:52))
BSESR_SE_nonan.active = subset(BSESR_SE_nonan, select = -c(1:10,31:44,51:52))
BSESR_SR_nonan.active = subset(BSESR_SR_nonan, select = -c(1:10,31:44,51:52))

head(BSESR_nonan.active)
summary(BSESR_nonan.active)

# B + SE + SR

BSESR_nonan.pca <- prcomp(BSESR_nonan.active, scale = TRUE)
print(BSESR_nonan.pca)
summary_PCA <- summary(BSESR_nonan.pca)
contrib <- summary_PCA$importance

write.csv(contrib, "S:/datasets/Airforce/Behaviour/PCA/PCA_contrib_BSESR.csv")

eig.val<-get_eigenvalue(BSESR_nonan.pca)
eig.val
fviz_eig(BSESR_nonan.pca, col.var="blue")

var <- get_pca_var(BSESR_nonan.pca)
var

coord <- var$coord
cos2 <- var$cos2
contrib <- var$contrib

write.csv(coord, "S:/datasets/Airforce/Behaviour/PCA/PCA_coord_BSESR.csv")


ind <- get_pca_ind(BSESR_nonan.pca)
ind

ind_coord <- ind$coord

#BSESR_nonan_ind_coord <- cbind(BSESR_scr_imputed[,1:10],ind_coord)

BSESR_nonan_ind_coord <- BSESR[,1:10]
BSESR_nonan_ind_coord$Dim.1 <- rep(NA,nrow(BSESR))
BSESR_nonan_ind_coord$Dim.2 <- rep(NA,nrow(BSESR))
BSESR_nonan_ind_coord$Dim.3 <- rep(NA,nrow(BSESR))
BSESR_nonan_ind_coord$Dim.4 <- rep(NA,nrow(BSESR))

BSESR_nonan_ind_coord$Dim.1[keep_obs] <- ind_coord[,1]
BSESR_nonan_ind_coord$Dim.2[keep_obs] <- ind_coord[,2]
BSESR_nonan_ind_coord$Dim.3[keep_obs] <- ind_coord[,3]
BSESR_nonan_ind_coord$Dim.4[keep_obs] <- ind_coord[,4]


write.csv(BSESR_nonan_ind_coord, "S:/datasets/Airforce/Behaviour/PCA/PCA_ind_coord_BSESR.csv")


SESR<- subset(BSESR_nonan, fir_day_type == 'D')


boxplot(Dim.1 ~ fir_condition*fir_day_num, data = BSESR_nonan_ind_coord, col = c("white", "steelblue"), frame = FALSE)
boxplot(Dim.2 ~ fir_condition*fir_day_num, data = BSESR_nonan_ind_coord, col = c("white", "steelblue"), frame = FALSE)
boxplot(Dim.3 ~ fir_condition*fir_day_num, data = BSESR_nonan_ind_coord, col = c("white", "steelblue"), frame = FALSE)
boxplot(Dim.4 ~ fir_condition*fir_day_num, data = BSESR_nonan_ind_coord, col = c("white", "steelblue"), frame = FALSE)


# PC1 contributors - more effort and lower accuracy over time
boxplot(vas_l2_vasdemlohi ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(vas_l1_vasdemlohi ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(kss_start_respmin ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(cpvt_tinvrtslow_mean ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(sart_aprime ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(nback_verbal_l1_aprime ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(nback_verbal_l2_aprime ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(nback_verbal_l3_aprime ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)


# PC2 contributors - slower reaction times over time
boxplot(nback_spatial_l1_all_tcorrt_med ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(nback_spatial_l2_all_tcorrt_med ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(nback_verbal_l1_all_tcorrt_med ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(nback_verbal_l2_all_tcorrt_med ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(ptt_ted_med ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(ptt_t01ontarget_num ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(ptt_t04ontarget_num ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)

# PC3 contributors - higher sd over time, lower accuracy over time
boxplot(ptt_ted_sd ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(fir_tlat_sd ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(rir_tlat_sd ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(nback_verbal_l2_aprime ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)


# PC4 contributors - more lapses, worse mood over time
boxplot(cpvt_tresplong_num ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(panas_pos_seladjratmean ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)
boxplot(cpvt_tinvrtslow_mean ~ fir_condition*fir_day_num, data = SESR, col = c("white", "steelblue"), frame = FALSE)



library("corrplot")
corrplot(var$cos2, is.corr=FALSE)

fviz_cos2(BSESR_nonan.pca, choice = "var", axes = 3:4)


# vector plot
fviz_pca_var(BSESR_nonan.pca,
             col.var = "cos2", # Color by the quality of representation
             gradient.cols = c("darkorchid4", "gold", "darkorange"),
             repel = TRUE
)

fviz_pca_var(BSESR_nonan.pca,, axes = c(1, 3),
             col.var = "cos2", # Color by the quality of representation
             gradient.cols = c("darkorchid4", "gold", "darkorange"),
             repel = TRUE
)

fviz_pca_var(BSESR_nonan.pca,, axes = c(1, 4),
             col.var = "cos2", # Color by the quality of representation
             gradient.cols = c("darkorchid4", "gold", "darkorange"),
             repel = TRUE
)


# Contributions of variables to PC1
a<-fviz_contrib(BSESR_nonan.pca, choice = "var", axes = 1)
# Contributions of variables to PC2
b<-fviz_contrib(BSESR_nonan.pca, choice = "var", axes = 2)
grid.arrange(a,b, ncol=2, top='Contribution of the variables to the first two PCs')

# Contributions of variables to PC3
c<-fviz_contrib(BSESR_nonan.pca, choice = "var", axes = 3)
# Contributions of variables to PC4
d<-fviz_contrib(BSESR_nonan.pca, choice = "var", axes = 4)
grid.arrange(c,d, ncol=2, top='Contribution of the variables to the first two PCs')

#fviz_pca_ind(BSESR_nonan.pca,
#             col.ind = "cos2", # Color by the quality of representation
#             gradient.cols = c("darkorchid4", "gold", "darkorange"),
#             repel = TRUE
#)

# Total contribution on PC1 and PC2
#fviz_contrib(BSESR_nonan.pca, choice = "ind", axes = 1:2)

#autoplot(BSESR_nonan.pca, loadings=TRUE, loadings.colour='darkorchid4', loadings.label=TRUE, loadings.label.size=3)

#kmeans<-eclust(BSESR_scr_imputed, k=4)
#autoplot(BSESR_nonan.pca, data=kmeans, colour="cluster")

