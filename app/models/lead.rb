class Lead < ApplicationRecord
  belongs_to :admin, class_name: "User"

  validates :country,
            presence: true,
            length: {
              maximum: 255,
              message: "must be 255 characters or less."
            }
  validates :company,
            presence: true,
            length: {
              maximum: 255,
              message: "must be 255 characters or less."
            }
  validates :website,
            presence: true,
            length: {
              maximum: 255,
              message: "must be 255 characters or less."
            }
  validates :linkedin,
            presence: true,
            length: {
              maximum: 255,
              message: "must be 255 characters or less."
            }
  validates :email,
            presence: true,
            length: {
              maximum: 255,
              message: "must be 255 characters or less."
            }
  validates :phone,
            presence: true,
            length: {
              maximum: 15,
              message: "must be 15 digits or less."
            }
  validates :category,
            presence: true,
            length: {
              maximum: 255,
              message: "must be 255 characters or less."
            }
end
