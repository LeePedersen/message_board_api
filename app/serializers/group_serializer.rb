class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :messages
  def messages
    self.object.messages.map do |message|
      { author: message.author,
      content: message.content,
      comments: message.comments}
    end
  end
end
