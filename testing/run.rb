require "rubygems"
require "bundler"

Bundler.setup
Bundler.require

$:.push File.expand_path("../cells", __FILE__)
require "my_cell"
require "your_cell"
require "action_dispatch"

request = ActionDispatch::Request.new(Rack::MockRequest.env_for("/"))

p MyCell.new(request).dispatch(:display, request)[2]
# p MyCell.new.process(:display)
# p MyCell.new.process(:display)
# p YourCell.new.process(:display)