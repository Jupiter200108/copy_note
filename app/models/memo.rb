class Memo < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1}
  belongs_to :user
  belongs_to :folder
end
