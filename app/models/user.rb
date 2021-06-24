class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items
  has_many :oders

  with_options presence: true do
    validates :nickname
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。' }
    validates :birthday
  end
  with_options presence: true do
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角で入力してください。' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角で入力してください。' }
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数混合で入力してください。' }
end
