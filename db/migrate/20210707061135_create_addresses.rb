class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order      , null: false, foreign_key: true
      t.string :postal        , null: false
      t.integer :prefecture_id, null: false
      t.string :city          , null: false
      t.string :address1      , null: false
      t.string :address2
      t.string :telephone     , null: false
      t.timestamps
    end
  end
end
