library(ready4)
#path_1L_chr <- "SPECIFY PATH ENDING IN '/' "
A <- readRDS(paste0(path_1L_chr,"A.RDS")) # Read in results
A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr <- paste0(path_1L_chr,"Real") # Update relative path to raw output
A@d_TTUReports@a_TTUSynopsis@b_SpecificResults@a_SpecificShareable@shareable_outp_ls$results_ls$paths_to_figs_ls <- A@c_SpecificProject@c_SpecificResults@a_SpecificShareable@shareable_outp_ls$paths_to_figs_ls <- specific::make_paths_to_ms_smry_plts_ls(paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr, "/Output"), 
                                                                                                                                                                                                                                                            A@c_SpecificProject@c_SpecificResults@a_SpecificShareable@shareable_outp_ls)
A@d_TTUReports@a_TTUSynopsis@abstract_args_ls$abstract_ls <- list(Background = "Quality Adjusted Life Years (QALYs) are often used in economic evaluations, yet utility weights for deriving them are rarely directly measured in mental health services.",
                                                                  Objective = "We aimed to identify the best mapping models and predictors for adolescent Assessment of Quality of Life - Six Dimensions (AQOL-6D) utility and assess the ability of mapping models to predict longitudinal change.", 
                                                                  Methods = "We recruited 1107 young people attending Australian primary mental health services, collecting data at two time points, three months apart. Five linear and three generalised linear models were explored to identify the best mapping model. Ten-fold cross-validation using R^2, root mean square error (RMSE) and mean absolute error (MAE) were used to compare models and assess predictive ability of six candidate measures of psychological distress, depression and anxiety. Linear / generalised linear mixed effect models were used to construct longitudinal predictive models for AQoL-6D change.", 
                                                                  Results = "A depression measure (Patient Health Questionnaire-9) was the strongest independent predictor of health utility. Linear regression models with complementary log-log transformation of utility score were the best performing models. Between-person associations were slightly larger than within-person associations for most of the predictors.", 
                                                                  Conclusions = "Adolescent AQoL-6D utility can be derived from a range of psychological distress, depression and anxiety measures. Mapping models estimated from cross-sectional data can approximate longitudinal change but may slightly bias health utility predictions.",
                                                                  Data = "Replication code, detailed results and guidance on how to apply the models produced by this study are available in the online repository: https://doi.org/10.7910/DVN/DKDIB0.")
A@d_TTUReports@a_TTUSynopsis@title_1L_chr <- "Mapping psychological distress, depression and anxiety measures to AQoL-6D utility using data from a sample of young people presenting to primary mental health services"
#A@d_TTUReports@a_TTUSynopsis@tables_in_body_lgl <-  A@d_TTUReports@a_TTUSynopsis@figures_in_body_lgl <- T
#dir.create(paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Markdown/Manuscript_Submission"))
file.copy(list.files(getwd()),paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Markdown/Manuscript_Submission"), recursive = T, overwrite = T)
authorSlot(A, "d_TTUReports", what_1L_chr = "Manuscript_Submission", download_tmpl_1L_lgl = F)




##############################################setwd(paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Markdown/Manuscript_Submission/Parent_PDF"))