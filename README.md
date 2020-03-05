# Bongloy Ruby Library

![Build Status](https://github.com/khomsovon/bongloy-ruby/workflows/Build%20Bongloy%20Ruby/badge.svg)

This is the Unofficial Ruby library for [Bongloy Payment Gateway](https://www.bongloy.com/).

## Installation

Add this line to your application's Gemfile:

```sh
gem 'bongloy'
```

And then execute:

```sh
$ bundle install
```

Or install it yourself as:

```sh
$ gem install bongloy
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
  "6f3c1e38-d8a9-49c1-86b8-886c2b66eedb",
)
```

## Per-request Configuration

For apps that need to authenticate on behalf of another account during the lifetime of a process, like one that uses [Bongloy Connect](https://sandbox.bongloy.com/documentation#bongloy-connect), it's also possible to set a per-request account:

```ruby
require "bongloy"

Bongloy::Charge.list(
  {},
  {
    api_key: "sk_test_...",
    bongloy_account: "c756a678-0f2b-4b81-a8f1-8bb2ed80ece5"
  }
)

Bongloy::Charge.retrieve(
  "6f3c1e38-d8a9-49c1-86b8-886c2b66eedb",
  {
    api_key: "sk_test_...",
    bongloy_account: "c756a678-0f2b-4b81-a8f1-8bb2ed80ece5"
  }
)
```

## Documentation

See the [API docs](https://sandbox.bongloy.com/documentation).
