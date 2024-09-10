# dbt_playground

Create your .env Files

```
BIGQUERY_PROJECT={Your BigQuery Project}
BIGQUERY_DATASET={Your BigQuery Dataset}
```


debug dbt
`docker compose run --rm dbt-run debug`

run dbt model
`docker compose run --rm dbt-run run`

build & run docker compose 
`docker compose up --build`