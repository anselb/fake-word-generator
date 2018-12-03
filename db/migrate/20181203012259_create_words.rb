class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :word
      t.integer :votes

      t.timestamps
    end
  end
end
