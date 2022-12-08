### Netflix Programming Project (in progress)

Data Pipeline (ELT) project using the Modern Data Stack to Extract/Load (Airbyte) netflix data into my data warehouse (Snowflake) then transform (dbt) and model that data in order to visualize it in a Dashboard (tbd). 

The source data originates from tables in a [Netflix Wikipedia Page](https://en.wikipedia.org/wiki/List_of_Netflix_original_programming) that interestingly, updates daily. From there, I'm pulling each table from the wikipedia site into Google Sheets using the importhtml() function and having them refresh daily. I'm using Airbyte to ingest the raw data into snowflake where it is then staged, transformed, and modeled using dbt.

**Project Objective:** Setup a fully automated data pipeline with reporting tables that drive my Dashboard containing an overview of Netflix historical programs and the ones launching in upcoming days/weeks/months (this way my wife and i can see what’s coming down the pipeline)

<br>

**MDS Tools Used in Project:**
- snowflake (datawarehousing)
- airbyte (data ingestion)
- dbt core (data transformation + data modeling)
- prefect (automated orchestration)
- thoughtspot/looker/tableau (data visualization) - TBD

**Link to Dashboard (refreshed daily):** Coming Soon =)