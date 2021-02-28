class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name ,null: false
      t.string :password_digest,null: false

      t.timestamps
    end
    add_index :users, :name, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
