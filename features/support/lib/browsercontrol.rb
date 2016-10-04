# Loading the browsers.yml for essential config info and 
# also checking whether the TEST_BROWSER variable is set or not.
require 'yaml'

class BrowserControl 
    def self.[] key
        @@whichone[key]
    end

    def self.load name
        @@whichone = nil
        io = File.open( File.dirname(__FILE__) + "/browsers.yml" )
        YAML::load_documents(io) { |doc| @@whichone = doc[name] }
        raise "Could not locate a configuration named \"#{name}\"" unless @@whichone
    end

    def self.[]= key, value
        @@whichone[key] = value
    end
 
end

ENV['TEST_BROWSER']='headless' unless ENV['TEST_BROWSER']
BrowserControl.load (ENV['TEST_BROWSER'])
