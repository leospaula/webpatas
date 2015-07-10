class StoreAccess < ActiveRecord::Base
  belongs_to :store

  validates :ip, :store, presence: true
end
