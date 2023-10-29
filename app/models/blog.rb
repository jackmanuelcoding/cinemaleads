class Blog < ApplicationRecord
  belongs_to :admin, class_name: "User"

  has_rich_text :body

  validates :title,
            presence: true,
            uniqueness: true,
            length: {
              maximum: 255,
              message: "must be 255 characters or less."
            }
  validates :body,
            presence: true,
            length: {
              maximum: 30_000,
              message: "must be 30,000 characters or less."
            }
end
