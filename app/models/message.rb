class Message < ApplicationRecord
  belongs_to :group
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :content, presence: true
  validates :group_id, presence: true
end
