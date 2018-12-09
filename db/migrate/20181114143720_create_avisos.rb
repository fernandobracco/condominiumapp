class CreateAvisos < ActiveRecord::Migration[5.2]
  def change
    create_table :avisos do |t|
      t.integer :usuario_id
      t.text :texto

      t.timestamps
    end
  end
end
