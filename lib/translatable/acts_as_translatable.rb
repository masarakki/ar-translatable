require 'active_support/concern'

module Translatable
  module ActsAsTranslatable
    extend ActiveSupport::Concern

    module ClassMethods
      def translatable(column)
        key_name = column.to_s.pluralize.to_sym
        has_many key_name, -> { where(key: column.to_s) }, :as => :translatable, class_name: 'TranslatedWord',
        :inverse_of => :translatable, :dependent => :destroy
        accepts_nested_attributes_for key_name
        define_method column do |locale = I18n.default_locale|
          localizes = send(key_name)
          localizes.detect{|w| w.locale.to_s == locale.to_s }.try(:value) || localizes.first.try(:value)
        end
      end
    end
  end
end
