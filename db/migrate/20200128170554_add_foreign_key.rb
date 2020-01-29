class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :messages, :groups
    add_foreign_key :comments
  end
end
