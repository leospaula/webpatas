# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

if Rails.env.development? || ENV['RUN_SEED']
  category = Category.create!(name: 'Ração de gato', pet: CategoryPet::CAT)
  sub_category = SubCategory.create!(category: category, name: 'Ração premium')

  category = Category.create!(name: 'Ração de cachorro', pet: CategoryPet::DOG)
  sub_category = SubCategory.create!(category: category, name: 'Ração premium')
end
