class Pin < ApplicationRecord
  validates :titile, uniqueness:true
  validates :image, presence:true
end
