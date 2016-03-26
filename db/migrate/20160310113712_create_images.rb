class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.integer :prototype_id
      t.integer :status
      t.timestamps
    end
  end
end
