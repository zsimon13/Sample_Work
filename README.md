# App Analysis
## Overview
In this project I analyzed data from the Apple App store to determine what apps held the highest rating, and what factors may have played into these ratings.

Some EDA was initially performed to ensure there was no missing values and that the data from the CSV files would be able to join together for the analysis performed.

## Techincal SQL skills used in this poroject
- Importing CSV file
- Joining multiple tables through UNION ALL fuction
- JOIN Function
- CASE Statements
- Creating Buckets
- Window Funcitons
- SubQuery

## Process And Takeaways
1. Initially apps were grouped by paid and free apps to determine if there was any difference in app ratings.
   1.1 Paid apps had slightly better rating than free apps.
   
2. I then looked into whether apps that supported more languages had higher rating than apps which only supported a few languages. These apps put into 3 buckets:
  - Less than 10 languages
  - Between 10 and 30 Languages
  - More than 30 languages
    2.1 Apps between 10 and 30 languages held the best ratings among the 3 groups.

3. Following that I looked at which app generes typically had the lowest ratings.
  3.1 Finance and Book generes scores the lowest overall average ratings.

4. I then looked at how the length of the app description and how the apps rating where correlated. These were put into 3 buckets:
  - Less than 500 characters.
  - Between 500 and 1000 characters
  - More than 1000 characters
    4.1 Apps with longer descriptions had the higher average rating

5. What the average ratng was for an app overall.
  5.1 Average app rating were about 3.5.

6. What apps were highest ranked.
   6.1 Games and entertainment apps had the most apps with a high ranking. This suggests the app store is oversaturated with apps of this genere.

## Importance
These take aways can be used for app developers and business development for direction on how to position apps that they would like to launch. These findings are broad enough to undergo further analysis for a more targeted audience, or take a calculated risk with out limiting options to an extremely niche audience. 

### Disclaimer
This Project will further be anllysed with statistical test such as a/b testing to determine if the difference in ratings wasw statistically significant, and will be updated when completed.

#### Additonal Personal Projects
Please feel free to take a look at a Tableau dashboard I created comparing school funding and expenditure data to school test scores by state.
https://public.tableau.com/app/profile/zach1542/viz/SchoolFundingExpenditures/Dashboard1?publish=yes
