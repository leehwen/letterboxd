# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts "resetting data base..."
Review.destroy_all
Film.destroy_all
List.destroy_all
FilmLibrary.destroy_all
User.destroy_all


puts "creating entries..."

## USERS

user1 = User.create!(
  username: "leehwen",
  email: "user1@email.com",
  password: "password",
)

file = URI.open("https://thispersondoesnotexist.com/")
user1.image.attach(io: file, filename: "avatar1.jpeg", content_type: "image/jpeg")
user1.save

user2 = User.create!(
  username: "filmbuff",
  email: "user2@email.com",
  password: "password",
)

file = URI.open("https://thispersondoesnotexist.com/")
user2.image.attach(io: file, filename: "avatar2.jpeg", content_type: "image/jpeg")
user2.save

user3 = User.create!(
  username: "avocados",
  email: "user3@email.com",
  password: "password",
)

file = URI.open("https://thispersondoesnotexist.com/")
user3.image.attach(io: file, filename: "avatar3.jpeg", content_type: "image/jpeg")
user3.save

user4 = User.create!(
  username: "theprojector",
  email: "user4@email.com",
  password: "password",
)

file = URI.open("https://thispersondoesnotexist.com/")
user4.image.attach(io: file, filename: "avatar4.jpeg", content_type: "image/jpeg")
user4.save

user5 = User.create!(
  username: "ashscarrot",
  email: "user5@email.com",
  password: "password",
)

file = URI.open("https://thispersondoesnotexist.com/")
user5.image.attach(io: file, filename: "avatar5.jpeg", content_type: "image/jpeg")
user5.save

## FILM LIBARIES

filmlibrary1 = FilmLibrary.create!(
  title: "Priscilla",
  description: "When teenage Priscilla Beaulieu meets Elvis Presley at a party, the man who is already a meteoric rock-and-roll superstar becomes someone entirely unexpected in private moments: a thrilling crush, an ally in loneliness, a vulnerable best friend.",
  genres: ["Drama", "Romance", "Music"],
  directed_by: ["Sofia Coppola"],
  runtime: 110,
  release_date: "2023-10-27",
  tmdb_id: 1020006,
  image_url: "https://image.tmdb.org/t/p/original/kRGMnxFQodcKCDo1xK3bIAi4zfV.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/50stq3Jlny6oEgJjsXbQvbajCNw.jpg",
)

filmlibrary2 = FilmLibrary.create!(
  title: "The Taste of Things",
  description: "Set in 1889 France, Dodin Bouffant is a chef living with his personal cook and lover Eugénie. They share a long history of gastronomy and love but Eugénie refuses to marry Dodin, so the food lover decides to do something he has never done before: cook for her.",
  genres: ["Drama", "Romance"],
  directed_by: ["Tran Anh Hung"],
  runtime: 135,
  release_date: "2023-04-11",
  tmdb_id: 964960,
  image_url: "https://image.tmdb.org/t/p/original/mmMc875bREz7XXbmSDhfBqcCSBA.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/9qBCO17J7XoUFBPck1JWLBS87s2.jpg",
)

filmlibrary3 = FilmLibrary.create!(
  title: "Foe",
  description: "Henrietta and Junior farm a secluded piece of land that has been in Junior's family for generations, but their quiet life is thrown into turmoil when an uninvited stranger shows up at their door with a startling proposal. Will they risk their relationship & personal identity for a chance to survive in a new world?" ,
  genres: ["Science Fiction", "Drama"],
  directed_by: ["Garth Davis"],
  runtime: 111,
  release_date: "2023-10-06",
  tmdb_id: 760245,
  image_url: "https://image.tmdb.org/t/p/original/eTPBizhkX6B9NgzPzkhVIOvwXxZ.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/cUhNEu8Z4KEIK0fywzlpVz08LTT.jpg",
)

filmlibrary4 = FilmLibrary.create!(
  title: "Dream Scenario",
  description: "Hapless family man Paul Matthews finds his life turned upside down when millions of strangers suddenly start seeing him in their dreams. But when his nighttime appearances take a nightmarish turn, Paul is forced to navigate his newfound stardom.",
  genres: ["Comedy", "Fantasy"],
  directed_by: ["Kristoffer Borgli"],
  runtime: 102,
  release_date: "2023-11-10",
  tmdb_id: 823482,
  image_url: "https://image.tmdb.org/t/p/original/eMaAi8wTI5wON8pp33w3BDuGyZ8.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/okXIAgFc2U6jf4uZrivhwEu7vbW.jpg",
)

filmlibrary5 = FilmLibrary.create!(
  title: "Poor Things",
  description: "Brought back to life by an unorthodox scientist, a young woman runs off with a debauched lawyer on a whirlwind adventure across the continents. Free from the prejudices of her times, she grows steadfast in her purpose to stand for equality and liberation.",
  genres: ["Science Fiction", "Romance", "Comedy"],
  directed_by: ["Yorgos Lanthimos"],
  runtime: 142,
  release_date: "2023-12-07",
  tmdb_id: 792307,
  image_url: "https://image.tmdb.org/t/p/original/kCGlIMHnOm8JPXq3rXM6c5wMxcT.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/bQS43HSLZzMjZkcHJz4fGc7fNdz.jpg",
)

filmlibrary6 = FilmLibrary.create!(
  title: "Anatomy of a Fall",
  description: "A woman is suspected of her husband's murder, and their blind son faces a moral dilemma as the sole witness.",
  genres: ["Thriller", "Mystery", "Crime"],
  directed_by: ["Justine Triet"],
  runtime: 152,
  release_date: "2023-08-23",
  tmdb_id: 915935,
  image_url: "https://image.tmdb.org/t/p/original/kQs6keheMwCxJxrzV83VUwFtHkB.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/fGe1ej335XbqN1j9teoDpofpbLX.jpg",
)

filmlibrary7 = FilmLibrary.create!(
  title: "The Holdovers",
  description: "A curmudgeonly instructor at a New England prep school is forced to remain on campus during Christmas break to babysit the handful of students with nowhere to go. Eventually, he forms an unlikely bond with one of them — a damaged, brainy troublemaker — and with the school’s head cook, who has just lost a son in Vietnam.",
  genres: ["Comedy", "Drama"],
  directed_by: ["Alexander Payne"],
  runtime: 133,
  release_date: "2023-10-27",
  tmdb_id: 840430,
  image_url: "https://image.tmdb.org/t/p/original/VHSzNBTwxV8vh7wylo7O9CLdac.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/A99WMiz0ASpH9coOFrxSEuwTWx0.jpg",
)

filmlibrary8 = FilmLibrary.create!(
  title: "Call Me by Your Name",
  description: "In 1980s Italy, a relationship begins between seventeen-year-old teenage Elio and the older adult man hired as his father's research assistant.",
  genres: ["Romance", "Drama"],
  directed_by: ["Luca Guadagnino"],
  runtime: 132,
  release_date: "2017-09-01",
  tmdb_id: 398818,
  image_url: "https://image.tmdb.org/t/p/original/mZ4gBdfkhP9tvLH1DO4m4HYtiyi.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/zvOJawrnmgK0sL293mOXOdLvTXQ.jpg",
)

