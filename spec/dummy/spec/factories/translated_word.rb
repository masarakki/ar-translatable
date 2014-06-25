# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :translated_word, class: Translatable::TranslatedWord do
    translatable factory: :user
    key :first_name
    trait :en do
      locale :en
      value "John"
    end

    trait :ja do
      locale :ja
      value "ジョン"
    end
  end
end
