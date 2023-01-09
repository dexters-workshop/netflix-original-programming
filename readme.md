### Netflix Original Programming (in progress)

Data Pipeline (ELT) project using the Modern Data Stack (MDS) to Extract/Load (Airbyte) netflix data into my data warehouse (Snowflake) then transform (dbt) and model that data in order to visualize it in a Dashboard (tbd). 

**Data Overview:** The source data originates from tables in a [Netflix Wikipedia Page](https://en.wikipedia.org/wiki/List_of_Netflix_original_programming) that interestingly, updates daily. From there, I'm pulling each table from the wikipedia site into Google Sheets using the importhtml() function and having them refresh daily. I'm using Airbyte to ingest the raw data into snowflake where it is then transformed, modeled, and tested using dbt. 

**FYI:** The project focus is on gaining experience setting up a fully orchestrated data pipeline while learning the fundamentals of dbt; and so the scope of the project/data was intentionally kept minimal to help facilitate learning the fundamentals 😎

**Project Objective:** Setup a fully automated data pipeline with reporting tables that drive my Dashboard containing an overview of current Netflix original programs and the ones launching in upcoming days/weeks/months (this way my wife and i can see what’s coming down the pipeline)

**MDS Tools Used in Project:**
- Snowflake (datawarehousing)
- Airbyte (data ingestion)
- dbt Core (data transformation + data modeling)
- Prefect (automated orchestration)
- Looker (data visualization)

**Project Dag (in progress):**
![dag](images/dag.png)