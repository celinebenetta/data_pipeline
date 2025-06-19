This repo pertains to local exploration on data pipeline using dbt with BigQuery datawarehouse, future improvment to this project would be:
- data orchestration, e.g., with Apache Airflow
- containerization, e.g., with Docker

### Starting Out

High level information:
- install dbt-core using virtual environment if needed.
- run `dbt init` and provide relevant database credential, typically basic information on data warehouse. In BigQuery, this pertains to project and database name, as well as processing location
- define and install necessary package or library from `requirements.txt` or `packages.yml`

Folders set up:
usually the following folders are genenrated automatically upon `dbt init`
- models:
    Generally, best practice for models in dbt requires staging and mart folders
    - staging: basic SQL transformations such as cleaning up formatting or column naming, generally materialize as view
    - mart: complex SQL transformations, end result table such as fact or dim, generally materialize as tables
- macros: store your reusable functions to implement DRY principal
- seeds: store static or rarely change files such as csv
- snapshots: store table changes in data warehouse, useful if tables from original database is overwritten

A few useful dbt commands:
- `dbt run`: compile model(s) and any prerequisites from macros, seeds, tests, etc.
- `dbt test`: run test case on model(s) in any defined generic yml file or in tests folder

### Resources on dbt:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
