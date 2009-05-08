module Net
  class HTTP
    alias :old_initialize :initialize
    alias :old_request :request

    def initialize(*args, &block)
      Middleman.log "CONNECT: #{args.inspect}" if Middleman.options[:verbose]
      old_initialize(*args, &block)
    end

    def request(*args, &block)
      req = args[0].class::METHOD      
      key = "#{req}:#{@address}:#{@port}#{args[0].path}"     

      if started? && Middleman.options[:verbose]
        Middleman.log "#{req} #{@address}:#{@port}#{args[0].path}"     
      end
      
      if result = Middleman.retrieve(key)
        Middleman.log "CACHE HIT"             
      else
        Middleman.log "NOT IN CACHE"             
        result = old_request(*args, &block)        
        Middleman.cache(key, result.body)
      end
      
      if started? && Middleman.options[:verbose]
        Middleman.log "PARAMS #{CGI.parse(args[0].body).inspect} " if args[0].body && req != 'CONNECT'
        Middleman.log "RESPONSE: #{result.class.name}"
      end      
    
      result
    end
    
  end
end