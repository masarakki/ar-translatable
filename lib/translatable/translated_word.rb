module Translatable
  class TranslatedWord < ActiveRecord::Base
    self.table_name = :translated_words

    validates :translatable, presence: true
    validates :key,          presence: true
    validates :locale,       presence: true, uniqueness: { scope: [:translatable_type, :translatable_id, :key] }
    validates :value,        presence: true

    belongs_to :translatable, polymorphic: true
  end
end