filmlibrary9 = FilmLibrary.create!(
  title: "Saltburn",
  description: "Struggling to find his place at Oxford University, student Oliver Quick finds himself drawn into the world of the charming and aristocratic Felix Catton, who invites him to Saltburn, his eccentric family's sprawling estate, for a summer never to be forgotten.",
  genres: ["Drama", "Comedy", "Thriller"],
  directed_by: ["Emerald Fennell"],
  runtime: 131,
  release_date: "2023-11-16",
  tmdb_id: 930564,
  image_url: "https://image.tmdb.org/t/p/original/qjhahNLSZ705B5JP92YMEYPocPz.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/nM0wz41xkEoVbRiEZLBAMaR9WfI.jpg",
)

filmlibrary10 = FilmLibrary.create!(
  title: "All of Us Strangers",
  description: "One night in his near-empty tower block in contemporary London, Adam has a chance encounter with a mysterious neighbor Harry, which punctures the rhythm of his everyday life. As a relationship develops between them, Adam is preoccupied with memories of the past and finds himself drawn back to the suburban town where he grew up, and the childhood home where his parents appear to be living, just as they were on the day they died, 30 years before.",
  genres: ["Romance", "Drama","Fantasy"],
  directed_by: ["Andrew Haigh"],
  runtime: 106,
  release_date: "2023-12-22",
  tmdb_id: 994108,
  image_url: "https://image.tmdb.org/t/p/original/aviJMFZSnnCAsCVyJGaPNx4Ef3i.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/upEAmqEaMAv85RTCKizqpAo4DOB.jpg",
)

filmlibrary11 = FilmLibrary.create!(
  title: "Spider-Man: Into the Spider-Verse",
  description: "Struggling to find his place in the world while juggling school and family, Brooklyn teenager Miles Morales is unexpectedly bitten by a radioactive spider and develops unfathomable powers just like the one and only Spider-Man. While wrestling with the implications of his new abilities, Miles discovers a super collider created by the madman Wilson \"Kingpin\" Fisk, causing others from across the Spider-Verse to be inadvertently transported to his dimension.",
  genres: ["Animation", "Action", "Adventure", "Science Fiction"],
  directed_by: ["Peter Ramsey", "Rodney Rothman", "Bob Persichetti"],
  runtime: 117,
  release_date: "2018-12-06",
  tmdb_id: 324857,
  image_url: "https://image.tmdb.org/t/p/original/iiZZdoQBEYBv6id8su7ImL0oCbD.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/hlCq6Qh9GVtuNcGZF4mQYluaZix.jpg",
)

filmlibrary12 = FilmLibrary.create!(
  title: "Spider-Man: Across the Spider-Verse",
  description: "After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.",
  genres: ["Animation", "Action", "Adventure", "Science Fiction"],
  directed_by: ["Peter Ramsey", "Rodney Rothman", "Bob Persichetti"],
  runtime: 140,
  release_date: "2023-05-31",
  tmdb_id: 569094,
  image_url: "https://image.tmdb.org/t/p/original/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/kGWpZewzInbzTuaIHcy0bFgzXuM.jpg",
)

filmlibrary13 = FilmLibrary.create!(
  title: "Manchester by the Sea",
  description: "After his older brother passes away, Lee Chandler is forced to return home to care for his 16-year-old nephew. There he is compelled to deal with a tragic past that separated him from his family and the community where he was born and raised.",
  genres: ["Drama"],
  directed_by: ["Kenneth Lonergan"],
  runtime: 138,
  release_date: "2016-11-18",
  tmdb_id: 334541,
  image_url: "https://image.tmdb.org/t/p/original/e8daDzP0vFOnGyKmve95Yv0D0io.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/wj2nLa0vfS0SLu2vJ6ABTRhMrok.jpg",
)

filmlibrary14 = FilmLibrary.create!(
  title: "Minari",
  description: "A Korean American family moves to an Arkansas farm in search of its own American dream. Amidst the challenges of this new life in the strange and rugged Ozarks, they discover the undeniable resilience of family and what really makes a home.",
  genres: ["Drama"],
  directed_by: ["Lee Isaac Chung"],
  runtime: 115,
  release_date: "2021-02-12",
  tmdb_id: 615643,
  image_url: "https://image.tmdb.org/t/p/original/6mPNdmjdbVKPITv3LLCmQoKs9Zw.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/cpDoykGqISrjXb4SG1L18OkmWAf.jpg",
)

filmlibrary15 = FilmLibrary.create!(
  title: "Dune",
  description: "Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity's greatest potential-only those who can conquer their fear will survive.",
  genres: ["Science Fiction", "Adventure"],
  directed_by: ["Denis Villeneuve"],
  runtime: 155,
  release_date: "2021-09-15",
  tmdb_id: 438631,
  image_url: "https://image.tmdb.org/t/p/original/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/lzWHmYdfeFiMIY4JaMmtR7GEli3.jpg",
)

filmlibrary16 = FilmLibrary.create!(
  title: "Dune: Part Two",
  description: "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.",
  genres: ["Science Fiction", "Adventure"],
  directed_by: ["Denis Villeneuve"],
  runtime: 167,
  release_date: "2024-02-27",
  tmdb_id: 693134,
  image_url: "https://image.tmdb.org/t/p/original/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg",
)

filmlibrary17 = FilmLibrary.create!(
  title: "God's Own Country",
  description: "A young farmer in rural Yorkshire numbs his daily frustrations with binge drinking and casual sex, until the arrival of a Romanian migrant worker.",
  genres: ["Romance", "Drama"],
  directed_by: ["Francis Lee"],
  runtime: 105,
  release_date: "2017-08-31",
  tmdb_id: 428493,
  image_url: "https://image.tmdb.org/t/p/original/uKShYyGsleXAZ6e6gK5jF6Wa2tW.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/R2cpJHKCY0kQaaBV29tM8QVJ8B.jpg",
)

filmlibrary18 = FilmLibrary.create!(
  title: "The Hunger Games: The Ballad of Songbirds & Snakes",
  description: "64 years before he becomes the tyrannical president of Panem, Coriolanus Snow sees a chance for a change in fortunes when he mentors Lucy Gray Baird, the female tribute from District 12.",
  genres: ["Drama", "Science Fiction", "Action"],
  directed_by: ["Francis Lawrence"],
  runtime: 157,
  release_date: "2023-11-15",
  tmdb_id: 695721,
  image_url: "https://image.tmdb.org/t/p/original/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/8GnWDLn2AhnmkQ7hlQ9NJUYobSS.jpg",
)

filmlibrary19 = FilmLibrary.create!(
  title: "Passages",
  description: "Tomas and Martin are a gay couple living in Paris whose marriage is thrown into crisis when Tomas impulsively begins a passionate affair with young schoolteacher Agathe. But when Martin begins an affair of his own, Tomas must confront life decisions he may be unprepared—or unwilling—to deal with.",
  genres: ["Romance", "Drama"],
  directed_by: ["Ira Sachs"],
  runtime: 92,
  release_date: "2023-06-28",
  tmdb_id: 898673,
  image_url: "https://image.tmdb.org/t/p/original/2CjewFRFMcpGh0XFLCCkJTGpP9Z.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/2178xLOOzDzyAPMI7qpDU5W3Hya.jpg",
)

filmlibrary20 = FilmLibrary.create!(
  title: "Close",
  description: "Thirteen-year-olds Léo and Rémi have always been close, but they drift apart after the intimacy of their relationship is questioned by schoolmates.",
  genres: ["Drama"],
  directed_by: ["Lukas Dhont"],
  runtime: 104,
  release_date: "2022-11-01",
  tmdb_id: 901563,
  image_url: "https://image.tmdb.org/t/p/original/hjoSRso1ZslGWHowrVtBIfNT56b.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/doZEE6CiLM8Q1hu4Hqoxr4Pf2JA.jpg",
)

