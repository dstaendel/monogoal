require 'open-uri'

puts "Destroying Goals... 🧼"
Goal.destroy_all
puts "Destroying Users... 🧹"
User.destroy_all

puts "Creating Users 🤷🏼‍♀️💁🏻‍♂️🙆🏽‍♂️🤷🏼‍♂️"

emma = User.create(name: "Emma", email: "emma@test.com", password: "123456")
seb = User.create(name: "Sebastian", email: "sebastian@email.com", password: "123456")
dominic = User.create(name: "Dominic", email: "dominic@email.com", password: "123456")
jerome = User.create(name: "Jerome", email: "jerome@email.com", password: "123456")

puts "Creating Emma's Goals... 🤷🏼‍♀️"

goal1 = Goal.new(
  title: "Learn to speak Spanish", 
  description: "Learning to speak spanish and finally being able to speak to my friends", 
  start_time: "Fri, 01 Mar 2023", 
  end_time: "Fri, 29 Feb 2024", 
  emoji: "🇪🇸", 
  progress: 0
  )
goal1.user = emma
goal1.save

goal2 = Goal.new(
  title: "Learn to Code", 
  description: "Learning to code in more languages", 
  start_time: "Fri, 15 Jan 2024", 
  end_time: "Fri, 22 Mar 2024", 
  active: true, 
  emoji: "🖥", 
  progress: 20
  )
goal2.user = emma
goal2.save

puts "Creating Sebastian's goals... 🙆🏽‍♂️"

goal3 = Goal.new(
  title: "Learn to code", 
  description: "Learning to code and getting my fullstack dev license at Le Wagon so I can start my new job in IT.", 
  start_time: "Fri, 15 Jan 2024", 
  end_time: "Fri, 22 Mar 2024", 
  emoji: "🖥", 
  progress: ""
  )
goal3.user = seb
goal3.save

goal4 = Goal.new(
  title: "Learn to speak German", 
  description: "Learning to speak German, so I can finally understand the stupid puns", 
  start_time: "Fri, 15 Jan 2024", 
  end_time: "Fri, 22 Mar 2024", 
  active: true,
  emoji: "🇩🇪",
  progress: ""
  )
goal4.user = seb
goal4.save

puts "Creating Dominic's goals... 💁🏻‍♂️"

goal5 = Goal.new(
  title: "Learn to drive", 
  description: "Learning to drive and getting my license so I can drive my grandmother to her friends and her doctor's appointments", 
  start_time: "Fri, 01 Mar 2023", 
  end_time: "Fri, 29 Feb 2024", 
  emoji: "🚗", progress: ""
  )
goal5.user = dominic
goal5.save

goal6 = Goal.new(
  title: "Learn to Code", 
  description: "Learning to code and getting my fullstack dev license at Le Wagon so I can start my new job in IT.", 
  start_time: "Fri, 15 Jan 2024", 
  active: true, 
  end_time: "Fri, 22 Mar 2024", 
  emoji: "🖥", progress: ""
  )
goal6.user = dominic
goal6.save

puts "Creating Jerome's goals... 🤷🏼‍♂️"

goal7 = Goal.new(
  title: "Finish the Tree Feature", 
  description: "Learning to build this amazing feature for our app", 
  start_time: "Fri, 08 Jan 2024", 
  end_time: "Fri, 08 Mar 2024", 
  emoji: "🌳",
  progress: 0
  )
goal7.user = jerome
goal7.save

goal8 = Goal.new(
  title: "Learn to Code", 
  description: "Learning to code and getting my fullstack dev license at Le Wagon so I can start my new job in IT.", 
  start_time: "Fri, 15 Jan 2024", 
  end_time: "Fri, 22 Mar 2024", 
  active: true, 
  emoji: "🖥", 
  progress: 0
  )
goal8.user = jerome
goal8.save

puts "Created #{User.count} Users & #{Goal.count} Goals 🌱🌱🌱"
