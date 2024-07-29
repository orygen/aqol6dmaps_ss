library(ready4)
library(ready4show)
#path_1L_chr <- "SPECIFY PATH ENDING IN '/' "
A <- readRDS(paste0(path_1L_chr,"A.RDS")) # Read in results
A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr <- paste0(path_1L_chr,"Real") # Update relative path to raw output
A@c_SpecificProject@c_SpecificResults@a_SpecificShareable@shareable_outp_ls$paths_to_figs_ls <- specific::make_paths_to_ms_smry_plts_ls(paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr, "/Output"), A@c_SpecificProject@c_SpecificResults@a_SpecificShareable@shareable_outp_ls)
diagnostics_chr <- stringr::str_remove_all(A@d_TTUReports@a_TTUSynopsis@b_SpecificResults@a_SpecificShareable@shareable_outp_ls$file_paths_chr %>%
                                             purrr::keep(~endsWith(.x, "_AUTOPLT.png")),
                                           "A_Candidate_Mdls_Cmprsn/")
A@c_SpecificProject@c_SpecificResults@a_SpecificShareable@shareable_outp_ls$paths_to_figs_ls$diagnostics_chr <- paste0(output_data_dir_1L_chr,"A_Candidate_Mdls_Cmprsn/", diagnostics_chr) %>% 
  stats::setNames(paste0("Model diagnostics, single predictor (PHQ-9) ",diagnostics_chr %>% stringr::str_replace_all("A_RT_PHQ9_","") %>%
                           stringr::str_replace_all("_AUTOPLT.png","") %>% 
                           purrr::map_chr(~ready4::get_from_lup_obj(A@c_SpecificProject@c_SpecificResults@a_SpecificShareable@shareable_outp_ls$mdl_types_lup,
                                                                    match_var_nm_1L_chr = "short_name_chr",
                                                                    match_value_xx = .x,
                                                                    target_var_nm_1L_chr = "long_name_chr"))))
A@d_TTUReports@a_TTUSynopsis@b_SpecificResults@a_SpecificShareable@shareable_outp_ls$results_ls$paths_to_figs_ls <- A@c_SpecificProject@c_SpecificResults@a_SpecificShareable@shareable_outp_ls$paths_to_figs_ls
A@d_TTUReports@a_TTUSynopsis@authors_r3[1,6] <- "\"Monash, Orygen\"" 
A@d_TTUReports@a_TTUSynopsis@authors_r3[1,9] <- "matthew.hamilton1@monash.edu" 
A@d_TTUReports@a_TTUSynopsis@funding_1L_chr <- paste0(A@d_TTUReports@a_TTUSynopsis@funding_1L_chr %>% stringr::str_sub(end =-16), ", headspace and an Australian Government Research Training Program (RTP) Scholarship.")
A@d_TTUReports@a_TTUSynopsis@abstract_args_ls$abstract_ls <- list(Background = "Health utility data are rarely routinely collected in mental health services. Mapping models that predict health utility from other outcome measures are typically derived from cross-sectional data but often used to predict longitudinal change.",
                                                                  Objective = "We aimed to develop models to map six psychological measures to adolescent Assessment of Quality of Life - Six Dimensions (AQOL-6D) health utility for youth mental health service clients and assess the ability of mapping models to predict longitudinal change. ", 
                                                                  Methods = "We recruited 1107 young people attending Australian primary mental health services, collecting data at two time points, three months apart. Five linear and three generalised linear models were explored to identify the best mapping model. Ten-fold cross-validation using $R^2$, root mean square error (RMSE) and mean absolute error (MAE) were used to compare models and assess predictive ability of six candidate measures of psychological distress, depression and anxiety. Linear / generalised linear mixed effect models were used to construct longitudinal predictive models for AQoL-6D change. ", 
                                                                  Results = "A depression measure (Patient Health Questionnaire-9) was the strongest independent predictor of health utility. Linear regression models with complementary log-log transformation of utility score were the best performing models. Between-person associations were slightly larger than within-person associations for most of the predictors. ", 
                                                                  Conclusions = "Adolescent AQoL-6D utility can be derived from a range of psychological distress, depression and anxiety measures. Mapping models estimated from cross-sectional data can approximate longitudinal change but may slightly bias health utility predictions. ",
                                                                  Data = "Replication code and model catalogues are available at: https://doi.org/10.7910/DVN/DKDIB0 ."  #https://doi.org/10.7910/DVN/DKDIB0.
                                                                  )#https://dataverse.harvard.edu/privateurl.xhtml?token=a437cc9c-b809-4513-bbef-a2333c1c934a
