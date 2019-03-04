class Transaksi < ApplicationRecord
  belongs_to :obat
  belongs_to :penjualan
end
