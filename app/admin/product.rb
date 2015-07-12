ActiveAdmin.register Product do
  permit_params :name, :description, :brand, :reference, :sku, :image_1,
    :image_2, :image_3, :image_4, :technical_information, sub_category_ids: []
  menu priority: 5

  index do
    column :id
    column :image do |product|
      image_tag product.image_1.url, size: '100x100'
    end
    column :name
    column :sku
    column :reference
    column :brand
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :technical_information
      row :brand
      row :reference
      row :sku
      row :image_1 do |product|
        image_tag product.image_1.url, size: '150x150'
      end
      row :image_2 do |product|
        image_tag product.image_1.url, size: '150x150'
      end
      row :image_3 do |product|
        image_tag product.image_1.url, size: '150x150'
      end
      row :image_4 do |product|
        image_tag product.image_1.url, size: '150x150'
      end
    end
  end

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
