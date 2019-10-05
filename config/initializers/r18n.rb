ActiveSupport.on_load(:after_initialize) do
  locale = I18n.default_locale.to_s
  if defined? Rails::Console and not defined? Wirble
    i18n   = R18n::I18n.new(locale, R18n.default_places,
                            off_filters: :untranslated,
                            on_filters:  :untranslated_bash)
    R18n.set(i18n)
  else
    R18n.set(locale)
  end
end