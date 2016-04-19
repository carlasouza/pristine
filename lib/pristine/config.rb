require 'yaml'
require 'optparse'
require 'ostruct'
require 'pristine/version'

module Pristine
  class Config

    DEFAULT_LOG = STDOUT
    DEFAULT_FLAGS = :modify #Lets watch IN_MODIFY events for now
    DEFAULT_FILES_LIST = '/var/lib/puppet/state/resources.txt'

    def self.load(args)
      @config = OpenStruct.new

      parser = OptionParser.new do |opts|
        opts.on_head('--config FILE', 'Config file') do |path|
          @config[:config_file] = path
          @config = OpenStruct.new(Hash[YAML::load(open(path)).map { |k, v| [k.to_sym, v] }])
        end

        # TODO
#        opts.on('-F', '--foreground', 'Run on foreground') do |v|
#          @config[:foreground] = v
#        end

        opts.on('-l', '--log FILE', 'Log output') do |v|
          @config[:log] = v
        end

        # TODO
#        opts.on('-f', '--flags x,y,z', Array, 'Systemcalls to watch') do |v|
#          @config[:config_file] = v
#        end

        opts.on('-f', '--files FILE', 'Files list to watch') do |v|
          @config[:files_list] = v
        end

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end

        opts.on_tail("--version", "Show version") do
          puts Pristine::VERSION
          exit
        end
      end
      parser.parse(args)
      parser.load(config.config_file) unless config.config_file.nil?

      set_defaults
    end

    def self.config
      @config
    end

    # Specific for Puppet's resource.txt file
    def self.files_list
      list = []
      File.open(@config.files_list, 'r') do |f|
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

    private
    def self.set_defaults
      @config.log ||= DEFAULT_LOG
      @config.flags ||= DEFAULT_FLAGS
      @config.files_list ||= DEFAULT_FILES_LIST
    end

  end
end
