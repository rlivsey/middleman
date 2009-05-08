module Middleman
  module Store
    class File
      
      attr_accessor :path
      
      def initialize(path)
        @path = path
      end
      
    end
  end
end