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

  # Store with credit card + debit + deliver

  store = Store.create!(email: 'contato@codeland.com.br', password: '123123123',
                        name: 'Loja', telephone: '(51) 3779-9710',
                        accept_credit_card: true, accept_debit_card: true,
                        delivers: true, delivery_hours: 'Horários',
                        address: 'Rua Felipe Neri, 128 - Porto Alegre/RS',
                        cnpj: '20.628.338/0001-08', business_hours: 'Hora',
                        contact_name: 'Fulano da Codeland')
  store.confirm

  item = Item.create!(product: product, available: true, price: 10.00, store: store)
  item = Item.create!(product: product, available: true, price: 15.00, store: store)
  item = Item.create!(product: product, available: true, price: 20.00, store: store)

  item = Item.create!(product: product2, available: true, price: 20.00, store: store)
  item = Item.create!(product: product2, available: true, price: 10.00, store: store)
  item = Item.create!(product: product2, available: true, price: 15.00, store: store)

  # Store with deliver but without cards

  store = Store.create!(email: 'contato2@codeland.com.br', password: '123123123',
                        name: 'Loja2', telephone: '(51) 3779-9710',
                        accept_credit_card: false, accept_debit_card: false,
                        delivers: true, delivery_hours: 'Horários',
                        address: 'Rua Felipe Neri, 128 - Porto Alegre/RS',
                        cnpj: '20.628.338/0002-08', business_hours: 'Hora',
                        contact_name: 'Fulano da Codeland 2')
  store.confirm

  item = Item.create!(product: product, available: true, price: 10.00, store: store)
  item = Item.create!(product: product, available: true, price: 15.00, store: store)
  item = Item.create!(product: product, available: true, price: 20.00, store: store)

  item = Item.create!(product: product2, available: true, price: 20.00, store: store)
  item = Item.create!(product: product2, available: true, price: 10.00, store: store)
  item = Item.create!(product: product2, available: true, price: 15.00, store: store)

  # Store with deliver+credit but without debit

  store = Store.create!(email: 'contato3@codeland.com.br', password: '123123123',
                        name: 'Loja 3', telephone: '(51) 3779-9710',
                        accept_credit_card: true, accept_debit_card: false,
                        delivers: true, delivery_hours: 'Horários',
                        address: 'Rua Felipe Neri, 128 - Porto Alegre/RS',
                        cnpj: '20.628.338/0003-08', business_hours: 'Hora',
                        contact_name: 'Fulano da Codeland 3')
  store.confirm

  item = Item.create!(product: product, available: true, price: 10.00, store: store)
  item = Item.create!(product: product, available: true, price: 15.00, store: store)
  item = Item.create!(product: product, available: true, price: 20.00, store: store)

  item = Item.create!(product: product2, available: true, price: 20.00, store: store)
  item = Item.create!(product: product2, available: true, price: 10.00, store: store)
  item = Item.create!(product: product2, available: true, price: 15.00, store: store)

  # Store with deliver+debit but without credit

  store = Store.create!(email: 'contato4@codeland.com.br', password: '123123123',
                        name: 'Loja 4', telephone: '(51) 3779-9710',
                        accept_credit_card: false, accept_debit_card: false,
                        delivers: false,
                        address: 'Rua Felipe Neri, 128 - Porto Alegre/RS',
                        cnpj: '20.628.338/0002-08', business_hours: 'Hora',
                        contact_name: 'Fulano da Codeland 4')
  store.confirm

  item = Item.create!(product: product, available: true, price: 10.00, store: store)
  item = Item.create!(product: product, available: true, price: 15.00, store: store)
  item = Item.create!(product: product, available: true, price: 20.00, store: store)

  item = Item.create!(product: product2, available: true, price: 20.00, store: store)
  item = Item.create!(product: product2, available: true, price: 10.00, store: store)
  item = Item.create!(product: product2, available: true, price: 15.00, store: store)
end
