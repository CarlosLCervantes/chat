# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :handle do |n|
      "user_#{n}"
    end
  end
end