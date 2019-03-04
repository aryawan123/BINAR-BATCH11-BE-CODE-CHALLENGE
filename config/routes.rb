Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :golongans
  resources :penjualans
  get 'lap', to: 'transaksis#lap_penjualan'
  resources :obats
  resources :transaksis

end

