require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'pp'

describe Middleman do
  
  def do_get
    Twitter::Search.new('bacon')
  end
  
  describe "default options" do
    
    it "should not be verbose" do
      Middleman.options[:verbose].should == false
    end
    
    it "should be a hash store" do
      Middleman.options[:store].class.should == Hash
    end
    
    it "should not have a logger" do
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




describe Middleman::Store::File do
  
  before :each do
    @store = Middleman::Store::File.new('cache/mman')     
    @store.clear   
  end
  
  it "should create the cache dir if it doesn't exist" do
    FileUtils.rm_rf('cache')
    File.exist?('cache').should == false
    Middleman::Store::File.new('cache/mman')    
    File.exist?('cache').should == true
  end
  
  describe "#clear" do
    
    it "should delete all the files in the cache directory" do
      @store["test"] = 'test'
      Dir["#{@store.path}/*"].should_not be_empty
      @store.clear
      Dir["#{@store.path}/*"].should be_empty
    end
    
  end
  
  describe "#[]" do
    
    it "should retrieve the contents of the file if it exists" do
      @store["test"] = 'test'
      @store["test"].should == 'test'
    end
    
    it "should return nil if the file doesn't exist" do
      @store["test"].should == nil
    end
    
  end
  
  describe "#[]=" do
    
    it "should create a file with the MD5 of the name" do
      @store["test"] = 'test'
      File.exist?("#{@store.path}/test").should == true
    end
    
  end
  
end
