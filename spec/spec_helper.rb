require 'rubygems'
require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'net/http'
require 'twitter'
require 'middleman'

Spec::Runner.configure do |config|
  
end

# used so we don't pollute STDOUT when running the specs
class DummyLogger 
  
  attr_accessor :lines
  
  def initialize
    reset!
  end
  
  def <<(msg)
    @lines << msg
  end
  
  def info(msg)
     @lines << msg
  end
 
  def reset!
    @lines = []
  end
  
end