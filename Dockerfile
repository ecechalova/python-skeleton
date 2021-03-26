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
  pipx install --system-site-packages isort && \
  pipx install --system-site-packages black && \
  pipx install --system-site-packages bandit && \
  pipx install --system-site-packages safety && \
  python -m pip install pip-tools && \
  pip-sync requirements.txt requirements-dev.txt
