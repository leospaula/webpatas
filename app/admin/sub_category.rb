ActiveAdmin.register SubCategory do
  permit_params :name, :category_id
  menu priority: 4

  index do
    id_column
    column :name
    column :category
    actions
  end
end
