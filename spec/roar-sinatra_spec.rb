require 'spec_helper'

require 'roar/representer/json'
require 'roar/representer/json/hal'

describe Roar::Sinatra do

  class Person
    attr_accessor :name

    def initialize(name)
      @name = name
    end
  end

  module PersonRepresenter
    include Roar::Representer::JSON
    include Roar::Representer::JSON::HAL

    property :name
  end

  def mock_app(&block)
    super do
      helpers Roar::Sinatra
      class_eval(&block)
    end
  end

  def results_in(obj)
    OkJson.decode(get('/').body).should == obj
  end

  context "using roar without options" do

    before do
      mock_app do
        get '/' do
          roar Person.new('Some Person')
        end
      end
    end

    let(:response) { get '/' }

    let(:expected_json) do
      {
        name: 'Some Person'
      }.to_json
    end

    it "returns a response with content_type hal+json" do
      response.content_type.should == 'application/hal+json'
    end

    it "returns a hal+json" do
      response.body.should == expected_json
    end

  end

end
