class User < ApplicationRecord
  has_many :leads, dependent: :destroy, foreign_key: :admin_id
  has_many :blogs, dependent: :destroy, foreign_key: :admin_id

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable
end
