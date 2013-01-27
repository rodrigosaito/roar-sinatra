require "roar-sinatra/version"

require 'sinatra/base'

module Roar
  module Sinatra

    def roar(object, options = {})
      content_type 'application/hal+json'

      representer_class = options[:representer_class] || Object::const_get("#{object.class.name}Representer")
      object.extend(representer_class).to_json
    end

  end
end
