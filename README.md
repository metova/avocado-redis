# Avocado Redis

This gem provides a Redis storage adapter for [Avocado](https://github.com/metova/avocado).

## Installation

```ruby
gem 'avocado-redis'
bundle
```

## Usage

In your Avocado config:

```ruby
Avocado.configure do |config|
  config.storage = Avocado::Redis::Strategy.new 'redis-url-here'
end
```

By default, `ENV['REDIS_URL']` will be used.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/metova/avocado-redis.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
