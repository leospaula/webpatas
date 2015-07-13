class Store < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address

  after_validation :geocode, unless: -> (obj){ ((obj.latitude && obj.longitude) && !obj.address_changed?) }

  mount_uploader :logo, LogoUploader

  has_many :items

  validates :name, :address, :telephone, :cnpj, :business_hours, :contact_name, presence: true

  validates :delivery_hours, presence: true, if: :delivers?

  def accept_card?
    accept_credit_card? || accept_debit_card?
  end
end
