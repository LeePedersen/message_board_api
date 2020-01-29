class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :author
      t.string :content
      t.integer :groups_id
      t.timestamps
    end
  end
end
