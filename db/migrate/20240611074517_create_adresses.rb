class CreateAdresses < ActiveRecord::Migration[7.0]
  def change
    create_table :adresses do |t|
      t.string :postal_code,   null: false
      t.string :prefecture_id, null: false
      t.string :city,          null: false
      t.string :addresses,     null: false
      t.string :building,      null: false
      t.string :phone_number,  null: false
      t.references :detail,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
