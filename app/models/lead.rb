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
            length: {
              maximum: 255,
              message: "must be 255 characters or less."
            }
  validates :email,
            length: {
              maximum: 255,
              message: "must be 255 characters or less."
            }
  validates :phone,
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
