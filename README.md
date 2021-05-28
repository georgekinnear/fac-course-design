# Designing and evaluating an online course to support transition to university mathematics
 
> We describe the design and evaluation of an innovative course for beginning undergraduate mathematics students. The course is delivered almost entirely online, making extensive use of computer-aided assessment to provide students with practice problems.
> We outline various ideas from education research that informed the design of the course, and describe how these are put into practice.
> We present quantitative evaluation of the impact on students' subsequent performance (N=1401), as well as qualitative analysis of interviews with a sample of 14 students who took the course.
> We find evidence that the course has helped to reduce an attainment gap among incoming students, and suggest that the design ideas could be applied more widely to other courses.

## Analysis code

### [00-data-import.R](00-data-import.R)

This script is used to gather and anonymise data from a separate directory (not included in this respository).

It writes the anonymised data to the [`data-ANON`](data-ANON/) folder.

### [01-data-prep.Rmd](01-data-prep.Rmd) ([output](01-data-prep.md))

This script:

- reads in the anonymised data files
- presents summary statistics (including Table 3 and the histogram from the appendix of the paper)
- assembles the results data into [`ANON_student-data.csv`](data-ANON/ANON_student-data.csv) ready for further analysis. In this data file, each row contains data from a single student, with columns:
  * `cohort` = academic year in which the student took the Year 1 course(s)
  * `anon_id` = a randomly-generated string uniquely identifying each student
  * `Pre` and `Post` = score out of 100 on the MDT, at the start of Semester 1 and Semester 2 respectively
  * `ILA` / `CAP` / `FAC` = score out of 100 giving the final grade in each course
  * `took_FAC` = either "FAC" or "No FAC" according to whether the student took FAC

### [02-fac-effect-analysis.Rmd](02-fac-effect-analysis.Rmd) ([output](02-fac-effect-analysis.md))

This script carries out the main (Bayesian) statistical analyses, and generates the other figures and tables that appear in the paper.

It relies on the [R_rainclouds.R](R_rainclouds.R) script from https://github.com/RainCloudPlots/RainCloudPlots/blob/master/tutorial_R/R_rainclouds.R to produce the raincloud plots near the start.