filmlibrary21 = FilmLibrary.create!(
  title: "Little Women",
  description: "Four sisters come of age in America in the aftermath of the Civil War.",
  genres: ["Drama","Romance"],
  directed_by: ["Greta Gerwig"],
  runtime: 135,
  release_date: "2019-12-25",
  tmdb_id: 331482,
  image_url: "https://image.tmdb.org/t/p/original/yn5ihODtZ7ofn8pDYfxCmxh8AXI.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/lqxxwTRk0l7CubY6JkJdhnwJEkn.jpg",
)

filmlibrary22 = FilmLibrary.create!(
  title: "The French Dispatch",
  description: "The staff of an American magazine based in France puts out its last issue, with stories featuring an artist sentenced to life imprisonment, student riots, and a kidnapping resolved by a chef.",
  genres: ["Drama", "Comedy"],
  directed_by: ["Wes Anderson"],
  runtime: 108,
  release_date: "2021-10-21",
  tmdb_id: 542178,
  image_url: "https://image.tmdb.org/t/p/original/6JXR3KJH5roiBCjWFt09xfgxHZc.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/4XKqxgjRJs3YtH5j1Eli5y6gtno.jpg",
)

filmlibrary23 = FilmLibrary.create!(
  title: "The Grand Budapest Hotel",
  description: "The Grand Budapest Hotel tells of a legendary concierge at a famous European hotel between the wars and his friendship with a young employee who becomes his trusted protégé. The story involves the theft and recovery of a priceless Renaissance painting, the battle for an enormous family fortune and the slow and then sudden upheavals that transformed Europe during the first half of the 20th century.",
  genres: ["Comedy", "Drama"],
  directed_by: ["Wes Anderson"],
  runtime: 100,
  release_date: "2014-02-26",
  tmdb_id: 120467,
  image_url: "https://image.tmdb.org/t/p/original/eWdyYQreja6JGCzqHWXpWHDrrPo.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/5vPW6MPAyCFd84FEQQgtPDmVDPQ.jpg",
)

filmlibrary24 = FilmLibrary.create!(
  title: "Past Lives",
  description: "Nora and Hae Sung, two childhood friends, are reunited in New York for one fateful week as they confront notions of destiny, love, and the choices that make a life.",
  genres: ["Drama", "Romance"],
  directed_by: ["Celine Song"],
  runtime: 106,
  release_date: "2023-06-02",
  tmdb_id: 666277,
  image_url: "https://image.tmdb.org/t/p/original/k3waqVXSnvCZWfJYNtdamTgTtTA.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/rron9HAuS9s7zBF8iCX1tsafxUo.jpg",
)

filmlibrary25 = FilmLibrary.create!(
  title: "Oppenheimer",
  description: "The story of J. Robert Oppenheimer's role in the development of the atomic bomb during World War II.",
  genres: ["Drama", "History"],
  directed_by: ["Christopher Nolan"],
  runtime: 181,
  release_date: "2023-07-19",
  tmdb_id: 872585,
  image_url: "https://image.tmdb.org/t/p/original/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/nb3xI8XI3w4pMVZ38VijbsyBqP4.jpg",
)

filmlibrary26 = FilmLibrary.create!(
  title: "Barbie",
  description: "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.",
  genres: ["Comedy", "Adventure"],
  directed_by: ["Greta Gerwig"],
  runtime: 114,
  release_date: "2023-07-19",
  tmdb_id: 346698,
  image_url: "https://image.tmdb.org/t/p/original/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/tTfnd2VrlaZJSBD9HUbtSF3CqPJ.jpg",
)

filmlibrary27 = FilmLibrary.create!(
  title: "Triangle of Sadness",
  description: "A celebrity model couple are invited on a luxury cruise for the uber-rich, helmed by an unhinged, alcoholic captain. What first appears Instagrammable ends catastrophically, leaving the survivors stranded on a desert island in a struggle of hierarchy.",
  genres: ["Comedy", "Drama"],
  directed_by: ["Ruben Östlund"],
  runtime: 147,
  release_date: "2022-09-18",
  tmdb_id: 497828,
  image_url: "https://image.tmdb.org/t/p/original/k9eLozCgCed5FGTSdHu0bBElAV8.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/s9c1FjUgw5jHxzW55fbQDUy92Di.jpg",
)

filmlibrary28 = FilmLibrary.create!(
  title: "Civil War",
  description: "In the near future, a group of war journalists attempt to survive while reporting the truth as the United States stands on the brink of civil war.",
  genres: ["Action", "War",  "Science Ficton"],
  directed_by: ["Alex Garland"],
  runtime: 109,
  release_date: "2024-04-10",
  tmdb_id: 929590,
  image_url: "https://image.tmdb.org/t/p/original/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/uv2twFGMk2qBdyJBJAVcrpRtSa9.jpg",
)

filmlibrary29 = FilmLibrary.create!(
  title: "The Zone of Interest",
  description: "The commandant of Auschwitz, Rudolf Höss, and his wife Hedwig, strive to build a dream life for their family in a house and garden next to the camp.",
  genres: ["History", "Drama", "War"],
  directed_by: ["Jonathan Glazer"],
  runtime: 105,
  release_date: "2023-12-15",
  tmdb_id: 467244,
  image_url: "https://image.tmdb.org/t/p/original/hUu9zyZmDd8VZegKi1iK1Vk0RYS.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/aPQsU3yLDUOhLJYnSqkhKRkQTAw.jpg",
)

filmlibrary30 = FilmLibrary.create!(
  title: "Joker",
  description: "During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.",
  genres: ["Crime", "Thriller", "Drama"],
  directed_by: ["Todd Phillips"],
  runtime: 122,
  release_date: "2019-10-01",
  tmdb_id: 475557,
  image_url: "https://image.tmdb.org/t/p/original/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/f5F4cRhQdUbyVbB5lTNCwUzD6BP.jpg",
)

filmlibrary31 = FilmLibrary.create!(
  title: "Joker: Folie à Deux",
  description: "A sequel to the 2019 film Joker.",
  genres: ["Crime", "Thriller", "Drama"],
  directed_by: ["Todd Phillips"],
  runtime: 0,
  release_date: "2024-10-02",
  tmdb_id: 889737,
  image_url: "https://image.tmdb.org/t/p/original/aciP8Km0waTLXEYf5ybFK5CSUxl.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/mraxhuBdLzK4Ai46fwr7erji4je.jpg",
)

filmlibrary32 = FilmLibrary.create!(
  title: "The Devil Wears Prada",
  description: "Andy moves to New York to work in the fashion industry. Her boss is extremely demanding, cruel and won't let her succeed if she doesn't fit into the high class elegant look of their magazine.",
  genres: ["Drama", "Comedy"],
  directed_by: ["David Frankel"],
  runtime: 109,
  release_date: "2006-06-29",
  tmdb_id: 350,
  image_url: "https://image.tmdb.org/t/p/original/8912AsVuS7Sj915apArUFbv6F9L.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/CpLAfXgSNeNRRbRzPrTuzKmIHO.jpg",
)

