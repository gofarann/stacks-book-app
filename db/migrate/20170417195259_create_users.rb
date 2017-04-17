class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :uid, null: false
      t.string :provider, null: false
      t.string :name
      t.string :email, null: false

      t.timestamps
    end
  end
end
