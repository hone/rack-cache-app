require 'sinatra/base'
require 'memcached'
require 'rack/cache'

class RackCacheApp < Sinatra::Base
  $cache = Memcached.new

  use Rack::Cache,
    :verbose => true,
    :metastore => $cache,
    :entitystore => $cache

  get "/" do
    cache_control :public, :max_age => 2 * 60

    "Cached at #{Time.now.to_s}"
  end
end
