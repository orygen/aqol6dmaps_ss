## aqol6dmap_ss: Create the Scientific Manuscript For An AQoL-6D Utility Mapping Study
This R Markdown subroutine program creates a scientific manuscript that summarises a utility mapping study. This subroutine is a study specific customisation of a utility mapping template manuscript authoring program available at https://doi.org/10.5281/zenodo.5976987.

In order for this program to execute properly it must be supplied with a results summary object. The best way to do this is to call this program via the commands outlined in the Complete Study Program. The complete study program is available in the https://github.com/orygen/aqol6dmap_csp repository. A slightly more generalised version of that program is summarised in the CSP.pdf file available from: https://doi.org/10.7910/DVN/DKDIB0

### Additional steps
This current version of this program uses a template which will produce PDFs with figures and tables that render on top of each other. To fix this issue some additional code needs to be run.

First, from your R console change your working directory to where the "Parent_PDF" directory is located on your local machine. Note you will have to replace "PATH_TO_SUBROUTINE" with the path to wherever you have downloaded this subroutine's parent directory ("aqol6dmap_ss"") to.

```r
setwd("PATH_TO_SUBROUTINE/Real/Markdown/Manuscript_Submission/Parent_PDF") # aqol6dmap_ss
```

Next, run the following commands in your R console to copy both the bibliography and LaTeX template to the "Parent_PDF" directory and to modify the parts of the template relating to tables and figures.

```r
file.copy("../Data/submissionRefs.bib","RefCopy.bib", overwrite = T)
ready4::write_from_tmp("../../../Reports/Manuscript_Submission/Manuscript.tex",
                       dest_paths_chr = "Manuscript.tex",
                       edit_fn_ls = list(function(txt_chr,
                                                  package_1L_chr){
                         txt_chr <- purrr::map_chr(txt_chr,
                                                   ~
                                                     stringi::stri_replace_all_regex(.x,
                                                                              "\\{table\\}",
                                                                              "\\{table*\\}")
                                                   ) %>%
                           purrr::map_chr(~ stringi::stri_replace_all_regex(.x,
                                                           "\\{figure\\}",
                                                           "\\{figure*\\}"))
                         # \counterwithin{figure*}{section}
                         # \counterwithin{table*}{section}
                         txt_chr
                       })
)

```

Now in a terminal session (ideally from the Terminal pane in RStudio) you need to update the bibliography cache.
```
biber Manusript
```

You can now open the  Manuscript.tex file in RStudio and click on the "Compile PDF button". That will generate a Manuscript with the figures and tables issue fixed.

To copy the rendered PDF to the reports directory run the following command in your R console.

```r
file.copy("Manuscript.pdf","../../../Reports/Manuscript_Submission/Manuscript.pdf", overwrite = T)
```

For more general information about the framework used to develop this subroutine visit www.ready4-dev.com