ActiveAdmin.register Product do
  permit_params :name, :description, :brand, :reference, :sku, :image_1,
    :image_2, :image_3, :image_4, :technical_information, sub_category_ids: []

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :description, as: :html_editor
      f.input :technical_information, as: :html_editor
      f.input :brand
      f.input :reference
      f.input :sku
      f.input :image_1, as: :file
      f.input :image_2, as: :file
      f.input :image_3, as: :file
      f.input :image_4, as: :file
      f.input :sub_categories, as: :check_boxes, collection: SubCategory.includes(:category).all.map{|sub| [[sub.category.name, sub.name].join(' - '), sub.id]}
    end
    f.actions
  end
end
