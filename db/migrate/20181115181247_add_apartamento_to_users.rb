class AddApartamentoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :apartamento, :integer
  end
end
