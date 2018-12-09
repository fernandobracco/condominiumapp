class CreateCalendarios < ActiveRecord::Migration[5.1]
  def change
    create_table :calendarios do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :descricao

      t.timestamps
    end
  end
end
