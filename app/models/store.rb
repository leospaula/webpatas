class Store < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :logo, LogoUploader

  validates :name, :address, :telephone, :cnpj, :business_hours, presence: true

  validates :delivery_hours, presence: true, if: :delivers?

  private
  def delivers?
    delivers
  end
end
