# OD-OT

[![CI](https://github.com/k1r8r0wn/od-ot/actions/workflows/ci.yml/badge.svg?branch=master&event=push)](https://github.com/k1r8r0wn/od-ot/actions/workflows/ci.yml)
[![Issue Count](https://codeclimate.com/github/k1r8r0wn/od-ot/badges/issue_count.svg)](https://codeclimate.com/github/k1r8r0wn/od-ot)
[![Maintainability](https://api.codeclimate.com/v1/badges/7ee164a00df359ca7c84/maintainability)](https://codeclimate.com/github/k1r8r0wn/od-ot/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/7ee164a00df359ca7c84/test_coverage)](https://codeclimate.com/github/k1r8r0wn/od-ot/test_coverage)

## About

Simple to-do rails application using Test-Driven Development with RSpec and Capybara. You can find out the working version [here](https://od-ot.herokuapp.com).

## Getting started

1. Create `config/database.yml`(it stores the db configs) file:

  ```bash
  cp config/database.yml.example config/database.yml
  ```

2. Create `docker-compose.override.yml` file with docker preferences for development environment:

  ```bash
  cp docker-compose.override.yml docker-compose.development.yml
  ```

3. Create `.env` file to store all env. variables:

  ```bash
  cp .env.example .env
  ```

4. Install [docker](https://docs.docker.com/engine/installation/) & [docker-compose](https://docs.docker.com/compose/install/) if you haven't got them yet and then build the project by running:

  ```bash
  docker-compose build
  ```

5. Run the project:

  ```bash
  docker-compose up
  docker-compose up -d # Without logs
  ```

6. Create development & test PostgreSQL db's & run migrations inside docker's `web` container:

  ```bash
  docker-compose exec web rails db:create && docker-compose exec web rails db:migrate
  ```

Great, now you can find the `Od-ot` app on `localhost:3000`.

## Contributing

1. Fork this repository;
2. Clone the project;
3. Bug reports and pull requests(PR) are welcome on GitHub at [https://github.com/k1r8r0wn/od-ot](https://github.com/k1r8r0wn/od-ot). Just create new branch & add PR to this origin repository.

## License

The application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
