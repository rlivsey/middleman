require 'fileutils'

module Middleman
  module Store
    class File
      
      attr_accessor :path
      
      def initialize(path)
        @path = path.chomp('/')
        
        unless ::File.exists? path
          FileUtils.mkdir_p(path)
        end
        
      end
      
      def [](key)
        ::File.read(path_from_key(key)) if ::File.exist?(path_from_key(key))
      end
      
      def []=(key, val)
        ::File.open(path_from_key(key), 'w') do |f|
          f.write(val)
        end
      end
      
      def clear
        ::File.delete(*Dir["#{@path}/*"])
      end
      
      private
      
        def path_from_key(key)
          "#{@path}/#{key}"
        end
      
    end
  end
end