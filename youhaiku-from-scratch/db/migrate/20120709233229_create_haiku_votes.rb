class CreateHaikuVotes < ActiveRecord::Migration
  def change
    create_table :haiku_votes do |t|
      t.belongs_to :haiku
      t.belongs_to :user
      t.integer :value

      t.timestamps
    end
    add_index :haiku_votes, :haiku_id
    add_index :haiku_votes, :user_id
  end
end
