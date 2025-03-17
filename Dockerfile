<<<<<<< HEAD
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
=======
FROM python:3.12-slim

WORKDIR /app/OpenManus

RUN apt-get update && apt-get install -y --no-install-recommends git curl \
    && rm -rf /var/lib/apt/lists/* \
    && (command -v uv >/dev/null 2>&1 || pip install --no-cache-dir uv)

COPY . .

RUN uv pip install --system -r requirements.txt

CMD ["bash"]
>>>>>>> 05e41a86ed0279514a32af4d546832857df8f707
