# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

if Rails.env.development? || ENV['RUN_SEED']
  category = Category.create!(name: 'Ração de gato', pet: CategoryPet::CAT)
  sub_category = SubCategory.create!(category: category, name: 'Ração premium')

  category = Category.create!(name: 'Ração de cachorro', pet: CategoryPet::DOG)
  sub_category = SubCategory.create!(category: category, name: 'Ração premium')

  product = Product.create!(name: 'Ração Cara', description: '<p>Hell yeah</p>',
                            brand: 'Royal', sku: '00001', remote_image_1_url: 'http://theoldreader.com/kittens/600/400/')
  sub_category.products << product

  product2 = Product.create!(name: 'Ração Barata', description: '<p>Yeah</p>',
                            brand: 'Royal', sku: '00002', remote_image_1_url: 'http://theoldreader.com/kittens/600/400/' )
  sub_category.products << product2

  product3 = Product.create!(name: 'Ração sem item', description: '<p>Yeah</p>',
                            brand: 'Royal', sku: '00002', remote_image_1_url: 'http://theoldreader.com/kittens/600/400/' )
  sub_category.products << product3

  store = Store.create!(email: 'contato@codeland.com.br', password: '123123123',
                        name: 'Loja', telephone: '(51) 3779-9710',
                        address: 'Rua Felipe Neri, 128 - Porto Alegre/RS',
                        cnpj: '20.628.338/0001-08', business_hours: 'Hora')
  store.confirm

  item = Item.create!(product: product, available: true, price: 10.00, store: store)
  item = Item.create!(product: product, available: true, price: 15.00, store: store)
  item = Item.create!(product: product, available: true, price: 20.00, store: store)

  item = Item.create!(product: product2, available: true, price: 20.00, store: store)
  item = Item.create!(product: product2, available: true, price: 10.00, store: store)
  item = Item.create!(product: product2, available: true, price: 15.00, store: store)
end
