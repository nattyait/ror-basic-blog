FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence(word_count: 5) }
    content { Faker::Lorem.paragraph(sentence_count: 5) }

    trait :published do
      published_at { Time.current }
    end

    trait :draft do
      published_at { nil }
    end
  end
end