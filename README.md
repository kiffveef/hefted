# Hefted

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
    name: :devices,
    ios: 10,
    android: 20,
    pc: 100
  )

  hefted(
    name: :gender,
    members: [:none, :male, :female],
    first: 9
  )
end

Options::Devices.ios
=> 10

Options::Gender
=> #<struct  none=9, male=10, female=11>
```

