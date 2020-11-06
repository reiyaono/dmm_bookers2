class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books
  attachment :profile_image
  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  # name：一意性を持たせ、かつ2～20文字の範囲で設定してください。
  # introduction：最大50文字までに設定してください。

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
