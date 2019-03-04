class CreateObats < ActiveRecord::Migration[5.2]
  def change
    create_table :obats do |t|
      t.string :nama_obat
      t.integer :qty
      t.integer :harga
      t.references :golongan, foreign_key: true

      t.timestamps
    end
  end
end
