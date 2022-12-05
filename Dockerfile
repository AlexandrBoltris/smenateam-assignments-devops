FROM python:3.9.15-slim AS poetry

RUN pip install --no-cache-dir poetry
ENV PATH="/root/.local/bin:$PATH"


FROM poetry

RUN useradd --no-create-home --no-user-group worker

WORKDIR /app

COPY poetry.lock poetry.toml pyproject.toml ./
RUN poetry install

COPY gunicorn.sh ./
COPY main.py ./
COPY app ./app/

USER worker
EXPOSE 8000
CMD [ "poetry", "run", "./gunicorn.sh" ]

