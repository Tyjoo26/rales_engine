# README
[![CircleCI](https://circleci.com/gh/Maxscores/rales_engine.svg?style=shield)](https://circleci.com/gh/Maxscores/rales_engine)

Welcome to Rails Engine! This is a project for Turing Backend Mod 3 class where we build an internal sales engine API using ruby on rails: [docs here](http://backend.turing.io/module3/projects/rails_engine#technical-expectations)

It was built by [Tim Joo](https://github.com/Tyjoo26) & [Max Stackhouse](https://github.com/Maxscores)

Feel free to clone down the repo.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Setup](#setup)
  - [Spec Harness](#spec-harness)
  - [Local Setup](#local-setup)
- [Schema](#schema)
- [Endpoints](#endpoints)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Setup
You'll need [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [bundler](http://bundler.io/).
### Spec Harness
Initial setup must be done prior to running the [spec harness](https://github.com/Maxscores/rales_engine_spec_harness).
Run these commands in terminal:
```
git clone https://github.com/Maxscores/rales_engine_spec_harness.git
cd rales_engine_spec_harness
bundle
export BASE_URL=http://rales-engine-1710.herokuapp.com
```
Run the tests with `bundle exec rake`

### Local Setup
```
git clone https://github.com/Tyjoo26/rales_engine.git
bundle
rails db:create db:migrate
rails db:test:prepare
rails import_csv:load
```

To run our test suite: `rspec`


## Schema
![schema](https://i.imgur.com/tUoPi6L.png)

## Endpoints
We recommend visiting [Rales Engine](http://rales-engine-1710.herokuapp.com/) through herokuapp to get information about the endpoints. You should direct your API requests to http://rales-engine-1710.herokuapp.com/api/v1/:endpoint
