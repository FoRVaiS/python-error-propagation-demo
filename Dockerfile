FROM python:3.10.6-slim as python
FROM ubuntu:focal-20220404 as base
RUN apt-get update -y \
    && apt-get upgrade -y -qq --no-install-recommends \
    libpython3-dev

COPY --from=python /usr/local/include/ /usr/local/include/
COPY --from=python /usr/local/lib/ /usr/local/lib/
COPY --from=python /usr/local/bin/ /usr/local/bin/
RUN ldconfig /usr/local/lib

WORKDIR /app

FROM base as dev
RUN apt-get update -y \
    && apt-get upgrade -y -qq --no-install-recommends \
    git
RUN git config --global --add safe.directory /app \
    && python -m pip install autopep8

FROM base as source
COPY --chown=python . .

FROM source as prod
CMD ["python", "main.py"]
