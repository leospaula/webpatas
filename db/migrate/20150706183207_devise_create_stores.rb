class DeviseCreateStores < ActiveRecord::Migration
  def change
    create_table(:stores) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      ## Fields
      t.string :name, null: false
      t.string :address
      t.string :telephone
      t.string :website
      t.text :description
      t.string :logo
      t.boolean :accept_credit_card, default: false
      t.boolean :accept_debit_card, default: false
      t.boolean :delivers, default: false
      t.string :delivery_hours
      t.string :business_hours
      t.boolean :blocked, default: true
      t.string :cnpj

      t.timestamps null: false
    end

    add_index :stores, :email,                unique: true
    add_index :stores, :reset_password_token, unique: true
    # add_index :stores, :confirmation_token,   unique: true
    # add_index :stores, :unlock_token,         unique: true
  end
end
