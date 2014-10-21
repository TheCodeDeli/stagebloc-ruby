# StageBloc - Ruby API Wrapper

The StageBloc gem is an API wrapper to push/receive data for an
authenticated user.

[![Build Status](https://travis-ci.org/TheCodeDeli/stagebloc-ruby.svg?branch=master)](https://travis-ci.org/TheCodeDeli/stagebloc-ruby) [![Coverage Status](https://img.shields.io/coveralls/TheCodeDeli/stagebloc-ruby.svg)](https://coveralls.io/r/TheCodeDeli/stagebloc-ruby?branch=master)

For authentication via OAuth check out our [OmniAuth Strategy for
Stagebloc][omniauth-stagebloc].

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stagebloc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stagebloc

## Configure

Before using this wrapper you'll need to add your `client id` and
`client secret` from Stagebloc. You can learn how to obtain these in this
document. <https://stagebloc.com/developers/api/v1/general-information>

```ruby
StageBloc.configure do |c|
  c.client_id = ENV.fetch('STAGEBLOC_CLIENT_ID')
  c.client_secret = ENV.fetch('STAGEBLOC_CLIENT_SECRET')
end
```

## Usage

The StageBloc wrapper is designed to work like ActiveRecord.

```ruby
user = StageBloc::User.find(123)
user.name #=> "Test User"
```

The following endpoints have been created.

- [Users#find][find_user]

## Todo

- [ ] replace custom REST adapter with ActiveResource

## Contributing

1. Fork it ( https://github.com/TheCodeDeli/stagebloc-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[omniauth-stagebloc]: https://github.com/TheCodeDeli/omniauth-stagebloc
[find_user]: http://www.thecodedeli.com/stagebloc-ruby/classes/StageBloc/User.html
