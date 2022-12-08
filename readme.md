### Netflix Programming Project (in progress, early stage development)

Data Pipeline (ELT) project using the Modern Data Stack to Extract/Load (Airbyte) netflix data into my data warehouse (Snowflake) then transform/model (dbt) that data in order to visualize it in a Dashboard (tbd). 

This project is part of challenging myself to get a fully orchestrated data pipeline up and running; and, to do that fairly quickly while learning as much as I can along the way. The source data originates from tables in a [Netflix Wikipedia Page](https://en.wikipedia.org/wiki/List_of_Netflix_original_programming) that interestingly, update daily. From there, I'm pulling each table from the wikipedia site into Google Sheets using the importhtml() function and then I setup the Google Sheet(s) to refresh daily (using open source airbyte to ingest these into snowflake) - this was a quick and dirty way to get some data flowing, allowing me to focus on the bigger picture of seting up the Data Pipeline (ELT).

**Personal Objective:** expand skills and knowledge w/in the Modern Data Stack (MDS) by setting up an ETL data pipeline that is fully automated and updated with new data daily

**Project Objective:** to build a Dashboard that shows an overview of Netflix historical programs and the ones launching in upcoming days/weeks/months (this way my wife and i can see what’s coming down the pipeline)

<br>

**MDS Tools Used in Project:**
- snowflake (datawarehousing)
- airbyte (data ingestion)
- dbt core (data transformation + data modeling)
- prefect (automated orchestration)
- thoughtspot/looker/tableau (data visualization) - TBD

**Link to Dashboard (refreshed daily):** Coming Soon =)