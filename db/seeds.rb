require 'open-uri'

puts "Destroying goals..."
Goal.destroy_all
puts "Destroying users..."
User.destroy_all

puts "Creating users ..."

seb = User.create(name: "Seb", email: "seb@email.com", password: "123456")

puts "Creating Seb's goals ..."

goal1 = Goal.new(
  title: "Learn to Code.",
  description: "Learning to code and getting my fullstack dev license at Le Wagon so I can start my new job in IT.",
  start_time: "Fri, 15 Jan 2024",
  end_time: "Fri, 22 Mar 2024",
  active: true,
  emoji: "🖥",
  progress: 0
)
goal1.user = seb
goal1.save

goal2 = Goal.new(
  title: "Learn to drive",
  description: "Getting my license so I can drive my grandmother to her friends and her doctor's appointments.",
  start_time: "Fri, 30 Mar 2024",
  end_time: "Fri, 30 Mar 2025",
  emoji: "🚗"
)
goal2.user = seb
goal2.save

puts "Creating Seb's Coding tasks ..."

task01 = Task.new(title: "Research bootcamps")
task01.goal = goal1
task01.save
task02 = Task.new(title: "Get approval from Arbeitsagentur")
task02.goal = goal1
task02.save
task03 = Task.new(title: "W1: Programming Basics")
task03.goal = goal1
task03.save
task04 = Task.new(title: "W2: Object Oriented Programming")
task04.goal = goal1
task04.save
task05 = Task.new(title: "W3: Databases")
task05.goal = goal1
task05.save
task06 = Task.new(title: "W4/5: HTML & CSS")
task06.goal = goal1
task06.save
task07 = Task.new(title: "W7: AirBnTree Project")
task07.goal = goal1
task07.save
task08 = Task.new(title: "W8/9: Mono-Goal Project")
task08.goal = goal1
task08.save
task09 = Task.new(title: "Demo Day")
task09.goal = goal1
task09.save

puts "Creating Seb's Driving tasks ..."

task11 = Task.new(title: "Research driving schools")
task11.goal = goal2
task11.save
task12 = Task.new(title: "Practice with a friend.")
task12.goal = goal2
task12.save
task13 = Task.new(title: "Buy driving school theory sheet")
task13.goal = goal2
task13.save
task14 = Task.new(title: "Book driving lessons")
task14.goal = goal2
task14.save
task15 = Task.new(title: "Pass theory exam")
task15.goal = goal2
task15.save
task16 = Task.new(title: "Pass driving test")
task16.goal = goal2
task16.save
task17 = Task.new(title: "Research used cars")
task17.goal = goal2
task17.save
task18 = Task.new(title: "Buy massive car hifi system")
task18.goal = goal2
task18.save
task19 = Task.new(title: "Make mixtape for the first ride")
task19.goal = goal2
task19.save
task20 = Task.new(title: "Party with Granny")
task20.goal = goal2
task20.save

puts "Created #{User.count} users & #{Goal.count} goals with an overall total of #{Task.count} Tasks."
