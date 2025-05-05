# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Nettoyage de la base de données
puts "Nettoyage de la base de données..."
Result.destroy_all
Match.destroy_all
Player.destroy_all
Team.destroy_all
Admin.destroy_all
User.destroy_all
puts "Base de données nettoyée !"

# Création des administrateurs
admin1 = Admin.create!(
  email: 'admin@lol.com',
  password: 'password123',
  password_confirmation: 'password123'
)

# Création des utilisateurs
user1 = User.create!(
  email: 'user1@lol.com',
  password: 'password123',
  password_confirmation: 'password123'
)

user2 = User.create!(
  email: 'user2@lol.com',
  password: 'password123',
  password_confirmation: 'password123'
)

# Création des équipes
team1 = Team.create!(
  name: 'Fnatic'
)

team2 = Team.create!(
  name: 'G2 Esports'
)

team3 = Team.create!(
  name: 'Team Liquid'
)

team4 = Team.create!(
  name: 'Cloud9'
)

# Création des joueurs pour Fnatic
Player.create!([
  { first_name: 'Martin', last_name: 'Larsson', role: 'ADC', team: team1 },
  { first_name: 'Gabriël', last_name: 'Rau', role: 'Support', team: team1 },
  { first_name: 'Marcin', last_name: 'Jankowski', role: 'Jungler', team: team1 },
  { first_name: 'Marek', last_name: 'Brázda', role: 'Mid laner', team: team1 },
  { first_name: 'Martin', last_name: 'Nordahl', role: 'Top laner', team: team1 }
])

# Création des joueurs pour G2
Player.create!([
  { first_name: 'Rasmus', last_name: 'Winther', role: 'Mid laner', team: team2 },
  { first_name: 'Mihael', last_name: 'Mehle', role: 'Support', team: team2 },
  { first_name: 'Marcin', last_name: 'Jankowski', role: 'Jungler', team: team2 },
  { first_name: 'Steven', last_name: 'Liv', role: 'ADC', team: team2 },
  { first_name: 'Sergen', last_name: 'Çelik', role: 'Top laner', team: team2 }
])

# Création des joueurs pour Team Liquid
Player.create!([
  { first_name: 'Jo', last_name: 'CoreJJ', role: 'Support', team: team3 },
  { first_name: 'Gabriel', last_name: 'Baus', role: 'ADC', team: team3 },
  { first_name: 'Lucas', last_name: 'Santos', role: 'Jungler', team: team3 },
  { first_name: 'Eain', last_name: 'Stearns', role: 'Mid laner', team: team3 },
  { first_name: 'Park', last_name: 'Summit', role: 'Top laner', team: team3 }
])

# Création des joueurs pour Cloud9
Player.create!([
  { first_name: 'Jesper', last_name: 'Svenningsen', role: 'Support', team: team4 },
  { first_name: 'Kim', last_name: 'Berserker', role: 'ADC', team: team4 },
  { first_name: 'Robert', last_name: 'Blaber', role: 'Jungler', team: team4 },
  { first_name: 'Joseph', last_name: 'Jojopyun', role: 'Mid laner', team: team4 },
  { first_name: 'Ibrahim', last_name: 'Fudge', role: 'Top laner', team: team4 }
])

# Création des matchs
match1 = Match.create!(
  team1: team1,
  team2: team2,
  date: Date.today + 1.week
)

match2 = Match.create!(
  team1: team3,
  team2: team4,
  date: Date.today + 2.weeks
)

# Création des résultats
Result.create!(
  match: match1,
  team1_score: 2,
  team2_score: 1,
  winner: team1
)

Result.create!(
  match: match2,
  team1_score: 1,
  team2_score: 2,
  winner: team4
)

puts "Seed terminé !"
puts "Admin créé : admin@lol.com / password123"
puts "Utilisateurs créés : user1@lol.com et user2@lol.com / password123"
puts "4 équipes créées avec leurs joueurs"
puts "2 matchs créés avec leurs résultats"
