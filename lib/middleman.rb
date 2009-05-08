require 'store/file'
require 'intercepts/net_http'

module Middleman
  
  # default options
  @options = {
    :verbose    => false,       # don't output any info
    :logger     => nil,         # defaults to STDOUT
    :store      => {}
  }
  
  class << self
    attr_accessor :options
    
    def store
      @options[:store]
    end
    
    def logger
      @options[:logger]
    end
    
    def log(message)
      return unless @options[:verbose]
      logger ? logger.info(message) : puts(message)
    end
    
    def cache(key, value)
      return unless store
      store[key] = value
    end
    
    def retrieve(key)
      return unless store
      store[key]
    end
    
  end  
  
end