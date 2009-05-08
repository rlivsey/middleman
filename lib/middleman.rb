require 'store/file'
require 'intercepts/net_http'

module Middleman
  
  # default options
  @options = {
    :verbose    => false,       # don't output any info
    :logger     => nil,         # defaults to STDOUT
    :store      => Middleman::Store::File.new('cache/mman')
  }
  
  class << self
    attr_accessor :options
    
    def store
      @options[:store]
    end
    
  end  
  
end