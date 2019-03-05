class Transaksi < ApplicationRecord
  belongs_to :obat
  belongs_to :penjualan
  after_save :update_qty
  # def update_qty
  #   Obat.find_by(id: obat_id).update(qty: Obat.first.qty - Transaksi.first.qty_beli+1)
  #   end
   def update_qty
    @nana = Obat.find_by(id: obat_id).qty - qty_beli
    Obat.find_by(id: obat_id).update(qty: @nana)
   end
end
