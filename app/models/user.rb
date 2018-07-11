class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cryptos

  # validates :first_name,  presence: true
  # validates :last_name,   presence: true
  # attr_accessible :first_name, :last_name

end
