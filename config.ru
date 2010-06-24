require 'rubygems'
require 'bundler'
Bundler.setup

require 'rack-cache-app'
require 'no_varnish'

use NoVarnish
run RackCacheApp
