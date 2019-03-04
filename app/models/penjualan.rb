class Penjualan < ApplicationRecord
    has_many :transaksis, dependent: :delete_all
    has_many :obats, through: :transaksis
end
