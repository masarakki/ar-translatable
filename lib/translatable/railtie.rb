module Translatable
  class Railtie < ::Rails::Railtie
    initializer "translatable.initialize" do
      ActiveSupport.on_load :active_record do
        include Translatable::ActsAsTranslatable
        require "translatable/translated_word"
      end
    end
  end
end
