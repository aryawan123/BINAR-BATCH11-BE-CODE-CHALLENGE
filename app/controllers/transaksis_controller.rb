class TransaksisController < ApplicationController
    def new
        @transaksi = Transaksi.new
    end

    def index 
        @transaksi = Transaksi.all 
    end
 
    def show
        @transaksi =Transaksi.find(params[:id])
    end

    def create
        
        # obat = Obat.find_by(id = params[:obat_id])
        # @transaksi = Transaksi.new(params_trans)
        # obat.qty = obat.qty - qty_beli
        # @transaksi.save
        # obat.save
        
        @transaksi = Transaksi.new(params_trans)

        if @transaksi.save
            redirect_to @transaksi            
        else
            render 'new'
        end
    end

    def edit
        @transaksi = Transaksi.find(params[:id])
    end

    def update
        @transaksi = Transaksi.find(params[:id])
        if @transaksi.update(params_trans)
            redirect_to @transaksi
        else
            render 'edit'
        end
    end

    def destroy
        @transaksi = Transaksi.find(params[:id])
        @transaksi.destroy
        redirect_to @transaksi
    end

    def lap_penjualan
        @transaksi = Transaksi.all
        @sum = Transaksi.sum('qty_beli')
        
        # @sum = Transaksi.select(" sum(qty_beli) as total_beli")

        # records_array = ActiveRecord::Base.connection.execute('select sum(qty_beli) from transaksis')
        # records_array.class
        # p "aaaaaaaab"
        # p @sum

        # @sum = Transaksi.sum('qty_beli')
        # @transaksi = Transaksi.sum(:qty_beli, :group =>'obat_id')
    end

    def harga
        @transaksi = Transaksi.select(:id).find(params[:id])
        @transaksi2 = Transaksi.find(params[:id])
        @obat = Transaksi.where(id: @transaksi).select(:obat_id)
        harga = Obat.where(id: @obat).select(:harga)
        qty = Transaksi.where(id: @transaksi).select(:qty_beli)
        p ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
        p @transaksi
        p @transaksi2
        p @obat
        p harga
        p qty
         
         @total = harga.harga * qty
         p @total

         # @transaksi = Transaksi.find_by(id = params[:id])
        # @obat = Obat.find_by(id = params[:obat_id])
    end

    private 
    def params_trans
        params.require(:transaksi).permit(:tgl, :qty_beli, :obat_id, :penjualan_id)
    end
end
