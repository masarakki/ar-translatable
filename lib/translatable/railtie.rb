module Translatable
  class Railtie < ::Rails::Railtie
    initializer "translatable.initialize" do
      ActiveRecord::Base.include Translatable::ActsAsTranslatable
    end
  end
end
