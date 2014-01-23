# config.ru
require "rubygems"
require "bundler"

# Bad Bundler
before_env = ENV['RACK_ENV'].dup

Bundler.require(:default)

# TODO: Bundler is resetting the env, why?
ENV['RACK_ENV'] = before_env

require 'sinatra/base'
require 'erb'
require 'httparty'
require 'json'

require './app'
run Sinatra::Application
