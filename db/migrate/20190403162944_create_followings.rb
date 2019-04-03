class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
