class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128
         
  attr_accessor :key

  def name
    "#{first_name.capitalize} #{last_name.capitalize}" 
  end

  def email
    self[:email]
  end

  private
end
