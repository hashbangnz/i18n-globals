require 'i18n'
require 'i18n/globals/version'

module I18n
  class Config
    def globals
      Thread.current["i18n_globals[#{Apartment::Tenant.current}]"] ||= {}
    end

    def globals=(globals)
      Thread.current["i18n_globals[#{Apartment::Tenant.current}]"] = globals
    end
  end

  class << self
    def translate(*args,**opts)
      opts = config.globals.merge(opts || {})
      super(*args,**opts)
    end

    alias :t :translate
  end
end
