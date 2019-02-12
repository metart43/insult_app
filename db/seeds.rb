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

artem = User.create(name: "Artem", username: "Metart", password: "artem")
shannon = User.create(name: "Shannon", username: "snabes", password: "shannon")
ryan = User.create(name: "Ryan", username: "RyGuy", password: "ryan")
ross = User.create(name: "Ross", username: "RossTheBoss", password: "ross")
anthony = User.create(name: "Anthony", username: "antman", password: "anthony")
hai = User.create(name: "Hai", username: "OhHaiThere", password: "hai")
andrea = User.create(name: "Andrea", username: "ANW2000", password: "andrea")
table6 = Group.create(name: "Table 6", description: "the best")
mders = Group.create(name: "Marylanders", description: "people from MD")
mod2 = Group.create(name: "Mod 2", description: "people in Mod 2")
table6.users << shannon
table6.users << artem
table6.users << ryan
mders.users << shannon
mders.users << anthony
mders.users << andrea
mders.users << ross
mod2.users << shannon
mod2.users << artem
mod2.users << hai
mod2.users << ryan
mod2.users << ross
mod2.users << anthony
mod2.users << andrea
insult1 = Insult.create(content: "You are the worst teammate!!!!", bully: artem, group: table6)
UserInsult.create(victim: shannon, insult: insult1)
insult2 = Insult.create(content: "your notes are boring", bully: andrea, group: mod2)
UserInsult.create(victim: hai, insult: insult2)
insult3 = Insult.create(content: "ohohohoho", bully: ryan, group: table6)
UserInsult.create(victim: shannon, insult: insult3)
UserInsult.create(victim: artem, insult: insult3)
insult4 = Insult.create(content: "slap slap slap", bully: hai, group: mod2)
UserInsult.create(victim: anthony, insult: insult4)
insult5 = Insult.create(content: "you are a bully", bully: andrea, group: mders)
UserInsult.create(victim: anthony, insult: insult5)
