class AddFuncaoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :funcao, :integer
  end
end
