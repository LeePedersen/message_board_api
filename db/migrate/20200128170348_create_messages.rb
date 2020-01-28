class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :author
      t.string :content
      t.integer :group_id
      t.timestamps
    end
  end
end
