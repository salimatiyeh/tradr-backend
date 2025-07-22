class CreateTradeItems < ActiveRecord::Migration[7.1]
  def change
    create_table :trade_items do |t|
      t.references :trade, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true
      t.references :owner, foreign_key: { to_table: :users }
      t.string :side

      t.timestamps
    end
  end
end
