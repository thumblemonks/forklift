$: << File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'active_support'
require 'active_record'
require 'forklift'
require 'test/unit'
require 'mocha'
require 'ruby-debug'
ActiveRecord::Base.establish_connection('adapter' => 'sqlite3', 'dbfile' => ':memory:')
require File.dirname(__FILE__) + '/schema'
require File.dirname(__FILE__) + '/model_factory'
