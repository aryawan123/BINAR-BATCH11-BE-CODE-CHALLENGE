class CreateTransaksis < ActiveRecord::Migration[5.2]
  def change
    create_table :transaksis do |t|
      t.date :tgl
      t.integer :qty_beli
      t.references :obat, foreign_key: true
      t.references :penjualan, foreign_key: true

      t.timestamps
    end
  end
end
