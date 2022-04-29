class CreateAdminUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :admin_users do |t|
    	t.string "first_name", limit: 25
		t.string "last_name", limit: 35
		t.string "email", default: "", null: false
		t.string "username", limit: 25
		t.string "hashed_password", limit: 40
		
		t.timestamps

    end
  end
  def down
  	drop_table :admin_users
  end
end
