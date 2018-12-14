class AddNameToComponentList < ActiveRecord::Migration[5.2]
  def change
    add_column :component_lists, :name, :string
  end
end
