# Roar::Sinatra

Sinatra integration with https://github.com/apotonick/roar

## Installation

Add this line to your application's Gemfile:

    gem 'roar-sinatra'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roar-sinatra

## Usage

Roar::Sinatra adds a represent helper method to serialize objects using roar.

Roar::Sinatra assumes the name of your representer is class_name + "Representer".

### Classic Application

```ruby
require "sinatra"
require "roar-sinatra"

get '/orders/:id' do
  represent Order.find(params[:id])
end
```

### Modular Application

```ruby
require "sinatra/base"
require "roar-sinatra"

class MyApp < Sinatra::Base
  helpers Roar::Sinatra

  get '/orders/:id' do
    represent Order.find(params[:id])
  end

end
```

### Custom Representer Class

You can also use a custom representer class:

```ruby
get "/orders/:id"
  represent Order.find(params[:id]), :representer_class => CustomOrderRepresenter
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
