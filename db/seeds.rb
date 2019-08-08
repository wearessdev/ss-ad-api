# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

School.create([
                { name: "Ridgeland High School", address: "586 Sunnybrook Road", city: "Ridgeland", state: "Ms", zip: 39157 },
                { name: "Madison Central High School", address: "586 Sunnybrook Road", city: "Ridgeland", state: "Ms", zip: 39157 }
              ])

Team.create([
              { name: "Men's Basketball", sport: "Basketball", school_id: 1, thumbnail: nil, twitter_url: nil, facebook_url: nil, instagram_url: nil },
              { name: "MC Football", sport: "Football", thumbnail: nil, twitter_url: nil, facebook_url: nil, instagram_url: nil }
            ])

Player.create([
                { first_name: "Kelcy", last_name: "Gooch", school_id: 1, team_id: 1, jersey_number: 7, position: "SG", height: "6.0", weight: "193", class_name: "Senior" },
                { first_name: "CJ", last_name: "Goodwill", school_id: 2, team_id: 2, jersey_number: 33, position: "LB", height: "5.7", weight: "185", class_name: "Senior" }

              ])

Staff.create([
               { first_name: "Brandon", last_name: "Fallings", title: "Shooting Coach", email: "brandonfallings@iamthatguy.yep", phone: "555-223-1123", team_id: 1, school_id: 1 },
               { first_name: "Ray", last_name: "Lewis", title: "Line Backer Coach", email: "RayLewis@iamthatguy.yep", phone: "555-223-1123", team_id: 2, school_id: 2 }
             ])

Season.create([
                { year_start: 2019, year_end: 2020, school_id: 1, team_id: 1 },
                { year_start: 2019, year_end: 2020, school_id: 2, team_id: 2 }
              ])

Game.create([
              { date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), opponent: "Madison Central High School", location: "586 Sunnybrook Road Ridgeland, Ms", home_away: "home", win: nil, loss: nil, score: nil, season_id: 1, team_id: 1, school_id: 1 }
            ])

Event.create([
               { name: "Hooper's Rebound: Fundraiser Event", description: "Fundraiser Event for players rebounding from injury", date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), location: "586 Sunnybrook Road Ridgeland, Ms", likes: 0, loves: 0, school_id: 1 }
             ])

Category.create([
                  { name: "Basketball" },
                  { name: "Football" }
                ])

Author.create([
                { name: "Adrian Marcus", school_id: 1 }
              ])

Article.create([
                 { name: "The Vertical Rise of Micheal Jordan", author_id: 1, content: "A long string of things", school_id: 1, is_published: true, publish_date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), likes: 0, loves: 0, thumbnail: "url-to-image" }
               ])

Image.create([
               { name: "Image 1", caption: "Vince Carter jumping over French dude", file: "path-to-file" }
             ])
