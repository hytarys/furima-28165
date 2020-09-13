class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :email, uniqueness: true,format: { with: /@.+/, full_message: "Please enter the correct Email"}
         validates :password, format: { with: /[a-z\d]{8,}/i, message: "Include both letters and numbers" }
         validates :first_name,:last_name, presence: true, format: {with: /[ぁ-んァ-ン一-龥]/, message: "Full-width charactors"}
         validates :first_name_reading, :last_name_reading, presence: true, format: { with: /[ァ-ン]/, message: "Full-width katakana characters"}
         validates :birthday, presence: true
end
