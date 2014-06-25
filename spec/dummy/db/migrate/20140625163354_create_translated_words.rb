class CreateTranslatedWords < ActiveRecord::Migration
  def change
    create_table(:translated_words) do |t|
      t.string  :translatable_type, null: false
      t.integer :translatable_id, null: false
      t.string  :key, null: false
      t.string  :locale, null: false
      t.string  :value, null: false
      t.index [:translatable_type, :translatable_id, :key, :locale], name: 'translated_word', unique: true
      t.timestamps
    end
  end
end
