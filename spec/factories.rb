# frozen_string_literal: true

FactoryGirl.define do
  factory :school do
    name    { Faker::Name.name }
    address { Faker::Address.street_address }
    city    { Faker::Address.city }
    state   { Faker::Address.state_abbr }
    zip     39157
  end

  factory :author do
    name     { Faker::Name.name }
    email    { Faker::Internet.email }
    image    "path-to-image"
    school   { FactoryGirl.create(:school) }
  end

  factory :article do
    name          { Faker::Name.name }
    content       "This is content"
    is_published  true
    publish_date  DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M")
    likes         0
    loves         0
    thumbnail     "path-to-img"
    school        { FactoryGirl.create(:school) }
    author        { FactoryGirl.create(:author) }
  end

  factory :team do
    name            { Faker::Name.name }
    sport           "Baskeball"
    thumbnail       "path-to-thumbnail"
    twitter_url     "path-to-twitter-url"
    facebook_url    "path-to-facebook-url"
    instagram_url   "path-to-instagram_url"
    school          { FactoryGirl.create(:school) }
  end

  factory :event do
    name            { Faker::Name.name }
    description     "This is a description"
    date            DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M")
    likes           0
    loves           0
    location        "This is a location"
    school          { FactoryGirl.create(:school) }
  end
end
