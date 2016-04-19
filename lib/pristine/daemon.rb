require 'rb-inotify'
require 'pristine/log'
require 'pristine/collector'

module Pristine
  class Daemon

    def self.notifier
      @@notifier ||= INotify::Notifier.new
      @@notifier
    end

    def self.set_target_files(files)
      files.each do |file|
        begin
          notifier.watch(file, Config.flags) do |event|
            Collector.add_event(event.absolute_name, event.flags)
          end
          Log.info "#{file} watcher created."
        rescue
          Log.warn "#{file} does not exist."
        end
      end
      notifier
    end

    def self.run
      set_target_files(Config.files_list)
      notifier.run
    rescue Interrupt
      notifier.stop
      Log.info 'Stopped all watchers. Exiting.'
    end

  end
end
