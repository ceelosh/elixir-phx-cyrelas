FROM elixir:1.12-alpine as base

# init
RUN apk add --update --no-cache \
  bash \
  curl \
  git \
  nodejs \
  npm \
  build-base \
  tzdata

RUN mix local.hex --force && \
  mix local.rebar --force && \
  mkdir -p /app

COPY . /app

# get and compile elixir deps
RUN cd /app && mix deps.get 
RUN cd /app && mix compile

WORKDIR /app

EXPOSE 4000

CMD ["sh", "-c", "mix phx.server"]
