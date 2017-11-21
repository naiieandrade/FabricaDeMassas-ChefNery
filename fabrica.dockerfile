# Imagem base do docker
FROM ruby:2.3.3

# Responsáveis pela criação da Imagem
MAINTAINER Matheus Figueiredo <ultra10vascaino@gmail.com0> e Naiara Camelo <andradenaiara@hotmail.com>

# Indica o lugar onde os comandos serão rodados dentro do container
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copia os arquivos Gemfile para a pasta atual do container
COPY Gemfile /usr/src/app
COPY Gemfile.lock /usr/src/app/
RUN bundle install
COPY . /usr/src/app

# Atualiza o container
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Expõe a porta 3000 e roda o projeto
EXPOSE 3000
CMD rake db:migrate
CMD ["rails", "server", "-b", "0.0.0.0"]