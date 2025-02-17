# CS686 - Assignment 7 - Conventional Commits - Chemch - Chase Chemero

# How to Run with Docker:
- Check Out Repo:
  - RUN: git clone https://github.com/jod35/fastapi-beyond-CRUD.git
- Change Directory
  - RUN: cd fastapi-beyond-CRUD
- Run App (You don't need to copy .env if you want to use default configs)
  - RUN: docker compose up
- Test API via your Favorite Browswer
  - BROWSE TO: http://localhost:8000/api/v1/books/test
    - You should get 'API Running!' in response


## List of Updates Required to Get Docker Working:
- Updated README
- Added Conventional Commit Checker 
- Add Step to Auto Close Failures for previous Conventional Check 
- Added Step to Email User That Non-Conventional Check Failed
- Part 1: Invalid Msg - Auto Close - Complete
- Add debug commit type as acceptable 
- Define initial version of python build script
- Adjusted time to be UTC to test timing of auto build 
- Populate .env directly to avoid needing to copy it (just makes it simpler)
- Make Postgre connection Async
- Update username and password for Postgre to match Compose.yml
- Add Verbose logging into DockerFile to help with debugging
- Adding DB URL into Dockerfile so Alembic DB priming works
- Allow commiting of .env file (.gitignore update)
- Add test endpoint to make it easy to test that the application runs healthy
- Update env.py b/c it overrides Alembic.ini on startup
- Part 2 - Auto Build and Upload to Docker WORKING App
- Create Video to show how it all works

# Video Walkthrough
- Valid Commit Message - Doesn't Auto Close - Complete
- Invalid Commit Message - Auto Close and Email - 
- Daily Build - Uploads to Built Image to Docker
- Docker Compose - Show App Works

---
# OLD README NOTES (FOR REF)
# FastAPI Beyond CRUD Table of Contents

1. [Getting Started](#getting-started)
2. [Prerequisites](#prerequisites)
3. [Project Setup](#project-setup)
4. [Running the Application](#running-the-application)
5. [Running Tests](#running-tests)
6. [Contributing](#contributing)

## Getting Started
Follow the instructions below to set up and run your FastAPI project.

### Prerequisites
Ensure you have the following installed:

- Python >= 3.10
- PostgreSQL
- Redis

### Project Setup
1. Clone the project repository:
    ```bash
    git clone https://github.com/jod35/fastapi-beyond-CRUD.git
    ```
   
2. Navigate to the project directory:
    ```bash
    cd fastapi-beyond-CRUD/
    ```

3. Create and activate a virtual environment:
    ```bash
    python3 -m venv env
    source env/bin/activate
    ```

4. Install the required dependencies:
    ```bash
    pip install -r requirements.txt
    ```

5. Set up environment variables by copying the example configuration:
    ```bash
    cp .env.example .env
    ```

6. Run database migrations to initialize the database schema:
    ```bash
    alembic upgrade head
    ```

7. Open a new terminal and ensure your virtual environment is active. Start the Celery worker (Linux/Unix shell):
    ```bash
    sh runworker.sh
    ```

## Running the Application
Start the application:

```bash
fastapi dev src/
```
Alternatively, you can run the application using Docker:
```bash
docker compose up -d
```
## Running Tests
Run the tests using this command
```bash
pytest
```