filmlibrary33 = FilmLibrary.create!(
  title: "The Killing of a Sacred Deer",
  description: "Dr. Steven Murphy is a renowned cardiovascular surgeon who presides over a spotless household with his wife and two children. Lurking at the margins of his idyllic suburban existence is Martin, a fatherless teen who insinuates himself into the doctor's life in gradually unsettling ways.",
  genres: ["Drama", "Thriller", "Mystery"],
  directed_by: ["Yorgos Lanthimos"],
  runtime: 121,
  release_date: "2017-10-20",
  tmdb_id: 399057,
  image_url: "https://image.tmdb.org/t/p/original/e4DGlsc9g0h5AyoyvvAuIRnofN7.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/kJwQXgAk440l2vZOspUJee6inim.jpg",
)

filmlibrary34 = FilmLibrary.create!(
  title: "The Banshees of Inisherin",
  description: "Two lifelong friends find themselves at an impasse when one abruptly ends their relationship, with alarming consequences for both of them.",
  genres: ["Drama", "Comedy"],
  directed_by: ["Martin McDonagh"],
  runtime: 114,
  release_date: "2022-10-20",
  tmdb_id: 674324,
  image_url: "https://image.tmdb.org/t/p/original/4yFG6cSPaCaPhyJ1vtGOtMD1lgh.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/coBi63TRBW8OiMryjCQ0NV93Fjs.jpg",
)

filmlibrary35 = FilmLibrary.create!(
  title: "The Notebook",
  description: "An epic love story centered around an older man who reads aloud to a woman with Alzheimer's. From a faded notebook, the old man's words bring to life the story about a couple who is separated by World War II, and is then passionately reunited, seven years later, after they have taken different paths.",
  genres: ["Romance", "Drama"],
  directed_by: ["Nick Cassavetes"],
  runtime: 123,
  release_date: "2004-06-25",
  tmdb_id: 11036,
  image_url: "https://image.tmdb.org/t/p/original/rNzQyW4f8B8cQeg7Dgj3n6eT5k9.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/qom1SZSENdmHFNZBXbtJAU0WTlC.jpg",
)

filmlibrary36 = FilmLibrary.create!(
  title: "Crazy Stupid Love",
  description: "Cal Weaver is living the American dream. He has a good job, a beautiful house, great children and a beautiful wife, named Emily. Cal's seemingly perfect life unravels, however, when he learns that Emily has been unfaithful and wants a divorce. Over 40 and suddenly single, Cal is adrift in the fickle world of dating. Enter, Jacob Palmer, a self-styled player who takes Cal under his wing and teaches him how to be a hit with the ladies.",
  genres: ["Drama", "Romance", "Comedy"],
  directed_by: ["John Requa", "Glenn Ficarra"],
  runtime: 118,
  release_date: "2011-07-29",
  tmdb_id: 50646,
  image_url: "https://image.tmdb.org/t/p/original/p4RafgAPk558muOjnBMHhMArjS2.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/9J8dyrMfr0oK9awMjufLDY5L8v0.jpg",
)

filmlibrary37 = FilmLibrary.create!(
  title: "Brokeback Mountain",
  description: "Rodeo cowboy Jack and ranch hand Ennis are hired as sheepherders in 1963 Wyoming. One night on Brokeback Mountain, they spark a physical relationship. Though Ennis marries his longtime sweetheart and Jack marries a fellow rodeo rider, they keep up their tortured, sporadic love affair for 20 years.",
  genres: ["Drama", "Romance"],
  directed_by: ["Ang Lee"],
  runtime: 134,
  release_date: "2005-09-10",
  tmdb_id: 142,
  image_url: "https://image.tmdb.org/t/p/original/5UZ283LuT8ClE4Iqw3u4gGZizab.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/vArZOJCRavxiKqdXPn74VdQwn7d.jpg",
)

filmlibrary38 = FilmLibrary.create!(
  title: "Legally Blonde",
  description: "Elle Woods, a fashionable sorority queen, is dumped by her boyfriend. She decides to follow him to law school, but while there, she figures out that there is more to herself than just looks.",
  genres: ["Romance", "Comedy"],
  directed_by: ["Robert Luketic"],
  runtime: 96,
  release_date: "2001-07-13",
  tmdb_id: 8835,
  image_url: "https://image.tmdb.org/t/p/original/4ABNnmkVpzplrEVQWt1piITT0Ey.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/udQe3ULuZr82E2Pvqpl9CrGt6Fy.jpg",
)

filmlibrary39 = FilmLibrary.create!(
  title: "Titanic",
  description: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later. A young Rose boards the ship with her mother and fiancé. Meanwhile, Jack Dawson and Fabrizio De Rossi win third-class tickets aboard the ship. Rose tells the whole story from Titanic's departure through to its death—on its first and last voyage—on April 15, 1912.",
  genres: ["Drama", "Romance"],
  directed_by: ["James Cameron"],
  runtime: 194,
  release_date: "1997-11-18",
  tmdb_id: 597,
  image_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/sDH1LkdFOkQmTJaF1sIIniQyFOk.jpg",
)

filmlibrary40 = FilmLibrary.create!(
  title: "Star Wars: Episode III - Revenge of the Sith",
  description: "The evil Darth Sidious enacts his final plan for unlimited power -- and the heroic Jedi Anakin Skywalker must choose a side.",
  genres: ["Science Fiction", "Action", "Adventure"],
  directed_by: ["George Lucas"],
  runtime: 140,
  release_date: "2005-05-17",
  tmdb_id: 1895,
  image_url: "https://image.tmdb.org/t/p/original/xfSAoBEm9MNBjmlNcDYLvLSMlnq.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/5vDuLrjJXFS9PTF7Q1xzobmYKR9.jpg",
)

filmlibrary41 = FilmLibrary.create!(
  title: "Challengers",
  description: "Tennis player turned coach Tashi has taken her husband, Art, and transformed him into a world-famous Grand Slam champion. To jolt him out of his recent losing streak, she signs him up for a \"Challenger\" event — close to the lowest level of pro tournament — where he finds himself standing across the net from his former best friend and Tashi's former boyfriend.",
  genres: ["Drama", "Romance"],
  directed_by: ["Luca Guadagnino"],
  runtime: 132,
  release_date: "2024-04-18",
  tmdb_id: 937287,
  image_url: "https://image.tmdb.org/t/p/original/H6vke7zGiuLsz4v4RPeReb9rsv.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/4CcUgdiGe83MeqJW1NyJVmZqRrF.jpg",
)

filmlibrary42 = FilmLibrary.create!(
  title: "The Fall Guy",
  description: "Fresh off an almost career-ending accident, stuntman Colt Seavers has to track down a missing movie star, solve a conspiracy and try to win back the love of his life while still doing his day job.",
  genres: ["Action", "Comedy", "Adventure"],
  directed_by: ["David Leitch"],
  runtime: 126,
  release_date: "2024-04-24",
  tmdb_id: 746036,
  image_url: "https://image.tmdb.org/t/p/original/vrIcYxZ8288udqTAmui2LL8K0VN.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/H5HjE7Xb9N09rbWn1zBfxgI8uz.jpg",
)

filmlibrary43 = FilmLibrary.create!(
  title: "Carol",
  description: "In 1950s New York, a department-store clerk who dreams of a better life falls for an older, married woman.",
  genres: ["Romance", "Drama"],
  directed_by: ["Todd Haynes"],
  runtime: 118,
  release_date: "2015-11-20",
  tmdb_id: 258480,
  image_url: "https://image.tmdb.org/t/p/original/cJeled7EyPdur6TnCA5GYg0UVna.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/o0ghC4XMIMdbRBXIqSvnPrxwj3W.jpg",
)

