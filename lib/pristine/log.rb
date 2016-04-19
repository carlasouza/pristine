require 'logger'
require 'pristine/config'

module Pristine
  class Log

    def self.warn(msg)
      log.warn msg
    end

    def self.info(msg)
      log.info msg
    end

    private

    def self.log
      @@log ||= Logger.new(Pristine::Config.log, 'weekly')
      @@log
    end

  end
end
