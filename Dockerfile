#base image 
FROM python:3.12

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/OpenManus

WORKDIR /app/OpenManus

RUN python -m venv my_open_manus_venv && \
    ./my_open_manus_venv/bin/pip install --no-cache-dir -r requirements.txt

RUN chmod +x start.sh

EXPOSE 5172

CMD ["/bin/bash", "-c", "./start.sh"]
