class CreateResponds < ActiveRecord::Migration
  def change
    create_table :responds do |t|
      t.string :name
      t.text :body
      t.timestamps
    end
  end
end