filmlibrary44 = FilmLibrary.create!(
  title: "Interstellar",
  description: "The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.",
  genres: ["Adventure", "Drama", "Science Fiction"],
  directed_by: ["Christopher Nolan"],
  runtime: 169,
  release_date: "2014-11-05",
  tmdb_id: 157336,
  image_url: "https://image.tmdb.org/t/p/original/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/xJHokMbljvjADYdit5fK5VQsXEG.jpg",
)

filmlibrary45 = FilmLibrary.create!(
  title: "A Cinderella Story",
  description: "Routinely exploited by her wicked stepmother, the downtrodden Samantha Montgomery is excited about the prospect of meeting her Internet beau at the school's Halloween dance.",
  genres: ["Comedy", "Family", "Romance"],
  directed_by: ["Mark Rosman"],
  runtime: 95,
  release_date: "2004-07-16",
  tmdb_id: 11247,
  image_url: "https://image.tmdb.org/t/p/original/3d6Nu5c7BSo5BrH2xE1pnj3yNrc.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/zeOYeDRR9iSmjMeyVKGT8FmVldH.jpg",
)

filmlibrary46 = FilmLibrary.create!(
  title: "Top Gun: Maverick",
  description: "After more than thirty years of service as one of the Navy’s top aviators, and dodging the advancement in rank that would ground him, Pete “Maverick” Mitchell finds himself training a detachment of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen.",
  genres: ["Action", "Drama"],
  directed_by: ["Joseph Kosinski"],
  runtime: 131,
  release_date: "2022-05-24",
  tmdb_id: 361743,
  image_url: "https://image.tmdb.org/t/p/original/62HCnUTziyWcpDaBO2i1DX17ljH.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/AaV1YIdWKnjAIAOe8UUKBFm327v.jpg",
)

filmlibrary47 = FilmLibrary.create!(
  title: "The Holiday",
  description: "Two women, one from the United States and one from the United Kingdom, swap homes at Christmas time after bad breakups with their boyfriends. Each woman finds romance with a local man but realizes that the imminent return home may end the relationship.",
  genres: ["Comedy", "Romance"],
  directed_by: ["Nancy Meyers"],
  runtime: 136,
  release_date: "2006-12-08",
  tmdb_id: 1581,
  image_url: "https://image.tmdb.org/t/p/original/6fbqG49Q7IWBWdyJ7asNTcNbnG6.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/9Ebn8atCcGk5OZrx4xmoTobAxoh.jpg",
)

filmlibrary48 = FilmLibrary.create!(
  title: "My Policeman",
  description: "In the late 1990s, the arrival of elderly invalid Patrick into Marion and Tom’s home triggers the exploration of seismic events from 40 years previous: the passionate relationship between Tom and Patrick at a time when homosexuality was illegal.",
  genres: ["Drama", "Romance"],
  directed_by: ["Michael Grandage"],
  runtime: 113,
  release_date: "2022-10-20",
  tmdb_id: 744114,
  image_url: "https://image.tmdb.org/t/p/original/wdbiMjXd4CxPfCx4r4Jfy8cGec0.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/s5MLcxbdFqvIzTLNLU5yQFFYALR.jpg",
)

filmlibrary49 = FilmLibrary.create!(
  title: "Black Swan",
  description: "A journey through the psyche of a young ballerina whose starring role as the duplicitous swan queen turns out to be a part for which she becomes frighteningly perfect.",
  genres: ["Drama", "Thriller", "Horror"],
  directed_by: ["Darren Aronofsky"],
  runtime: 108,
  release_date: "2010-12-03",
  tmdb_id: 44214,
  image_url: "https://image.tmdb.org/t/p/original/rH19vkjAzCZ0HIUvrgB3rowm68h.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/hqh5O4KssfJWI62HGAgrjHXbxhD.jpg",
)

filmlibrary50 = FilmLibrary.create!(
  title: "Le otto montagne",
  description: "An epic journey of friendship and self-discovery set in the breathtaking Italian Alps, The Eight Mountains follows over four decades the profound, complex relationship between Pietro and Bruno.",
  genres: ["Drama"],
  directed_by: ["Felix van Groeningen", "Charlotte Vandermeersch"],
  runtime: 147,
  release_date: "2022-12-21",
  tmdb_id: 803700,
  image_url: "https://image.tmdb.org/t/p/original/ohD87uTlwOgNuUEYaW82ew9Eds7.jpg",
  backdrop_url: "https://image.tmdb.org/t/p/original/hag9edxgL2RgG9FMfqAV0KgjPK0.jpg",
)

## FILMS

film1 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user1,
  film_library: filmlibrary1,
)

film2 = Film.create!(
  watchlist: true,
  user: user1,
  film_library: filmlibrary5,
)

film3 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user1,
  film_library: filmlibrary7,
)

film4 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user1,
  film_library: filmlibrary8,
)

film5 = Film.create!(
  watchlist: true,
  user: user1,
  film_library: filmlibrary11,
)

film6 = Film.create!(
  watchlist: true,
  user: user1,
  film_library: filmlibrary12,
)

film7 = Film.create!(
  watched: true,
  rating: 4,
  user: user1,
  film_library: filmlibrary15,
)

film8 = Film.create!(
  watchlist: true,
  user: user1,
  film_library: filmlibrary16,
)

film9 = Film.create!(
  watched: true,
  rating: 3,
  user: user1,
  film_library: filmlibrary18,
)

film10 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user1,
  film_library: filmlibrary21,
)

film11 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user1,
  film_library: filmlibrary25,
)

film12 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user1,
  film_library: filmlibrary26,
)

film13 = Film.create!(
  watchlist: true,
  user: user1,
  film_library: filmlibrary31,
)

film14 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user1,
  film_library: filmlibrary32,
  )

film15 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user1,
  film_library: filmlibrary36,
  )

film16 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user2,
  film_library: filmlibrary9,
)

film17 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user2,
  film_library: filmlibrary10,
)

film18 = Film.create!(
  watchlist: true,
  user: user2,
  film_library: filmlibrary24,
)

film19 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user2,
  film_library: filmlibrary25,
)

film20 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user2,
  film_library: filmlibrary26,
)

film21 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user2,
  film_library: filmlibrary35,
)

film22 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user2,
  film_library: filmlibrary36,
)

film23 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user2,
  film_library: filmlibrary37,
)

film24 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user2,
  film_library: filmlibrary38,
)

film25 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user2,
  film_library: filmlibrary39,
)

film26 = Film.create!(
  watchlist: true,
  user: user2,
  film_library: filmlibrary41,
)

film27 = Film.create!(
  watchlist: true,
  user: user2,
  film_library: filmlibrary42,
)

film28 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user2,
  film_library: filmlibrary46,
)

film29 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user2,
  film_library: filmlibrary47,
)

film30 = Film.create!(
  watchlist: true,
  user: user2,
  film_library: filmlibrary50,
)

film31 = Film.create!(
  watchlist: true,
  user: user3,
  film_library: filmlibrary2,
)

film32 = Film.create!(
  like: true,
  watched: true,
  rating: 3,
  user: user3,
  film_library: filmlibrary3,
)

