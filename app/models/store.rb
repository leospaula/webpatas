class Store < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address

  after_validation :geocode, unless: -> (obj){ ((obj.latitude && obj.longitude) && !obj.address_changed?) }

  mount_uploader :logo, LogoUploader

  has_many :items

  validates :name, :address, :telephone, :cnpj, :business_hours, presence: true

  validates :delivery_hours, presence: true, if: :delivers?

  private
  def delivers?
    delivers
  end
end
