require 'rails/generators/active_record'

module Translatable
  class MigrationGenerator < ::Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    desc 'Install migration file'
    def install
      migration_template 'migration.rb', 'db/migrate/create_translated_words.rb'
    end

    def self.next_migration_number(dirname)
      ActiveRecord::Generators::Base.next_migration_number(dirname)
    end
  end
end
