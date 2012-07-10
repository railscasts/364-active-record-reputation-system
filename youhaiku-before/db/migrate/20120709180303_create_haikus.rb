class CreateHaikus < ActiveRecord::Migration
  def change
    create_table :haikus do |t|
      t.text :content
      t.belongs_to :user

      t.timestamps
    end
    add_index :haikus, :user_id
  end
end
