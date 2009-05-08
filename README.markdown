## About

Middleman is a simple logging/caching proxy for Net::HTTP which can make developing against remote services easier (especially if they have API limits).

By default, it caches to a file, so the cache is persistent across multiple runs of your app.

## Installation

sudo gem install rlivsey-middleman

## Example usage

    require 'rubygems'
    require 'twitter'
    gem 'middleman'
    require 'middleman'
    
    Twitter::Search.new('bacon') # makes the request to Twitter
    Twitter::Search.new('bacon') # same search, so returns from the cache

## Options

Output information to the console

    Middleman.options[:verbose] = true
    
Change the store used for the cache, see the 'stores' section below for more information,
but it's basically an object which acts like a Hash

    Middleman.options[:cache] = {}
    
Change the directory where the Middleman::Store saves the cached files

    Middleman.options[:cache_dir] = '/tmp/middleman_cache/'
    
Change where verbose output is sent, by default it's STDOUT

    Middleman.options[:logger] = Logger.new('middleman.log')
    
    
## Stores
    
By default Middleman uses Middleman::Store to cache the requests to files in a directory.
The file names are MD5 hashes of the request details.

The interface to Middleman::Store is basically a Hash, so any object which responds to [], []= and 
is enumerable can be used as a store. 

Using a Hash for the store will work fine, but will not persist across runs of your application.    
    
## Notes

At the moment this only works against Net::HTTP. I've got plans to make it easier to extend and add the ability to work with other libraries such as Curb etc...

Feel free to fork and send in patches.

## Me

 * Home & Contact info: http://livsey.org
 * Twitter: http://twitter.com/rlivsey
 * GitHub: http://github.com/rlivsey
 * Recommend: http://www.workingwithrails.com/person/5436-richard-livsey
 