film33 = Film.create!(
  like: true,
  watched: true,
  rating: 3,
  user: user3,
  film_library: filmlibrary4,
)

film34 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user3,
  film_library: filmlibrary6,
)

film35 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user3,
  film_library: filmlibrary13,
)

film36 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user3,
  film_library: filmlibrary14,
)

film37 = Film.create!(
  watchlist: true,
  user: user3,
  film_library: filmlibrary17,
)

film38 = Film.create!(
  watchlist: true,
  user: user3,
  film_library: filmlibrary19,
)

film39 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user3,
  film_library: filmlibrary20,
)

film40 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user3,
  film_library: filmlibrary25,
)

film41 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user3,
  film_library: filmlibrary26,
)

film42 = Film.create!(
  watchlist: true,
  user: user3,
  film_library: filmlibrary28,
)

film43 = Film.create!(
  watchlist: true,
  user: user3,
  film_library: filmlibrary29,
)

film44 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user3,
  film_library: filmlibrary30,
)

film45 = Film.create!(
  watchlist: true,
  user: user3,
  film_library: filmlibrary31,
)

film46 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user4,
  film_library: filmlibrary8,
)

film47 = Film.create!(
  like: true,
  watched: true,
  rating: 3,
  user: user4,
  film_library: filmlibrary9,
)

film48 = Film.create!(
  like: true,
  watched: true,
  watchlist: 4,
  user: user4,
  film_library: filmlibrary18,
)

film49 = Film.create!(
  watchlist: true,
  user: user4,
  film_library: filmlibrary22,
)

film50 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user4,
  film_library: filmlibrary23,
)

film51 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user4,
  film_library: filmlibrary24,
)

film52 = Film.create!(
  like: true,
  watched: true,
  rating: 3,
  user: user4,
  film_library: filmlibrary25,
)

film53 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user4,
  film_library: filmlibrary26,
)

film54 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user4,
  film_library: filmlibrary27,
)

film55 = Film.create!(
  watchlist: true,
  user: user4,
  film_library: filmlibrary28,
)

film56 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user4,
  film_library: filmlibrary40,
)

film57 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user4,
  film_library: filmlibrary43,
)

film58 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user4,
  film_library: filmlibrary44,
)

film59 = Film.create!(
  like: true,
  watched: true,
  rating: 3,
  user: user4,
  film_library: filmlibrary45,
)

film60 = Film.create!(
  like: true,
  watched: true,
  rating: 3,
  user: user4,
  film_library: filmlibrary48,
)

film61 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user5,
  film_library: filmlibrary1,
)

film62 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user5,
  film_library: filmlibrary5,
)

film63 = Film.create!(
  watchlist: true,
  user: user5,
  film_library: filmlibrary8,
)

film64 = Film.create!(
  watchlist: true,
  user: user5,
  film_library: filmlibrary9,
)

film65 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user5,
  film_library: filmlibrary11,
)

film66 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user5,
  film_library: filmlibrary12,
)

film67 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user5,
  film_library: filmlibrary15,
)

film68 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user5,
  film_library: filmlibrary16,
)

film69 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user5,
  film_library: filmlibrary27,
)

film70 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user5,
  film_library: filmlibrary30,
)

film71 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user5,
  film_library: filmlibrary33,
)

film72 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user5,
  film_library: filmlibrary34,
)

film73 = Film.create!(
  like: true,
  watched: true,
  rating: 5,
  user: user5,
  film_library: filmlibrary35,
)

film74 = Film.create!(
  watchlist: true,
  user: user5,
  film_library: filmlibrary41,
)

film75 = Film.create!(
  like: true,
  watched: true,
  rating: 4,
  user: user5,
  film_library: filmlibrary49,
)

## LISTS

list1 = List.create!(
  name: "just a girl, in this big big world",
  description: "we run the world, us girls",
  user: user1
)

list2 = List.create!(
  name: "visually insane",
  user: user1
)

list3 = List.create!(
  name: "It's all about love. Sweet or tragic.",
  user: user2
)

list4 = List.create!(
  name: "Arthouse films I hold close to my heart",
  description: "Sit back, and let it wash over you",
  user: user3
)

list5 = List.create!(
  name: "Quintessential Queer Cinema",
  user: user4
)

list6 = List.create!(
  name: "A whole other world!!!",
  description: "All things science fiction and fantasy. ",
  user: user4
)

list7 = List.create!(
  name: "Oscar Favs",
  user: user5
)

list8 = List.create!(
  name: "Barry baby",
  user: user5
)

## FILM LISTS

filmlist1 = FilmList.create!(
  film: film2,
  list: list1,
)

filmlist2 = FilmList.create!(
  film: film10,
  list: list1,
)

filmlist3 = FilmList.create!(
  notes: "An ensemble cast like no other! <3",
  film: film12,
  list: list1,
)

filmlist4 = FilmList.create!(
  notes: "A true classic that never gets old",
  film: film14,
  list: list1,
)

filmlist5 = FilmList.create!(
  film: film2,
  list: list2,
)

filmlist6 = FilmList.create!(
  film: film5,
  list: list2,
)

filmlist7 = FilmList.create!(
  film: film6,
  list: list2,
)

filmlist8 = FilmList.create!(
  film: film7,
  list: list2,
)

filmlist9 = FilmList.create!(
  film: film8,
  list: list2,
)

filmlist10 = FilmList.create!(
  film: film11,
  list: list2,
)

filmlist11 = FilmList.create!(
  notes: "The chemistry between these two is absolutely bonkers!!",
  film: film17,
  list: list3,
)

filmlist12 = FilmList.create!(
  film: film18,
  list: list3,
)

filmlist13 = FilmList.create!(
  notes: "I've never not cried watching this. It just breaks my heart.",
  film: film21,
  list: list3,
)

filmlist14 = FilmList.create!(
  film: film22,
  list: list3,
)

filmlist15 = FilmList.create!(
  film: film23,
  list: list3,
)

filmlist16 = FilmList.create!(
  film: film25,
  list: list3,
)

filmlist17 = FilmList.create!(
  notes: "Everyone needs a Graham in their lives.",
  film: film29,
  list: list3,
)

filmlist18 = FilmList.create!(
  film: film31,
  list: list4,
)

filmlist19 = FilmList.create!(
  film: film33,
  list: list4,
)

filmlist20 = FilmList.create!(
  film: film34,
  list: list4,
)

filmlist21 = FilmList.create!(
  film: film35,
  list: list4,
)

filmlist22 = FilmList.create!(
  film: film36,
  list: list4,
)

filmlist23 = FilmList.create!(
  film: film37,
  list: list4,
)

filmlist24 = FilmList.create!(
  film: film38,
  list: list4,
)

filmlist25 = FilmList.create!(
  film: film39,
  list: list4,
)

filmlist26 = FilmList.create!(
  film: film46,
  list: list5,
)

filmlist27 = FilmList.create!(
  film: film47,
  list: list5,
)

filmlist28 = FilmList.create!(
  film: film57,
  list: list5,
)

filmlist29 = FilmList.create!(
  film: film60,
  list: list5,
)

filmlist30 = FilmList.create!(
  notes: "Snow has my heart. Very troubling.",
  film: film48,
  list: list6,
)

filmlist31 = FilmList.create!(
  notes: "Anakin, oh Anakin!!!",
  film: film56,
  list: list6,
)

filmlist32 = FilmList.create!(
  film: film62,
  list: list7,
)

