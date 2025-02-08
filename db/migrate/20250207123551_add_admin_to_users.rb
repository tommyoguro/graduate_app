class AddAdminToUsers < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:users, :admin) # 既に存在する場合は追加しない
      add_column :users, :admin, :boolean, default: false, null: false
    end
  end
end