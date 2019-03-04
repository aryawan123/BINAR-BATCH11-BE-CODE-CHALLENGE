class CreatePenjualans < ActiveRecord::Migration[5.2]
  def change
    create_table :penjualans do |t|
      t.string :nama_konsumen
      t.string :no_hp

      t.timestamps
    end
  end
end
