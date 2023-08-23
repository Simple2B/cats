FROM python:3.11

# Path: /app
WORKDIR /app

# supress pip warnings
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_NO_CACHE_DIR=1


# install poetry
RUN pip install poetry
#install dependencies
COPY poetry.lock pyproject.toml ./
RUN poetry install --no-dev

# copy project
COPY . .

# install gunicorn
RUN poetry add gunicorn

# expose port
EXPOSE 8000

# run gunicorn
CMD ["poetry", "run", "gunicorn", "-w", "4", "-b", "0.0.0.0", "main:app"]
