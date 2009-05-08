require 'fileutils'

module Middleman
  module Store
    class File
      
      attr_accessor :path
      
      def initialize(path)
        @path = path
        
        unless ::File.exists? path
          FileUtils.mkdir_p(path)
        end
        
      end
      
    end
  end
end