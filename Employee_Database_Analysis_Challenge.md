# Pewlett-Hackard-Employee Database Analysis Challenge

## Overview of the Analysis

### Bobby is tasked with doing an analysis of employees at Pewlett Hackard, a large technology company that has been around for years and has thousands of employees including many that are nearing retirement and will need to be replaced.  The purpose of the analysis is to determine which employees are most likely to retire so retirement packages can be offered and to try to predict which positions will need to be filled once they do retire. Specifically Bobby needs to determine the number of retiring employees per title and identify which employees are eligible to participate in a mentorship program.

## Resources

### Pewlett Hackard has provided Bobby with the following csv files:

csv files here

### Other Resources

PostgreSQL 12
pgAdmin 6.12
Quick DBD

## Results

### The Number of Retiring Employees Analysis

Using the six csv files provided by Pewlett Hackard Bobby had to take the tables he created with them, filter on the birth dates in the years 1952 through 1955 and order them by employee number.  Since many employees have multiple titles due to promotions etc.  This file was saved to a csv file titled:

### retirement_titles.csv (1st 10 rows)

here

Bobby then had to remove duplicate rows with older titles so he ended up with only the employees current titles.  Using the data from the retirement_titles.csv file he removed the duplicate titles and excluded any employees that have already left the company. This file was saved to a csv file titled:

### unique_titles.csv (1st 10 rows)

here

Bobby then needed to get a count of retiring employees grouped by titles.  This file was saved to a csv file titled:

### retiring titles.csv

here

### Mentorship Eligibility Analysis

Bobby now needs to continue working with the ERD he created and create a Mentorship Eligibility table that holds the current employees who were born in 1965 with the final result showing employee number, name, birth date, from/to dates and title. This file was saved in a csv files titled:

### mentorship_eligibility.csv (1st 10 rows)

here

### Observations:

### 1) This analysis looked at employees that were at least 67 years old and as old as 70.  What about employees older than 70?  They should consider that there could be a lot of employees in key management positions that need to included in this analysis to adequately prepare for their retirement.

### 2) There are a lot of employees that are at retirement age.  72,458 employees is a lot of experience and jobs to replace.  The most important result of this analysis is that 70% of the employees at retirement age are Senior Engineers and Senior Staff level. There will be a great deal of planning needed to prepare for their departure.

### 3) The mentorship eligibility analysis was targeting only employees born in 1965.  The list returned 1,549 employees that are eligible for the mentorship program.  This is seriously inadequate to even begin to replace the 70% of senior management that are at retirement age.

### 4) This analysis was a good start but needs to be expanded to include employees older then 70 and mentorship for employees born in 1965 through 1975 and possibly even more until there is adequate number of mentorship and enough employees to fill the void of the senior level employees when they retire.

## Summary:

### How many roles will need to be filled as the "silver tsunami" begins to make an impact:

The lower level staff can be hired from outside the company and do not pose an immediate threat when the retirements occur.  Conversely, the 70% of senior level employees (50,842 employees) is huge issue that could have a severe impact on Pewlett Hackard's ability to survive.

### Are there enough qualified, retirement-ready employees to mentor the next generation of Pewlett Hackard employees?

Yes!  There are 70% (50,842 employees) senior level employees that should be surveyed immediately to determine their intentions in regards to retirement.  These senior level employees should be retained via bonuses, packages and other means to begin mentorship training with the target staff.  

### Query 1 : rerun the retiring_employees query and expand the dates to include birth dates from 1945 to 1955 to understand the true number of retiring employees.  There may be a large number of employees that love their jobs so much they are working way past reirement age.

### Query 2: Rerun the Mentorship Eligibility query and expand the date range to include employees born between 1965 and 1975.  Once the result is run compare it to the 50,842 retiring employees to see if there is adequate employees to offset the senior employees retirements.
