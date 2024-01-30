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
    def translate(*args)
      if args.last.is_a?(Hash)
        args[-1] = config.globals.merge(args.last)
      else
        args << config.globals
      end
      super(*args)
    end

    alias :t :translate
  end
end
