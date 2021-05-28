library(tidyverse)

# This script pulls in relevant data from the "data" folder in the level above

# Copy diagnostic test results into place
diagtest_files <- fs::dir_ls(path = "../data/data-ANON", regexp = ".*diagtest.*")
file.copy(diagtest_files, str_replace(diagtest_files, "../data/", ""))


# Trim the excess data from course results - it should only include the relevant courses
results_all <-
  read_csv("../data/data-ANON/ANON_all_course_results.csv") %>%
  janitor::clean_names() %>%
  select(anon_id, course_year, course_code, course_name, assessment_mark)

results_to_use <- results_all %>% 
  filter(course_code %in% c("MATH07003", "MATH08057", "MATH08058"))

results_to_use %>% 
  write_csv("data-ANON/ANON_all_course_results.csv")


# Also cut out unused info from demographics

raw_demographics <-
  read_csv("../data/data-ANON/ANON_demographics.csv")

raw_demographics %>% 
  select(AnonID, course_year_code, course_mode_of_study, course_code_title) %>% 
  write_csv("data-ANON/ANON_demographics.csv")
