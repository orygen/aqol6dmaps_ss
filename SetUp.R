library(ready4)
library(ready4show)
#path_1L_chr <- "SPECIFY PATH ENDING IN '/' "
A <- readRDS(paste0(path_1L_chr,"A.RDS")) # Read in results
A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr <- paste0(path_1L_chr,"Real") # Update relative path to raw output
A@c_SpecificProject@c_SpecificResults@a_SpecificShareable@shareable_outp_ls$paths_to_figs_ls <- specific::make_paths_to_ms_smry_plts_ls(paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr, "/Output"), A@c_SpecificProject@c_SpecificResults@a_SpecificShareable@shareable_outp_ls)
A@d_TTUReports@a_TTUSynopsis@b_SpecificResults@a_SpecificShareable@shareable_outp_ls$results_ls$paths_to_figs_ls <- A@c_SpecificProject@c_SpecificResults@a_SpecificShareable@shareable_outp_ls$paths_to_figs_ls
A@d_TTUReports@a_TTUSynopsis@authors_r3[1,6] <- "\"Orygen, Monash\"" 
A@d_TTUReports@a_TTUSynopsis@authors_r3[1,9] <- "matthew.hamilton1@monash.edu" 
A@d_TTUReports@a_TTUSynopsis@funding_1L_chr <- paste0(A@d_TTUReports@a_TTUSynopsis@funding_1L_chr %>% stringr::str_sub(end =-16), ", headspace and an Australian Government Research Training Program (RTP) Scholarship.")
A@d_TTUReports@a_TTUSynopsis@abstract_args_ls$abstract_ls <- list(Background = "Health utility data are rarely routinely collected in mental helath services. Mapping models that predict health utility from other outcome measures are typically derived from cross-sectional data but often used to predict longitudinal change.",
                                                                  Objective = "We aimed to develop models to map six psychological measures to adolescent Assessment of Quality of Life - Six Dimensions (AQOL-6D) health utility for youth mental health service clients and assess the ability of mapping models to predict longitudinal change. ", 
                                                                  Methods = "We recruited 1107 young people attending Australian primary mental health services, collecting data at two time points, three months apart. Five linear and three generalised linear models were explored to identify the best mapping model. Ten-fold cross-validation using R^2, root mean square error (RMSE) and mean absolute error (MAE) were used to compare models and assess predictive ability of six candidate measures of psychological distress, depression and anxiety. Linear / generalised linear mixed effect models were used to construct longitudinal predictive models for AQoL-6D change. ", 
                                                                  Results = "A depression measure (Patient Health Questionnaire-9) was the strongest independent predictor of health utility. Linear regression models with complementary log-log transformation of utility score were the best performing models. Between-person associations were slightly larger than within-person associations for most of the predictors. ", 
                                                                  Conclusions = "Adolescent AQoL-6D utility can be derived from a range of psychological distress, depression and anxiety measures. Mapping models estimated from cross-sectional data can approximate longitudinal change but may slightly bias health utility predictions. ",
                                                                  Data = "Replication code and model catalogues are available at: https://dataverse.harvard.edu/privateurl.xhtml?token=a437cc9c-b809-4513-bbef-a2333c1c934a ."  #https://doi.org/10.7910/DVN/DKDIB0.
                                                                  )#https://dataverse.harvard.edu/privateurl.xhtml?token=a437cc9c-b809-4513-bbef-a2333c1c934a
A@d_TTUReports@a_TTUSynopsis@title_1L_chr <- "Mapping psychological distress, depression and anxiety measures to AQoL-6D utility using data from a sample of young people presenting to primary mental health services"
#A@d_TTUReports@a_TTUSynopsis@tables_in_body_lgl <-  A@d_TTUReports@a_TTUSynopsis@figures_in_body_lgl <- T
#dir.create(paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Markdown/Manuscript_Submission"))
file.copy(list.files(getwd()),paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Markdown/Manuscript_Submission"), recursive = T, overwrite = T)
authorSlot(A, "d_TTUReports", what_1L_chr = "Manuscript_Submission", 
           consent_1L_chr = "Y",
           download_tmpl_1L_lgl = F)
# file.copy("Data/RefCopy.bib",paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Reports/Manuscript_Submission/Tex_Export"), overwrite = T)
# Manually remove "../Data/", "../../../Output/" and "../../../Output/_Descriptives/" from Tex File
authorReport(renewSlot(A,"d_TTUReports@a_TTUSynopsis@rmd_fl_nms_ls",
                       ready4show::make_rmd_fl_nms_ls(pdf_fl_nm_1L_chr = "TA_PDF")) %>% 
               procureSlot("d_TTUReports@a_TTUSynopsis"),
             consent_1L_chr = "Y",
             fl_nm_1L_chr = "Supplement", what_1L_chr = "Manuscript_Submission")
#params_ls <- list(X = X)
#params_ls$X@figures_in_body_lgl <- params_ls$X@tables_in_body_lgl <- F
rmarkdown::render(paste0("Parent_",
                         "Word",#
                         "/",
                         "Main_Word",#
                         ".Rmd"),
                  output_format = NULL,
                  params = list(X = A@d_TTUReports@a_TTUSynopsis),
                  output_file = "Manuscript.docx",
                  output_dir = paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Reports/Manuscript_Submission"))
#3728