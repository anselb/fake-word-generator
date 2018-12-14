class CreateComponentLists < ActiveRecord::Migration[5.2]
  def change
    create_table :component_lists do |t|
      t.text :components
      t.text :components_array, array: true

      t.timestamps
    end
  end
end
