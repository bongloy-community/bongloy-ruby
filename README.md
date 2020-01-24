# Bongloy Ruby Library

![Build Status](https://github.com/khomsovon/bongloy-ruby/workflows/Build%20Bongloy%20Ruby/badge.svg)

The Bongloy Ruby library provides convenient access to the Bongloy API from
applications written in the Ruby language. It includes a pre-defined set of
classes for API resources that initialize themselves dynamically from API
responses which makes it compatible with a wide range of versions of the Bongloy 
API.

The library also provides other features. For example:

- Easy configuration path for fast setup and use.
- Helpers for pagination.
- Tracking of "fresh" values in API resources so that partial updates can be
  executed.
- Built-in mechanisms for the serialization of parameters according to the
  expectations of Bongloy's API.

## Documentation

See the [API docs](https://sandbox.bongloy.com/documentation).

## Installation

You don't need this source code unless you want to modify the gem. If you just
want to use the package, just run:

```sh
gem install bongloy 
```

If you want to build the gem from source:

```sh
gem build bongloy.gemspec
```

### Requirements

- Ruby 2.3+.

### Bundler

If you are installing via bundler, you should be sure to use the https rubygems
source in your Gemfile, as any gems fetched over http could potentially be
compromised in transit and alter the code of gems fetched securely over https:

```ruby
source 'https://rubygems.org'

gem 'rails'
gem 'bongloy'
```

## Usage

The library needs to be configured with your account's secret key which is
available in your [Bongloy Dashboard](https://sandbox.bongloy.com/dashboard/api_keys). Set `Bongloy.api_key` to its
value:

```ruby
require "bongloy"
Bongloy.api_key = "sk_test_..."

# list charges
Bongloy::Charge.list()

# retrieve single charge
Bongloy::Charge.retrieve(
  "ch_18atAXCdGbJFKhCuBAa4532Z",
)
```
