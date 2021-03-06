## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)
library(ngstk)

## ------------------------------------------------------------------------
demo_file <- system.file("extdata", "demo/proteinpaint/muts2pp_iseq.txt", package = "ngstk")
input_data <- read.table(demo_file, sep = "\t", header = TRUE, stringsAsFactors = FALSE)
disease <- "T-ALL"
input_data <- data.frame(input_data, disease)
input_data$disease <- as.character(input_data$disease)

# Convert mutations data to proteinpaint input
result <- muts2pp(input_data, input_type = "iseq")
head(result)
# Convert mutations data to cbioportal input
result <- muts2mutation_mapper(input_data, input_type = "iseq")
head(result)
result <- muts2oncoprinter(input_data, input_type = "iseq")
head(result)

demo_file <- system.file('extdata', 'demo/proteinpaint/fusions2pp_fusioncatcher.txt', package = 'ngstk')
input_data <- read.table(demo_file, sep = '\t', header = TRUE, stringsAsFactors = FALSE)
disease <- 'B-ALL'
sampletype <- 'diagnose'
input_data <- data.frame(input_data, disease, sampletype)
input_data$disease <- as.character(input_data$disease)
# Convert fusions data to proteinpaint input
result <- fusions2pp(input_data, input_type = 'fusioncatcher')
head(result)

## ------------------------------------------------------------------------
a <- data.frame(col1=1:6, col2=2:7)
b <- data.frame(col1=6:11, col2=1:6)
file_a <- paste0(tempfile(), '_abcd')
file_b <- paste0(tempfile(), '_abcd')
write.table(a, file_a, sep = '\t', row.names = FALSE)
write.table(b, file_b, sep = '\t', row.names = FALSE)
input_files <- c(file_a, file_b)
x1 <- merge_table_files(input_files = input_files)
head(x1)
x2 <- merge_table_files(files_dir = tempdir(), pattern = '.*_abcd$')
head(x2)
outfn = tempfile()
x3 <- merge_table_files(files_dir = tempdir(), pattern = ".*_abcd$", outfn = outfn)
head(read.table(outfn, sep = "\t", header = TRUE))

## ------------------------------------------------------------------------
demo_file <- system.file("extdata", "demo/proteinpaint/fusions2pp_fusioncatcher.txt", package = "ngstk")
input_data <- read.table(demo_file, sep = "\t", header = TRUE, stringsAsFactors = FALSE)
# Get data subset according the defined rule
mhandler_extra_params = list(gene_5 = 1, gene_3 = 2, any_gene = "TCF3", fusions_any_match_flag = TRUE)
result_1 <- fusions_filter(input_data, mhandler_extra_params = mhandler_extra_params)
head(result_1)

mhandler_extra_params = list(gene_3 = 2, right_gene = "GYPA", fusions_right_match_flag = TRUE)
result_2 <- fusions_filter(input_data, mhandler_extra_params = mhandler_extra_params)
head(result_2)

mhandler_extra_params = list(gene_5 = 1, left_gene = "GYPA", fusions_left_match_flag = TRUE)
result_3 <- fusions_filter(input_data, mhandler_extra_params = mhandler_extra_params)
head(result_3)

mhandler_extra_params = list(gene_5 = 1, gene_3 = 2, left_gene = "GYPE", right_gene = "GYPA", fusions_full_match_flag = TRUE)
result_4 <- fusions_filter(input_data, mhandler_extra_params = mhandler_extra_params)
head(result_4)

mhandler_extra_params = list(gene_5 = 1, gene_3 = 2, left_gene = "GYPE", right_gene = "GYPA", fusions_anyfull_match_flag = TRUE)
result_5 <- fusions_filter(input_data, mhandler_extra_params = mhandler_extra_params)
head(result_5)

## ------------------------------------------------------------------------
file_a <- tempfile()
file_b <- tempfile()
file.create(c(file_a, file_b))
x <- get_files_mtime(input_files = c(file_a, file_b))
x
x <- get_files_mtime(input_files = c(file_a, file_b), return_check = FALSE)
x
x <- get_files_mtime(input_files = c(file_a, file_b), return_mtime = FALSE)
x
x <- get_files_ctime(input_files = c(file_a, file_b))
x
x <- get_files_ctime(input_files = c(file_a, file_b), return_check = FALSE)
x

# time stamp
time_stamp()

## ------------------------------------------------------------------------
x1 <- data.frame(col1 = 1:39, col2 = 1:39)
x1
x <- split_row_data(x1, sections = 2)
x
x <- split_row_data(x1, sections = 3)
x
x1 <- data.frame(col1 = 1:10, col2 = 11:20)
x1.t <- t(x1)
x <- split_col_data(x1.t, sections = 3)
x
# split file
dat <- data.frame(col1 = 1:10000)
outfn <- tempfile()
write.table(dat, outfn, sep = "\t")
split_row_file(outfn)

## ------------------------------------------------------------------------
files_dir <- system.file('extdata', 'demo/format', package = 'ngstk')
pattern <- '*.txt'
list.files(files_dir, pattern)
x <- format_filenames(files_dir = files_dir, pattern = pattern, prefix = 'hg38_')
x

## ------------------------------------------------------------------------
# Collect command line bins files in R package
rbin('ngstk', tempdir())

# Print sub commands
option_list <- list(
  make_option(c('-l', '--list-all-subcmds'), action = 'store_true',
               default = FALSE, help = 'Print all supported subcmds of ngsjs.')
 )
subcmds_list <- list(subcmd1 = 'Use method 1 to plot boxplot',
                      subcmd2 = 'Use method 2 to plot boxplot')
 description <- 'Method to plot boxplot'
 usage <- 'usage: %prog [options] [params]'
 opt_parser_obj <- opt_parser(subcmds_list = subcmds_list,
                             option_list = option_list,
                             description = description,
                             usage = usage)

# Print the command line message
# You can define the message order use
# paramter help_order = c("description", "usage", "options", "subcmds", "epilogue"
print_help(opt_parser_obj)

## ----eval = FALSE--------------------------------------------------------
#  # Use future package to parallel download urls with logs
#  urls <- c(paste0('https://raw.githubusercontent.com/',
#   'Miachol/ftp/master/files/images/bioinstaller/maftools3.png'),
#   paste0('https://raw.githubusercontent.com/',
#   'Miachol/ftp/master/files/images/bioinstaller/maftools4.png'))
#   par_download(urls, sprintf('%s/%s', tempdir(), basename(urls)))

## ------------------------------------------------------------------------
set_colors('default')
set_colors('proteinpaint_mutations')
set_colors('proteinpaint_chromHMM_state')

