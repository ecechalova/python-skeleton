FROM python:3.9-slim as development

WORKDIR /usr/src/app

ENV \
  PYTHONUNBUFFERED=1 \
  PATH=${PATH}:/root/.local/bin

COPY \
   requirements.txt requirements-dev.txt ./

RUN \
  python -m pip install --upgrade pip && \
  python -m pip install --user pipx && \
  pipx install isort && \
  pipx install black && \
  pipx install bandit && \
  pipx install safety && \
  python -m pip install pip-tools && \
  pip-sync requirements.txt requirements-dev.txt
