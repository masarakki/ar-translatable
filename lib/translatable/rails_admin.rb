module Translatable
  module RailsAdmin
    extend ActiveSupport::Concern

    included do |model|
      model.rails_admin do
        object_label_method :pretty_format
        edit do
          field :locale
          field :value
        end
      end
    end

    class InstanceMethods
      def pretty_format
        "#{locale}: #{value}"
      end
    end
  end
end

TranslatedWord.send :include, Translatable::RailsAdmin
