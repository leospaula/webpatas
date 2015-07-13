ActiveAdmin.register Store do
  permit_params :name, :address, :telephone, :website, :description, :logo,
                :accept_credit_card,:accept_debit_card, :delivers, :blocked,
                :delivery_hours, :business_hours, :cnpj
  menu priority: 7

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :telephone
    column :address
    column :website
    column :blocked
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :blocked
      f.input :name
      f.input :address
      f.input :telephone
      f.input :website
      f.input :description
      f.input :logo
      f.input :accept_credit_card
      f.input :accept_debit_card
      f.input :delivers
      f.input :delivery_hours
      f.input :business_hours
      f.input :cnpj
    end
    f.actions
  end

end
