# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
Insult.delete_all
UserInsult.delete_all

artem = User.create(name: "Artem")
shannon = User.create(name: "Snannon")
insult1 = Insult.create(content: "You are the worst teammate!!!!", bully: artem)
action1 = UserInsult.create(victim: shannon, insult: insult1)
