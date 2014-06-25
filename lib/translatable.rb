require "translatable/version"
require "translatable/acts_as_translatable"
require "translatable/railtie" if defined? Rails
require "translatable/translated_word" if defined? ActiveRecord

module Translatable
end
