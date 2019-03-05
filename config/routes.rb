Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :golongans
  resources :penjualans
  get 'lap', to: 'transaksis#lap_penjualan'
  get '/transaksis/:id/harga', to: 'transaksis#harga', as: 'harga'
  resources :obats
  resources :transaksis 

end

