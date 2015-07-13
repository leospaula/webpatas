ActiveAdmin.register Item do
  permit_params :product_id, :price, :available, :store_id
  menu priority: 8, label: 'Itens das Lojas'

  index do
    selectable_column
    id_column
    column :name
    column :available
    column :price
    column :store
  end
end
