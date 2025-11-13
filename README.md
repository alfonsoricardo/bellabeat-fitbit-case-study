📊 Bellabeat Case Study — Google Data Analytics Capstone


How Can a Wellness Technology Company Play It Smart?


By Ricardo Montañez

📁 Project Overview


This project is part of the Google Data Analytics Professional Certificate Capstone.

The objective is to analyze Fitbit user activity and sleep data to uncover trends that can help Bellabeat, a wellness technology company, improve user engagement and product strategy.



This analysis uses real dataset patterns to generate insights, user personas, behavioral trends, and actionable recommendations for Bellabeat’s app and product ecosystem.

🎯 Business Task


Bellabeat wants to better understand how consumers use smart devices to track fitness behaviors.

The goal is to:

Identify activity, sleep, and intensity patterns

Understand daily and weekly rhythms in user behavior

Segment users based on movement habits

Provide data-driven recommendations the company can use to grow engagement

📂 Dataset


The dataset used comes from Fitbit fitness trackers made available through Kaggle:

👉 “FitBit Fitness Tracker Data” (30 eligible users)

https://www.kaggle.com/datasets/arashnic/fitbit



Files Used in This Analysis

dailyActivity_merged.csv

Daily steps, distance, intensity, calories

sleepDay_merged.csv

Sleep duration and time in bed

These two datasets provide all necessary metrics for activity and sleep behavior.

🛠️ Tools Used

RStudio

R tidyverse (dplyr, ggplot2, lubridate)

DuckDB for lightweight queries

PowerPoint / Google Slides for presentation

GitHub for version control

📁 Repository Structure
bellabeat-fitbit-case-study/
│
├── 00_data_raw/ # Original Kaggle CSVs
├── 01_data_clean/ # Cleaned & merged datasets
├── 02_scripts/ # Modular R scripts
│ ├── 00_setup.R
│ ├── 01_prepare.R
│ ├── 02_process.R
│ ├── 03_analyze.R
├── 03_outputs/
│ ├── charts/ # PNG charts exported from analysis
│ └── tables/ # Summary CSVs
├── Presentation/ # Final PPTX (Bellabeat-branded)
└── README.md # Project documentation

🔍 Key Findings


1. Users Are Moderately Active but Highly Sedentary
Most daily step counts fall below 10,000

Large cluster of days under 5,000 steps

Sedentary minutes often range 800–1,300+ minutes/day (13–21 hours)

Light activity dominates movement, with very little vigorous activity



2. Weekly Behavior Rhythms Are Clear
Wednesday is the most active day of the week (~7,500+ steps)

Tuesday shows the lowest activity (~4,900 steps)

Sunday also dips (~6,000 steps)

Movement patterns follow strong weekday routines



3. Sleep Tracking Is Underutilized
Only a subset of users tracked sleep

Those who did averaged 5.5–12.5 hours

Sleep efficiency was high (94–97%)



4. User Segments Emerge Clearly
High Activity Users: 9,000–11,600 steps/day

Moderate Movers: 4,000–8,000 steps/day

Sedentary Users: 2,000–4,000 steps/day

💡 Recommendations for Bellabeat


1. Micro-Movement Nudges
Push 1-minute “movement bursts” to offset extreme sedentary time



2. Weekly Rhythms Coaching
Create challenges targeting low-activity days: Tuesday & Sunday

Reinforce high-activity momentum on Wednesday & Saturday



3. Sleep Engagement Campaign
Gamify sleep tracking with streaks, badges, and guided routines



4. Segment-Based Customization
Tailor goals and content based on movement categories



5. Positive Reinforcement Loops
Celebrate small wins (weekly consistency, improved streaks, etc.)

📊 Visuals Included


The analysis generated three core visualizations:

Distribution of Daily Steps

Daily Intensity Minutes Boxplot

Average Steps by Weekday

https://docs.google.com/presentation/d/1MzxOiy-JhSNClZ1pLQfjlHCX3ub4156j/edit?usp=sharing&ouid=111255781134292666030&rtpof=true&sd=true

These are embedded in the presentation and stored under /03_outputs/charts/.


✔️ Conclusion


The analysis highlights key opportunities for Bellabeat to drive user engagement through habit-building, targeted nudges, personalized coaching, and improved sleep tracking adoption.

This case study demonstrates the full data analytics lifecycle, from cleaning to insights to presentation.

