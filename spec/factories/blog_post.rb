FactoryBot.define do
  # creates a `published` blog post by default
  factory :blog_post do
    title { Faker::Company.bs }
    body { Faker::TvShows::TheITCrowd.quote }
    published_at { Time.current - 1.day }
  end

  trait :draft do
    published_at { nil }
  end

  trait :scheduled do
    published_at { Time.current + 1.day }
  end
end
