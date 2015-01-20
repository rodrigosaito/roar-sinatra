require "roar-sinatra/version"

require 'sinatra/base'

module Roar
  module Sinatra


    def represent(object, options = {})
      content_type options.fetch('content_type', 'application/json')

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
        clarr = object.class.name.to_s.split('::')
        clarr[-1].gsub!(/^(.*)$/, '\1Representer')
        representer_class = options[:representer_class] || clarr.inject(Object) { |container, name| container.const_get(name.to_s) }
        if representer_class.kind_of?(Class)
          representer_class.new(object).to_hash(options)
        else
          object.extend(representer_class).to_hash(options)
        end
      end

  end
end
