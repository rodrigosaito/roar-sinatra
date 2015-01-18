require 'spec_helper'

require 'roar/json'
require 'roar/json/hal'

describe Roar::Sinatra do

  class Person
    attr_accessor :name, :age

    def initialize
      @name = "Some Name"
      @age = 20
    end
  end

  module PersonRepresenter
    include Roar::JSON
    include Roar::JSON::HAL

    property :name
  end

  module CustomPersonPresenter
    include Roar::JSON
    include Roar::JSON::HAL

    property :age
  end

  def mock_app(&block)
    super do
      helpers Roar::Sinatra
      class_eval(&block)
    end
  end

  def results_in(obj)
    JSON.parse(get('/').body).should == obj
  end

  let(:response) { get '/' }

  context "using roar without options" do

    before do
      mock_app do
        get '/' do
          roar Person.new
        end
      end
    end

    it "returns a response with content_type hal+json" do
      response.content_type.should == 'application/hal+json'
    end

    it "returns a hal+json response" do
      results_in "name" => 'Some Name'
    end

  end

  context "passing presenter class as parameter" do

    before do
      mock_app do
        get '/' do
          roar Person.new, :representer_class => CustomPersonPresenter
        end
      end
    end

    it "returns a hal+json response" do
      results_in "age" => 20
    end

  end

  context "when the object to serialize is an array" do

    before do
      mock_app do
        get '/' do
          roar [ Person.new ]
        end
      end
    end

    it "return an array" do
      results_in [ { "name" => "Some Name" } ]
    end
  end

end
