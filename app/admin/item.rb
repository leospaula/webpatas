ActiveAdmin.register Item do
  permit_params :product_id, :price, :available, :store_id
end
