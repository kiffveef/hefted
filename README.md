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
TODO: Write usage instructions here

```ruby
class Options
  include Hefted

  hefted(
    name: :devices,
    ios: 10,
    android: 20,
    pc: 100
  )
end

Options::Devices.ios
=> 10
```