A@d_TTUReports@a_TTUSynopsis@title_1L_chr <- "Mapping psychological distress, depression and anxiety measures to adolescent AQoL-6D utility using data from a sample of young people presenting to primary mental health services"
#A@d_TTUReports@a_TTUSynopsis@tables_in_body_lgl <-  A@d_TTUReports@a_TTUSynopsis@figures_in_body_lgl <- T
#dir.create(paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Markdown/Manuscript_Submission"))
file.copy(list.files(getwd()),paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Markdown/Manuscript_Submission"), recursive = T, overwrite = T)
plt<- specific::make_cmpst_sctr_and_dnst_plt(outp_smry_ls = A@d_TTUReports@a_TTUSynopsis@b_SpecificResults@a_SpecificShareable@shareable_outp_ls,
                                             output_data_dir_1L_chr = output_data_dir_1L_chr,
                                             predr_var_nms_chr = A@d_TTUReports@a_TTUSynopsis@b_SpecificResults@a_SpecificShareable@shareable_outp_ls$predr_vars_nms_ls %>% purrr::pluck(1),
                                             base_size_1L_dbl = 30,
                                             label_x_1L_dbl = 0.2, label_y_1L_dbl = 0.9,
                                             label_size_1L_dbl = 30,
                                             mdl_indcs_int = 1:2, use_png_fls_1L_lgl = T)
write_path_1L_chr <- paste0(output_data_dir_1L_chr, "/dens_and_sctr.png")
# cowplot::save_plot(filename = write_path_1L_chr,
#                    plot = plt,
#                    base_height = 13)
# Manual edit of plot labels required.
authorSlot(A, "d_TTUReports", what_1L_chr = "Manuscript_Submission", consent_1L_chr = "Y", download_tmpl_1L_lgl = F)
file.copy(write_path_1L_chr,paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Reports/Manuscript_Submission/TeX Export/dens_and_sctr.png"), overwrite = T)
file.copy("Data/RefCopy.bib",paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Reports/Manuscript_Submission/TeX Export/RefCopy.bib"), overwrite = T)
file.copy(paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Reports/Manuscript_Submission/Manuscript.tex"),paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Reports/Manuscript_Submission/TeX Export/Manuscript.tex"), overwrite = T)
# Manually remove "../Data/", "../../../Output/" and "../../../Output/_Descriptives/" from Tex File
purrr::reduce(c("\\author*[1,2]{\\fnm{Matthew}", "\\author[2,3,1]{\\fnm{Caroline}"),
              .init = readLines(paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Reports/Manuscript_Submission/TeX Export/Manuscript.tex")) %>%
                stringr::str_replace_all("../../../Output/_Descriptives/", "") %>%
                stringr::str_replace_all("../../../Output/", "") %>%
                stringr::str_replace_all("../Data/", "") %>%
                stringr::str_replace_all("Ref.bib", "RefCopy.bib"),
              ~ {
                tex_chr <- .x
                index_1L_int <- which(startsWith(tex_chr,.y))
                c(tex_chr[1:index_1L_int], "\\equalcont{These authors contributed equally to this work.}", tex_chr[(index_1L_int+1):length(tex_chr)])
              }) %>%
  writeLines(con = paste0(A@d_TTUReports@a_TTUSynopsis@a_Ready4showPaths@outp_data_dir_1L_chr,"/Reports/Manuscript_Submission/TeX Export/Manuscript.tex"))
###
authorReport(renewSlot(A,"d_TTUReports@a_TTUSynopsis@rmd_fl_nms_ls", ready4show::make_rmd_fl_nms_ls(pdf_fl_nm_1L_chr = "TA_PDF")) %>% procureSlot("d_TTUReports@a_TTUSynopsis"),
             consent_1L_chr = "Y", fl_nm_1L_chr = "Supplement", what_1L_chr = "Manuscript_Submission")
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