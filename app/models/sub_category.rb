class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :products

  def display_name
    "#{category.name} - #{name}"
  end
end
