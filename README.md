# NETSHOW.ME TEST

## Tecnologias
* [Ruby on Rails]
* [JavaScript]
* [PostgreSQL]
* [Docker]
* [Docker-Compose]
* [TDD]

## Rodar o projeto

Para rodar o projeto é necessário ter o docker e docker compose instalados.

- Faça o clone do projeto: https://github.com/denispolicarpocampos/video_plataform.git
- Na pasta do projeto rode:

  1. docker-compose build
  2. docker-compose run --rm app bundle install
  2. docker-compose run --rm app bundle exec rake db:create db:migrate
  3. docker-compose up