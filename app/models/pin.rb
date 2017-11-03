class Pin < ApplicationRecord
  validates :titile, uniqueness:true
  validates :image, presence:true
  #se le indica que un pin pertenece a un usuario, luego se agrega la referencia en el modelo de user.
  belongs_to :user

end
