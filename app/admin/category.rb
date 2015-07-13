ActiveAdmin.register Category do
  permit_params :name, :pet
  menu priority: 3

  index do
    id_column
    column :name
    column :pet do |category|
      category.pet_humanize
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :pet do
        category.pet_humanize
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :pet, as: :select, collection: CategoryPet.to_a
    end
    f.actions
  end
end
