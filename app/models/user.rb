class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         has_many :items
         has_many :orders

  validates :nickname, presence: true
  validates :email, uniqueness: true, format: { with: /@.+/, full_message: 'Please enter the correct Email' }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers' }
  validates :first_name, :last_name, presence: true, format: {with: /[ぁ-んァ-ン一-龥]/, message: 'Full-width characters'}
  validates :first_name_reading, :last_name_reading, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
  validates :birthday, presence: true
end
