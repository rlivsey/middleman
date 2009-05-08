require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Middleman do
  
  describe "with default options" do
    
    it "should not be verbose" do
      Middleman.options[:verbose].should == false
    end
    
    it "should use a Middleman::Store::File" do
      Middleman.options[:store].class.should == Middleman::Store::File      
    end
    
    it "should use cache/mman for the cache directory" do
      Middleman.store.path.should == 'cache/mman'      
    end
    
    it "should not have a logger set" do
      Middleman.options[:logger].should be_nil
    end
    
  end
  
  describe "with file store" do
    
    it "should create the cache_dir if it doesn't exist" do
    end
    
    describe "changing the cache_dir" do
      before :all do
        Middleman.options[:store_dir] = 'other_place/'
      end      
      
      it "should save cache to the changed directory" do
      end
      
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