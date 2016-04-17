require 'parseconfig'

module Pristine
  class Config

    DEFAULT_FILES_LIST = '/var/lib/puppet/state/resources.txt'

    def self.load(config_file)
      @config ||= ParseConfig.new(config_file)
    end

    def self.config
      @config
    end

    def self.flags
      :modify #Lets watch IN_MODIFY events for now
    end

    def self.files_list
      list = []
      File.open(config.params['files_list'] || DEFAULT_FILES_LIST, 'r') do |f|
        f.each_line do |line|
          if line.match(/^file/)
            list << line.split('[')[1].split(']').first
          end
        end
      end
      list
    end

    def self.method_missing(method)
      @config.send method
    end


  end
end
