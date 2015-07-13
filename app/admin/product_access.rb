ActiveAdmin.register ProductAccess do
  actions :index
  menu priority: 6, label: 'Acesso aos Produtos'

  index do
    selectable_column
    id_column
    column :product
    column :ip
    column :created_at
    column :address
    column :latitude
    column :longitude
  end
end
