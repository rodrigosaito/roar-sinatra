# Roar::Sinatra

Sinatra integration with roar

## Installation

Add this line to your application's Gemfile:

    gem 'roar-sinatra'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roar-sinatra

## Usage

In your sinatra route just call roar method passing the object that will be serialized:

```ruby
get "/orders/:id"
  roar Order.find(params[:id])
end
```

The result will be a serialized Order using OrderRepresenter class to serialize the Order object with roar.
You can alo use a custom representer class:

```ruby
get "/orders/:id"
  roar Order.find(params[:id]), :representer_class => CustomOrderRepresenter
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
