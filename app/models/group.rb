class Group < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :content, presence: true

  scope :search, -> (name) { where name: name }

end
