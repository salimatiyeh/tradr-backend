class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :trade, null: false, foreign_key: true
      t.references :reviewer, foreign_key: { to_table: :users }
      t.references :reviewee, foreign_key: { to_table: :users }
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
