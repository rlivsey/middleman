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
    
  end  
  
end