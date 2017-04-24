# Hefted

[![Build Status](https://travis-ci.org/weathare/hefted.svg?branch=master)](https://travis-ci.org/weathare/hefted)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hefted'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hefted

## Usage

```ruby
class Options
  include Hefted

  hefted(
    name: :generation,
    young: 10,
    middle: 30,
    old: 50
  )

  hefted(
    name: :gender,
    members: [:none, :male, :female],
    first: 9
  )

  hefted(
    name: :personal,
    join: [:generation, :gender],
  )
end

Options::Generation.middle
=> 30

Options::Gender
=> #<struct  none=9, male=10, female=11>

Options::Personal.young
=> 10

Options::Personal.female
=> 11
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
