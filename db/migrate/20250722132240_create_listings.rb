class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :condition
      t.boolean :accepting_trades
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
