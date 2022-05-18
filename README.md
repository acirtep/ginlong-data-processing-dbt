# ginlog_data_processing_dbt
Repository which containts the dbt setup for Ginlong solar pannels data processing

1. Python version == 3.7.9 `pyenv local 3.7.9`
2. Create virtual env `python -m venv venv_dbt`
3. Activate venv `source venv_dbt/bin/activate`
4. Install requirements `pip install -r requirements.txt`
5. Configure the env variables from env/example_env_vars.env
6. Build docker service `docker-compose build`
7. Run docker service `docker-compose up`