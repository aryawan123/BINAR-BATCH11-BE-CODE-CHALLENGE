class Obat < ApplicationRecord
  belongs_to :golongan
  has_many :transaksis, dependent: :delete_all
  has_many :penjualans, through: :transaksis
end
