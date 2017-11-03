class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence:true

 #Esto viene del modelo pin, donde se le indico que un pin pertenece a un usuario
  has_many :pins
#en enum el orden es la jerarquia, culaquie usuario que se registre se crea como author
  enum role: [
    :author,
    :admin,
    :guest
  ]
end
