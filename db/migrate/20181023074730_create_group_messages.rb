class CreateGroupMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :group_messages do |t|
      t.integer :group_id
      t.integer :sender_id
      t.text :content

      t.timestamps
    end
  end
end
