# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
delegation = Delegation.where(code: "1063").first_or_create!
delegation.name = "10 Sucre"
delegation.save

contractor = Contractor.where(name: Contractor::DEFAULT_CONTRACTOR_NAME).first_or_create!
contractor.code = Contractor::DEFAULT_CONTRACTOR_CODE
contractor.save

role = Role.where(code: Role.basic_roles[:admin]).first_or_create!
role.name = "Administrador"
role.save

user = User.where(email: 'admin@example.com').first_or_create!
user.password = 'password'
user.role = role
user.contractor = contractor
user.delegation = delegation
user.save

back = Role.where(code: Role.basic_roles[:back]).first_or_create!
back.name = "Back Office"
back.save

web = Role.where(code: Role.basic_roles[:web]).first_or_create!
web.name = "Gestor Web"
web.save

mobile = Role.where(code: Role.basic_roles[:mobile]).first_or_create!
mobile.name = "Gestor Móvil"
mobile.save