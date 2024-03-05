require 'open-uri'

puts "Destroying Goals..."
Goal.destroy_all
puts "Destroying Users..."
User.destroy_all

puts "creating users ..."

user1 = User.create(name: "emma", email: "emma@email.com", password: "123456")
user2 = User.create(name: "sebastian", email: "sebastian@email.com", password: "123456")
user3 = User.create(name: "dominic", email: "dominic@email.com", password: "123456")
user4 = User.create(name: "jerome", email: "jerome@email.com", password: "123456")

puts "creating emma's goals ..."

goal1 = Goal.new(title: "Learn to drive", description: "Learning to drive and getting my license so I can drive my grandmother to her friends and her doctor's appointments", active: false, start_time: "Fri, 01 Mar 2023", end_time: "Fri, 29 Feb 2024", emoji: "🚗", progress: "")
goal1.user = user1
goal1.save

goal2 = Goal.new(title: "Learn to code", description: "Learning to code and getting my fullstack dev license at Le Wagon so I can start my new job in IT.", start_time: "Fri, 15 Jan 2024", end_time: "Fri, 22 Mar 2024", emoji: "🖥", progress: "")
goal2.user = user1
goal2.save

puts "creating sebastian's goals ..."

goal3 = Goal.new(title: "Learn to drive", description: "Learning to drive and getting my license so I can drive my grandmother to her friends and her doctor's appointments", active: false, start_time: "Fri, 01 Mar 2023", end_time: "Fri, 29 Feb 2024", emoji: "🚗", progress: "")
goal3.user = user2
goal3.save

goal4 = Goal.new(title: "Learn to code", description: "Learning to code and getting my fullstack dev license at Le Wagon so I can start my new job in IT.", start_time: "Fri, 15 Jan 2024", end_time: "Fri, 22 Mar 2024", emoji: "🖥", progress: "")
goal4.user = user2
goal4.save

puts "creating dominic's goals ..."

goal5 = Goal.new(title: "Learn to drive", description: "Learning to drive and getting my license so I can drive my grandmother to her friends and her doctor's appointments", active: false, start_time: "Fri, 01 Mar 2023", end_time: "Fri, 29 Feb 2024", emoji: "🚗", progress: "")
goal5.user = user3
goal5.save

goal6 = Goal.new(title: "Learn to code", description: "Learning to code and getting my fullstack dev license at Le Wagon so I can start my new job in IT.", start_time: "Fri, 15 Jan 2024", end_time: "Fri, 22 Mar 2024", emoji: "🖥", progress: "")
goal6.user = user3
goal6.save

puts "creating jerome's goals ..."

goal7 = Goal.new(title: "Learn to drive", description: "Learning to drive and getting my license so I can drive my grandmother to her friends and her doctor's appointments", active: false, start_time: "Fri, 01 Mar 2023", end_time: "Fri, 29 Feb 2024", emoji: "🚗", progress: "")
goal7.user = user4
goal7.save

goal8 = Goal.new(title: "Learn to code", description: "Learning to code and getting my fullstack dev license at Le Wagon so I can start my new job in IT.", start_time: "Fri, 15 Jan 2024", end_time: "Fri, 22 Mar 2024", emoji: "🖥", progress: "")
goal8.user = user4
goal8.save

puts "Finished creating."
