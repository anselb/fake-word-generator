class CreateComponentLists < ActiveRecord::Migration[5.2]
  def change
    create_table :component_lists do |t|
      t.text :components
      t.array :components_array

      t.timestamps
    end
  end
end
