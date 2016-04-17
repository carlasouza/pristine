require 'pristine/log'

module Pristine
  class Collector

    def self.add_event(name, flags)
      Log.info "#{name} - #{flags}"

      # do something more cool
    end

  end
end
