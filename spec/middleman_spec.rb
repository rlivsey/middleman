require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


describe Middleman::Store::File do
  
  it "should create the cache dir if it doesn't exist" do
    FileUtils.rm_rf('cache')
    File.exist?('cache').should == false
    @store = Middleman::Store::File.new('cache')    
    File.exist?('cache').should == true
  end
  
end

describe Middleman do
  
  def do_get
    Twitter::Search.new('bacon')
  end
  
  describe "with default options" do
    
    it "should not be verbose" do
      Middleman.options[:verbose].should == false
    end
    
    it "defaults to a hash store" do
      Middleman.options[:store].class.should == Hash
    end
    
    it "should not have a logger set" do
      Middleman.options[:logger].should be_nil
    end
    
  end
  
  describe "with file store" do
    
    before :all do
      Middleman.options[:store] = Middleman::Store::File.new('cache')
    end    
        
  end
  
  describe "with no store" do
    before :all do
      Middleman.options[:store] = nil
    end
    
    it "should do nothing" do
    end
    
  end
  
  describe "with a Hash store" do
    
    before :all do
      Middleman.options[:store] = {}
    end
    
    it "should cache to the hash" do
    end
    
  end
  
  describe "with verbose logging" do
    
    before :all do
      Middleman.options[:verbose] = true
      Middleman.options[:logger]  = DummyLogger.new
    end
    
    it "should log to the logger" do
    end
    
  end
  
end