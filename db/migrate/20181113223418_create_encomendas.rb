class CreateEncomendas < ActiveRecord::Migration[5.2]
  def change
    create_table :encomendas do |t|
      t.date :arrival
      t.date :departure
      t.string :name
      t.string :apart

      t.timestamps
    end
  end
end
