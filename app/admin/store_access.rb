ActiveAdmin.register StoreAccess do
  actions :index
  menu priority: 9, label: 'Acesso as Lojas'

  index do
    selectable_column
    id_column
    column :store
    column :ip
    column :created_at
  end
end
