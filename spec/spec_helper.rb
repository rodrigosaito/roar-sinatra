require 'roar-sinatra'
require 'json'
require 'sinatra/contrib'
require 'json'

RSpec.configure do |config|

  config.include Sinatra::TestHelpers

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
