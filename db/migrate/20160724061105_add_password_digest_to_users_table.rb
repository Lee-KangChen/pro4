class AddPasswordDigestToUsersTable < ActiveRecord::Migration
# added users table/  10  db/migrate/20151212042638_add_users_table.rb
  def change
  	add_column :users, :password_digest, :string
    # 不是用password，是password_digest
  end
end
