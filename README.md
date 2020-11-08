# Backend Engineer Coding Test
## [Read more](CODING_TEST.md)

## Requirements:
 - ruby: `2.7.0`
 - node: `12.0.0`

## Run local:
 - `bundle install`
 - `yarn install`
 - `rails s`
 - `open http://localhost:3000`

## Docker run:
 - `docker build .`
 - `docker run -p 3000:80 ${IMAGE_ID}`
 - `open http://localhost:3000`

## Tests:
 - `RAILS_ENV=test bundle exec rails webpacker:compile`
 - `bundle exec rspec`
