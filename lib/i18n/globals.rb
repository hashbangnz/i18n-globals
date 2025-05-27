require 'i18n'
require 'i18n/globals/version'

module I18n
  class Config
    def globals
      @@globals.presence || {}
    end

    def globals=(new_globals)
      @@globals = new_globals
    end
  end

  class << self
    def globals
      config.globals
    end

    def globals=(new_globals)
      config.globals = new_globals
    end

    def translate(*args,**opts)
      opts = config.globals.merge(opts || {})
      super(*args,**opts)
    end

    alias :t :translate
  end
end
