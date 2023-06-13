# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    dup._call(env)
  end

  def _call(env)
    locale = env['HTTP_ACCEPT_LANGUAGE']&.split(/,(s+)?/)&.map(&:strip)
    locale = locale[0][0..2]&.to_sym if locale
    I18n.locale = if !locale.nil? && I18n.available_locales.include?(locale)
                    locale
                  else
                    I18n.default_locale
                  end

    @app.call(env)
  end
  # END
end
