FROM elixir:1.15.7-alpine

WORKDIR /app

RUN apk update && apk upgrade && \
    apk add postgresql-client && \
    apk add build-base && \
    apk add inotify-tools

WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force

COPY mix.exs .
COPY mix.lock .

CMD mix deps.get && mix ecto.setup && mix phx.server
