FROM python:3.11-slim

# enable verbose logging
RUN set -x && apt-get update && apt-get install -y curl

# define work dir and copy contents
WORKDIR /app

# move everything in working director
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# debugging - check what is in the working folder
RUN echo "Check 1: Requirements Dropped"
RUN ls -al .

# copy everything into working directory
COPY . .
RUN echo "Check 2: All Other Files Dropped"
RUN ls -al .

RUN echo "Check 3: Environment File is Healthy"
RUN cat .env

# entitle required files
RUN chmod +x runworker.sh

# Set the environment variable for the database URL. This can be overwritten by Docker Compose.
ENV DATABASE_URL="postgresql+asyncpg://chemch:password@db:5432/testDb"

# Run the alembic upgrade command
CMD ["alembic", "upgrade", "head"]

# start up
EXPOSE 8000
ENV HOST 0.0.0.0
CMD ["fastapi","run","src","--port","8000","--host","0.0.0.0"]
