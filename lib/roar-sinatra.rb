require "roar-sinatra/version"

require 'sinatra/base'

module Roar
  module Sinatra

    def roar(object, options = {})
      content_type 'application/hal+json'

      if object.is_a? Array
        object.map do |obj|
          serialize_object(obj, options)
        end.to_json
      else
        serialize_object(object, options).to_json
      end
    end

    private

      def serialize_object(object, options = {})
        representer_class = options[:representer_class] || Object::const_get("#{object.class.name}Representer")
        object.extend(representer_class).to_hash
      end

  end
end
