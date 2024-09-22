# Data Warehousing Project

This project is part of my Data Engineering Course, focusing on Data Warehousing concepts and implementation.

## Tools and Resources

In this project, I utilized several tools and resources provided by my mentor, [Salbifaza](https://github.com/salbifaza/), especially the `dbtools` which have been integral to building and managing the data warehouse structure.

## Acknowledgments

Special thanks to my mentor, [Salbifaza](https://github.com/salbifaza/), for providing guidance throughout the project and for sharing the invaluable `dbtools` that helped streamline the development process.


# DBT Playground for teaching


## Prerequisites
- Docker 
- Google BigQuery credentials

## Setup and Installation
### Clone the Repository
```
# Clone the repo
git clone https://github.com/salbifaza/dbt_playground.git

cd dbt_playground

# Creating creds folder for credentials
mkdir creds
```
### BigQuery Setup
1. Enable BigQuery API 
2. Create your BQ Service Account: [references](https://docs.openbridge.com/en/articles/1856793-how-to-set-up-google-bigquery-creating-and-configuring-service-accounts-in-google-cloud-console) 
3. Create your Dataset
4. Create BigQuery Table using upload files method with data from data/Amazon Sale Report.csv 

### Environment Variables
Create a `.env` file in the root directory and set the following environment variables:
```
BIGQUERY_PROJECT={Your BigQuery Project}
BIGQUERY_DATASET={Your BigQuery Dataset}
```

### Project Structure
After cloning this repository & create `.env`, ensure that your project structure looks like this:

Make sure to place your BigQuery credential file in the `creds` directory with the appropriate name.
```
.
├── Dockerfile
├── README.md
├── data
│   └── Amazon Sale Report.csv
├── dbt
│   ├── analyses
│   ├── creds
│   │   └── service_account.json
│   ├── dbt_packages
│   ├── logs
│   ├── macros
│   ├── models
│   │   ├── example
│   │   │   ├── my_first_dbt_model.sql
│   │   │   ├── my_second_dbt_model.sql
│   │   │   └── schema.yml
│   │   └── sources.yml
│   ├── seeds
│   ├── snapshots
│   ├── target
│   ├── tests
│   ├── dbt_project.yml
│   ├── packages.yml
│   └── profiles.yml
└── docker-compose.yaml
```

### Docker Setup
build & run docker compose 
```
docker compose up --build
```

### Usage
Run debug dbt
```
docker compose run --rm dbt-run debug
```

Run dbt model:
```
docker compose run --rm dbt-run run
```
