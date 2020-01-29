class Comment < ApplicationRecord
  belongs_to :message

  validates :author, presence: true
  validates :content, presence: true
  validates :message_id, presence: true
end
