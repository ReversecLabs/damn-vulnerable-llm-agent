FROM python:3.9-slim-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN python -m pip install --no-cache-dir python-dotenv
RUN python -m pip install --no-cache-dir -r requirements.txt

RUN mkdir -p /root/.streamlit
COPY config.toml /root/.streamlit/config.toml

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health || exit 1

ENTRYPOINT ["streamlit", "run", "main.py", "--server.port=8501", "--server.address=0.0.0.0"]
