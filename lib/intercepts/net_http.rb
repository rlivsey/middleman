module Net
  class HTTP
    alias :old_initialize :initialize
    alias :old_request :request

    def initialize(*args, &block)
      Middleman.logger.info "CONNECT: #{args.inspect}" if Middleman.options[:verbose]
      old_initialize(*args, &block)
    end

    def request(*args, &block)
      unless started? || Middleman.options[:verbose]
        req = args[0].class::METHOD
        Middleman.logger.info "#{req} #{args[0].path}"
      end

      result = old_request(*args, &block)
      
      unless started? || Middleman.options[:verbose]
       Middleman.logger.info "PARAMS #{CGI.parse(args[0].body).inspect} " if args[0].body && req != 'CONNECT'
       Middleman.logger.info "BODY: #{result.body}"
      end
      
      result
    end
    
  end
end