class User < ApplicationRecord
  has_many :mediations
  
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128
         
  attr_accessor :key

  def name
    "#{first_name.capitalize} #{last_name.capitalize}" 
  end
end
