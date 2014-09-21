module Translatable
  class Engine < ::Rails::Engine
    isolate_namespace Translatable
    initializer 'translatable.initialize' do
      ActiveSupport.on_load :active_record do
        include Translatable::ActsAsTranslatable
      end
    end
  end
end
