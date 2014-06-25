# -*- coding: utf-8 -*-
require 'rails_helper'

describe User do
  describe "factory" do
    it { expect(build(:user)).to be_valid }
  end

  describe "nested_attributes_for" do
    let(:user) {
      User.create(
        first_names_attributes: [{locale: 'ja', value: 'ジョン'}, {locale: 'en', value: 'John'}],
        last_names_attributes: [{locale: 'ja', value: 'レノン'}, {locale: 'en', value: 'Lennon'}]
        )
    }
    it { expect(user.first_names.count).to eq 2 }
    it { expect(user.last_names.count).to eq 2 }
  end

  describe "translatable" do
    before { I18n.available_locales = [:en, :ja] }
    let(:user) { create :user }
    before do
      create :translated_word, :en, translatable: user
      create :translated_word, :ja, translatable: user
    end
    it { expect(user.first_name(:en)).to eq "John" }
    it { expect(user.first_name(:ja)).to eq "ジョン" }

    context "default locale = :en" do
      before { I18n.default_locale = :en }
      after  { I18n.default_locale = :en }
      it { expect(user.first_name).to eq "John" }
    end

    context "default locale = :ja" do
      before { I18n.default_locale = :ja }
      after  { I18n.default_locale = :en }
      it { expect(user.first_name).to eq "ジョン" }
    end
  end
end
