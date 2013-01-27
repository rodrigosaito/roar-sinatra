require "roar-sinatra/version"

require 'sinatra/base'

module Roar
  module Sinatra

    def roar(object, options = {})
      content_type 'application/hal+json'

      object.extend(Object::const_get("#{object.class.name}Representer")).to_json
    end

  end
end
