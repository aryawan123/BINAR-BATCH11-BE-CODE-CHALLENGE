class CreateGolongans < ActiveRecord::Migration[5.2]
  def change
    create_table :golongans do |t|
      t.string :golongan_obat
      t.string :lokasi

      t.timestamps
    end
  end
end
