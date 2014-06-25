# -*- coding: utf-8 -*-
require 'rails_helper'

describe User do
  describe "factory" do
    it { expect(build(:user)).to be_valid }
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
