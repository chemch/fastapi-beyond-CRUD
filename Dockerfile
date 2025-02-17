FROM python:3.11-slim
# enable verbose logging
RUN set -x && \
    apt-get update && \
    apt-get install -y curl \
# define work dir and copy contents
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN ls -al .
COPY . .
COPY .env.example .env
RUN chmod +r .env
RUN chmod +x runworker.sh
EXPOSE 8000
ENV HOST 0.0.0.0
CMD ["fastapi","run","src","--port","8000","--host","0.0.0.0"]
