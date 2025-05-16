class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :category, null: false

      t.timestamps
    end
  end
end
