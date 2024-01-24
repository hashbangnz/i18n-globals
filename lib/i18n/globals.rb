require 'i18n'
require 'i18n/globals/version'

module I18n
  class Config
    def globals
      Thread.current[:i18n_globals] ||= {}
    end

    def globals=(globals)
      Thread.current[:i18n_globals] = globals
    end
  end

  class << self
    def translate(key = nil, options = {})
      super(key, **options.merge(config.globals))
    end

    alias :t :translate
  end
end
