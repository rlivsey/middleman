require 'fileutils'
require 'digest/md5'

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
        return unless ::File.exist?(path_from_key(key))
        Marshal.load(::File.read(path_from_key(key)))
      end
      
      def []=(key, val)
        ::File.open(path_from_key(key), 'w') do |f|
          f.write(Marshal.dump(val))
        end
      end
      
      def clear
        ::File.delete(*Dir["#{@path}/*"])
      end
      
      private
      
        def path_from_key(key)
          "#{@path}/#{Digest::MD5.hexdigest(key)}"
        end
      
    end
  end
end