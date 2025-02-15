class ChangeNameKanaNullInUsers < ActiveRecord::Migration[7.2]
  def change
    change_column_null :users, :name_kana, true
  end
end
