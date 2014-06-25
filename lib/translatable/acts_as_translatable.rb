require 'active_support/concern'

module Translatable
  module ActsAsTranslatable
    extend ActiveSupport::Concern

    module ClassMethods
      def translatable(key)
      end
    end
  end
end
