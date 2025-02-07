class AddColumnsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :name_kana, :string, null: false, default: ""
    add_column :users, :company_name, :string, null: false, default: ""
    add_column :users, :division_name, :string, null: false, default: ""
    add_column :users, :is_deleted, :boolean, null: false, default: false
    add_column :users, :is_admin, :boolean, null: false, default: false
  end
end
