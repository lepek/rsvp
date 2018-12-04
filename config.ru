# This file is used by Rack-based servers to start the application.

require 'rack/iframe'
use Rack::Iframe

require_relative 'config/environment'

run Rails.application
