# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    sequence :name do |n|
      "room_#{n}"
    end
  end
end