# frozen_string_literal: true

FactoryGirl.define do
  factory :school do
    name    { Faker::Name.name }
    address { Faker::Address.street_address }
    city    { Faker::Address.city }
    state   { Faker::Address.state_abbr }
    zip     39157
  end

  factory :token do
    token "This is a token"
    user  { FactoryGirl.create(:user) }
  end

  factory :user do
    name      { Faker::Name.name }
    email     { Faker::Internet.email }
    password  "This is a long password"
    school    { FactoryGirl.create(:school) }
    token     nil
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

  factory :player do
    first_name        { Faker::Name.first_name }
    last_name         { Faker::Name.last_name }
    team              { FactoryGirl.create(:team) }
    jersey_number     33
    position          "SG"
    height            "5'11"
    weight            "185"
    class_name        "Junior"
  end

  factory :staff do
    first_name        { Faker::Name.first_name }
    last_name         { Faker::Name.last_name }
    team              { FactoryGirl.create(:team) }
    title             "Assistant Coach to the Assistant"
    email             { Faker::Internet.email }
    phone             { Faker::PhoneNumber.phone_number }
  end

  factory :season do
    year_start   "2019"
    year_end     "2020"
    team         { FactoryGirl.create(:team) }
  end

  factory :game do
    date            DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M")
    opponent        "The Other Guys"
    location        "Our House"
    home_away       "home"
    win             true
    loss            false
    score           "30-15"
    season          { FactoryGirl.create(:season) }
  end
end
