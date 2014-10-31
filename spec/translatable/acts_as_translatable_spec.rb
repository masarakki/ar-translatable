require 'rails_helper'

describe Translatable::ActsAsTranslatable do
  let(:klass) do
    Class.new do
      include Translatable::ActsAsTranslatable
    end
  end

  it { expect(klass.private_instance_methods).to include :translated_word }
end
