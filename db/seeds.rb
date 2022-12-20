# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

c = Company.create!(name: 'Empresa de Teste', cnpj: '01946712329', block: false)
user = User.create(email: 'usuarioteste@gmail.com', password: 'qwe123', company: c, name: 'Usuário de Teste')

num = 0
1..20.times do |_f|
  Account.create!(description: "conta teste #{num += 1}", tipe: rand(0..4), cost: rand(0..1), company: c)
end

num = 0
1..20.times do |_f|
  Category.create!(description: "Categoria teste #{num += 1}", company: c)
end
