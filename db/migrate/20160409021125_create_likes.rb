class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :prototype_id
      t.integer :user_id
    end
  end
end
