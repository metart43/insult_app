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
hannah = User.create(name: "Hannah", username: "hannahg", password: "hannah")
liz = User.create(name: "Liz", username: "I<3Ham", password: "liz")
emily = User.create(name: "Emily", username: "emfrazz", password: "emily")
brian = User.create(name: "Brian", username: "bnabes", password: "brian")
kirk = User.create(name: "Kirk", username: "knabes", password: "kirk")
kathy = User.create(name: "Kathy", username: "mom", password: "kathy")
asger = User.create(name: "Asger", username: "asandpm", password: "asger")
johanne = User.create(name: "Johanne", username: "DrJ", password: "johanne")
david = User.create(name: "David", username: "DKJ", password: "david")
michael = User.create(name: "Michael", username: "MLJazz", password: "michael")
kylie = User.create(name: "Kylie", username: "kyler", password: "kylie")
claire = User.create(name: "Claire", username: "ergoclaire", password: "claire")
roman = User.create(name: "Roman", username: "Roman", password: "roman")
bill = User.create(name: "Bill", username: "billiam", password: "bill")
kristen = User.create(name: "Kristen", username: "kristenVB", password: "kristen")
roomsouls = Group.create(name: "Roomsouls", description: "315")
project = Group.create(name: "Artem + Shannon", description: "we created the best project ever")
nabors = Group.create(name: "Nabors Family", description: "next door")
das = Group.create(name: "DAS", description: "the Danish-American Syndicate")
naansense = Group.create(name: "Naansense", description: "It's a picture of a cat.")
watson = Group.create(name: "Team Watson", description: "somewhere in between")
roomsouls.users << shannon
roomsouls.users << hannah
roomsouls.users << liz
roomsouls.users << emily
project.users << shannon
project.users << artem
nabors.users << shannon
nabors.users << brian
nabors.users << kirk
nabors.users << kathy
das.users << shannon
das.users << hannah
das.users << johanne
das.users << asger
naansense.users << shannon
naansense.users << hannah
naansense.users << david
naansense.users << brian
naansense.users << michael
naansense.users << kylie
watson.users << kirk
watson.users << kathy
watson.users << shannon
watson.users << claire
watson.users << kristen
watson.users << kylie
watson.users << michael
watson.users << roman
watson.users << bill
insult1 = Insult.create(content: "ATTENTION! ATTENTION SHANNON! PLEASE LISTEN UP! YOU ARE THE WORST", bully: artem, group: project)
insult1.victims << shannon
