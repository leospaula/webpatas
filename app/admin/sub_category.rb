ActiveAdmin.register SubCategory do
  permit_params :name, :category_id
  menu priority: 4
end