filmlist33 = FilmList.create!(
  film: film63,
  list: list7,
)

filmlist34 = FilmList.create!(
  film: film65,
  list: list7,
)

filmlist35 = FilmList.create!(
  film: film66,
  list: list7,
)

filmlist36 = FilmList.create!(
  film: film69,
  list: list7,
)

filmlist37 = FilmList.create!(
  film: film70,
  list: list7,
)

filmlist38 = FilmList.create!(
  film: film71,
  list: list7,
)

filmlist39 = FilmList.create!(
  film: film72,
  list: list7,
)

filmlist40 = FilmList.create!(
  film: film75,
  list: list7,
)

filmlist41 = FilmList.create!(
  film: film64,
  list: list8,
)

filmlist42 = FilmList.create!(
  film: film72,
  list: list8,
)

filmlist43 = FilmList.create!(
  film: film73,
  list: list8,
)

## REVIEWS

review1 = Review.create!(
  date: "2024-04-16",
  review: "every time jacob elordi stood next to a car i thought no way is he fitting in there",
  rating: 4,
  film: film1,
  user: film1.user,
  film_library: film1.film_library
)

review2 = Review.create!(
  date: "2024-04-12",
  review: "I really don't think this movie deserves the hate it's getting. The cinematography is beautiful. The acting is great. It has a fun (albeit predictable) twist. My wife and I liked it a lot.",
  rating: 3,
  film: film32,
  user: film32.user,
  film_library: film32.film_library
)

review3 = Review.create!(
  date: "2024-03-25",
  review: "everything made sense when i saw “produced by ari aster”",
  rating: 3,
  film: film33,
  user: film33.user,
  film_library: film33.film_library
)

review4 = Review.create!(
  date: "2024-04-02",
  review: "God how I missed these types of movies where they build an entire insane unrealistic city on a soundstage. Wasn't expecting the The Lobster guy to be our new Jean-Pierre Jeunet but he's doing a great job",
  rating: 4,
  film: film62,
  user: film62.user,
  film_library: film62.film_library
)

review5 = Review.create!(
  date: "2024-02-15",
  review: "Well I just saw the greatest acting performance of my life and it was not by Sandra Hüller or a child actor with the cuntiest bangs I've ever seen — it was by a dog so—",
  rating: 5,
  film: film34,
  user: film34.user,
  film_library: film34.film_library
)

review6 = Review.create!(
  date: "2023-12-30",
  review: "There's a handshake in this that feels more overwhelmingly warm and emotional than most hugs I've seen in movies",
  rating: 4,
  film: film3,
  user: film3.user,
  film_library: film3.film_library
)

review7 = Review.create!(
  date: "2021-11-06",
  review: "I remember everything. I couldn't put this film into words if I tried. I couldn't ever review this, or even explain how personal this felt to me. Every kiss, every movement, every laugh, every dance, every look, goodbye, embrace. If I could, I couldn't even begin.",
  rating: 5,
  film: film4,
  user: film4.user,
  film_library: film4.film_library
)

review8 = Review.create!(
  date: "2020-06-21",
  review: "So strange that life goes on after finishing a film like Call Me By Your Name.",
  rating: 5,
  film: film46,
  user: film46.user,
  film_library: film46.film_library
)

review9 = Review.create!(
  date: "2024-03-15",
  review: "a movie about how jacob elordi is simply so fucking hot that his mere existence is enough to make someone legally insane",
  rating: 4,
  film: film16,
  user: film16.user,
  film_library: film16.film_library
)

review10 = Review.create!(
  date: "2024-02-11",
  review: "a fine addition in the “Barry Keoghan plays some sort of fucking unhinged freak” cinematic universe",
  rating: 3,
  film: film47,
  user: film47.user,
  film_library: film47.film_library
)

review11 = Review.create!(
  date: "2024-03-02",
  review: "Although I anticipated shedding more tears, 'All of Us Strangers' captivates with its exquisite cinematography and imagery. It's a poignant film that delves into the complexities of grief and its diverse manifestations.",
  rating: 4,
  film: film17,
  user: film17.user,
  film_library: film17.film_library
)

review12 = Review.create!(
  date: "2023-01-21",
  review: "The best spider-man film. Beyond being funny, creative, and wonderfully animated, it truly has an understanding of the character of Spider-Man.",
  rating: 4,
  film: film65,
  user: film65.user,
  film_library: film65.film_library
)

review13 = Review.create!(
  date: "2023-03-16",
  review: "What an incredible treat this movie is. It's been several hours and I'm still beaming with joy. The colors, the animation, the humor, the soundtrack; everything about it was damn near perfect and I enjoyed myself to the fullest from beginning to end. The only bad thing about it is that it ended.",
  rating: 5,
  film: film66,
  user: film66.user,
  film_library: film66.film_library
)

review14 = Review.create!(
  date: "2022-08-11",
  review: "casey afflecks voice, barely above a whisper: oh, ok. me in the audience, sneezing and crying loudly: i love film",
  rating: 4,
  film: film35,
  user: film35.user,
  film_library: film35.film_library
)

review15 = Review.create!(
  date: "2021-05-18",
  review: "\"i'll take care of us\" the 2020 film version of the 🥺 emoji. this is so special",
  rating: 4,
  film: film36,
  user: film36.user,
  film_library: film36.film_library
)

review16 = Review.create!(
  date: "2021-11-01",
  review: "love love love when a blockbuster is almost all methodical worldbuilding instead of pew pew space fighting filler like yes girl give us EVERYTHING",
  rating: 4,
  film: film7,
  user: film7.user,
  film_library: film7.film_library
)

review17 = Review.create!(
  date: "2021-11-04",
  review: "They really went ALL OUT on the music video for the new Hans Zimmer album.",
  rating: 5,
  film: film67,
  user: film67.user,
  film_library: film67.film_library
)

review18 = Review.create!(
  date: "2024-03-10",
  review: "austin butler is so bald. i've never seen anyone be so bald in my life. so moisturised and bald. he was glowing more than edward in twilight. what's your megamind head skin care routine, elvis boy",
  rating: 5,
  film: film68,
  user: film68.user,
  film_library: film68.film_library
)

review19 = Review.create!(
  date: "2023-11-27",
  review: "look what happens when u give a white man gun",
  rating: 3,
  film: film9,
  user: film9.user,
  film_library: film9.film_library
)

review20 = Review.create!(
  date: "2023-05-22",
  review: "silence has rarely been this loud",
  rating: 5,
  film: film39,
  user: film39.user,
  film_library: film39.film_library
)

review21 = Review.create!(
  date: "2021-10-18",
  review: "seen this 4 times now. great is selling it short. back to business as usual in January. sending warmth and well wishes to everyone out there in the meantime.",
  rating: 4,
  film: film10,
  user: film10.user,
  film_library: film10.film_library
)

review22 = Review.create!(
  date: "2022-11-12",
  review: "Is it possible to frame an entire feature film and hang it on your wall? Have we discovered how to do this? Asking for a friend.",
  rating: 4,
  film: film50,
  user: film50.user,
  film_library: film50.film_library
)

review23 = Review.create!(
  date: "2023-08-21",
  review: "You know when a movie is directly made for you to feel ripped apart into 1 million pieces but that feeling alone makes you feel like a complete person and then you get to drive alone home and cry to Radiohead? Yeah :)",
  rating: 4,
  film: film51,
  user: film51.user,
  film_library: film51.film_library
)

