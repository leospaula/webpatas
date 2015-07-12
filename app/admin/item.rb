ActiveAdmin.register Item do
  permit_params :product_id, :price, :available, :store_id
  menu priority: 8, label: 'Itens das Lojas'
end
