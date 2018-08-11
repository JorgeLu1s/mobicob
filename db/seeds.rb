# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
delegation = Delegation.where(code: "1068", name: "Atl. Nte").first_or_create
contractor = Contractor.where(code: "0", name: "Contratista Generico").first_or_create
role = Role.where(code: "1", name: "Administrador").first_or_create
user = User.where(email: 'admin@example.com', password: 'password',
  role: role, contractor: contractor,
  delegation: delegation).first_or_create #if Rails.env.development?