review24 = Review.create!(
  date: "2023-07-25",
  review: "A ridiculous achievement in filmmaking. An absurdly immersive and heart-pounding experience. Cillian Murphy is a fucking stud and RDJ will be a front-runner for Best Supporting Actor. Ludwig Göransson put his entire nutsack into that score, coupled with a sound design that made me feel like I took a bomb to the chest.",
  rating: 5,
  film: film11,
  user: film11.user,
  film_library: film11.film_library
)

review25 = Review.create!(
  date: "2023-07-26",
  review: "watching this after i just watched barbie, call me atomic blonde",
  rating: 5,
  film: film19,
  user: film19.user,
  film_library: film19.film_library
)

review26 = Review.create!(
  date: "2023-07-28",
  review: "Cillian Murphy's face and bone structure full blown on IMAX thank you Christopher Nolan",
  rating: 5,
  film: film40,
  user: film40.user,
  film_library: film40.film_library
)

review27 = Review.create!(
  date: "2023-07-28",
  review: "Dr. Strangenheimer or: How I Learned to Start Worrying and Hate the Bomb",
  rating: 3,
  film: film52,
  user: film52.user,
  film_library: film52.film_library
)

review28 = Review.create!(
  date: "2023-07-22",
  review: "in 50 years ryan gosling’s ken performance will still be taught in acting classes",
  rating: 5,
  film: film12,
  user: film12.user,
  film_library: film12.film_library
)

review29 = Review.create!(
  date: "2023-07-24",
  review: "I thank god and all that is holy for letting me exist in the same time on earth as Ryan Gosling",
  rating: 5,
  film: film20,
  user: film20.user,
  film_library: film20.film_library
)

review30 = Review.create!(
  date: "2023-07-25",
  review: "one depression barbie and one anxiety barbie and one ocd barbie for me please",
  rating: 4,
  film: film41,
  user: film41.user,
  film_library: film41.film_library
)

review31 = Review.create!(
  date: "2023-07-26",
  review: "No actor in the history of film has understood their assignment more than Ryan Gosling does as Ken.",
  rating: 4,
  film: film53,
  user: film53.user,
  film_library: film53.film_library
)

review32 = Review.create!(
  date: "2023-09-21",
  review: "my face went from h&m to balenciaga real quick",
  rating: 4,
  film: film54,
  user: film54.user,
  film_library: film54.film_library
)

review33 = Review.create!(
  date: "2022-10-15",
  review: "Jaundiced and judicious, deeply cynical yet not quite ready to leap into the abyss, Joker is a provocatively toxic time capsule for an era of misguided rage. It's galling, and pretty great. Don't laugh.",
  rating: 4,
  film: film44,
  user: film44.user,
  film_library: film44.film_library
)

review34 = Review.create!(
  date: "2023-03-17",
  review: "yes I unironically like this movie and no I will not apologize for it",
  rating: 5,
  film: film70,
  user: film70.user,
  film_library: film70.film_library
)

review35 = Review.create!(
  date: "2024-01-03",
  review: "meryl streep was put on this earth to play miranda priestly",
  rating: 4,
  film: film14,
  user: film14.user,
  film_library: film14.film_library
)

review36 = Review.create!(
  date: "2023-09-19",
  review: "maybe the real sacred deer was the friends we made along the way",
  rating: 5,
  film: film71,
  user: film71.user,
  film_library: film71.film_library
)

review37 = Review.create!(
  date: "2023-08-04",
  review: "One of the best breakup movies in recent memory. Also one of the most brutal. Unrelenting in its portrayal of our desperation in the face of abandonment. We’ll mutilate ourselves beyond recognition if it means having things our way, leaving us with nothing but a pathetic “I told you so”. But who even is “I” at that point? Who is “you”?",
  rating: 5,
  film: film72,
  user: film72.user,
  film_library: film72.film_library
)

review38 = Review.create!(
  date: "2020-02-14",
  review: "\"i wrote you. i wrote you 365 letters.\" IM SICK",
  rating: 5,
  film: film21,
  user: film21.user,
  film_library: film21.film_library
)

review39 = Review.create!(
  date: "2022-12-01",
  review: "he made her dream house, he wrote 365 letters to her. For a whole year. they're my roman empire.",
  rating: 5,
  film: film73,
  user: film73.user,
  film_library: film73.film_library
)

review40 = Review.create!(
  date: "2021-12-04",
  review: "that slow motion shot of ryan gosling nonchalantly eating a slice of pizza in his designer suit at the mall as the camera slowly zooms in on him while tribal music plays over the top is absolutely legendary and what i hope i see right before i die",
  rating: 5,
  film: film15,
  user: film15.user,
  film_library: film15.film_library
)

review41 = Review.create!(
  date: "2022-07-14",
  review: "Ryan and Emma invented the rom com genre",
  rating: 4,
  film: film22,
  user: film22.user,
  film_library: film22.film_library
)

review42 = Review.create!(
  date: "2022-05-14",
  review: "magine wanting to kiss someone so bad that you literally almost break their fucking nose trying",
  rating: 5,
  film: film23,
  user: film23.user,
  film_library: film23.film_library
)

review43 = Review.create!(
  date: "2021-01-21",
  review: "elle woods was at harvard at the same time as mark zuckerberg",
  rating: 4,
  film: film24,
  user: film24.user,
  film_library: film24.film_library
)

review44 = Review.create!(
  date: "2022-11-25",
  review: "You could put this back in cinemas forever and it would single-handedly keep the film industry afloat imo (never any less moving or spectacular, what a staggering thing. A woman's heart is a deep ocean of secrets 🥲)",
  rating: 5,
  film: film25,
  user: film25.user,
  film_library: film25.film_library
)

review45 = Review.create!(
  date: "2021-05-18",
  review: "you were my brother Anakin",
  rating: 4,
  film: film56,
  user: film56.user,
  film_library: film56.film_library
)

review46 = Review.create!(
  date: "2022-12-26",
  review: "in the name of the father (cate blanchett), the son (rooney mara), and the holy ghost (sarah paulson).",
  rating: 4,
  film: film57,
  user: film57.user,
  film_library: film57.film_library
)

review47 = Review.create!(
  date: "2021-06-20",
  review: "my wig flew and is currently orbiting every far corner of space and time with mr mcconaughey",
  rating: 5,
  film: film58,
  user: film58.user,
  film_library: film58.film_library
)

review48 = Review.create!(
  date: "2020-01-21",
  review: "how hilary duff didn't get a best actress nomination for her “waiting for you is like waiting for rain in this drought” monologue is beyond me",
  rating: 3,
  film: film59,
  user: film59.user,
  film_library: film59.film_library
)

review49 = Review.create!(
  date: "2023-12-21",
  review: "Tom Cruise may legitimately be the greatest action star to ever exist.",
  rating: 4,
  film: film28,
  user: film28.user,
  film_library: film28.film_library
)

review50 = Review.create!(
  date: "2022-12-10",
  review: "i wonder how every other man in the world feels knowing that never in their lives will they ever come close to being as attractive as jude law in this movie",
  rating: 5,
  film: film29,
  user: film29.user,
  film_library: film29.film_library
)

review51 = Review.create!(
  date: "2020-02-21",
  review: "i'm never looking in a mirror ever again",
  rating: 4,
  film: film75,
  user: film75.user,
  film_library: film75.film_library
)

puts "seeding entries done!"
