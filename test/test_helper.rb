$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'attr_chain'

require 'minitest'
require 'minitest/autorun'
require 'shoulda/context'
require 'minitest/reporters'
# require 'factory_girl'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new 

