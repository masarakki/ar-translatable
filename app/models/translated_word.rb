class TranslatedWord < ActiveRecord::Base
  validates :translatable, presence: true
  validates :key,          presence: true
  validates :locale,       presence: true, uniqueness: { scope: [:translatable_type, :translatable_id, :key] }
  validates :value,        presence: true

  belongs_to :translatable, polymorphic: true

  def pretty_format
    "#{locale}: #{value}"
  end
end
