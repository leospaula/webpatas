class Category < ActiveRecord::Base
  has_many :sub_categories, dependent: :destroy

  has_enumeration_for :pet,
    with: CategoryPet, create_helpers: true, required: true

  validates :name, presence: true
end
