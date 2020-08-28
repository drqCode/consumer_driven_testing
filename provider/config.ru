require 'rack'
require 'puma'

require_relative 'app'

run Application.new