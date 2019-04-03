rmarkdown::render("01-setup.Rmd", 
                  output_format = "html_document",
                  output_file = "01-setup.html")
rmarkdown::render("01-setup.Rmd", 
                  output_format = "ioslides_presentation", 
                  output_file = "01-setup-slides.html")
rmarkdown::render("resources.md")
