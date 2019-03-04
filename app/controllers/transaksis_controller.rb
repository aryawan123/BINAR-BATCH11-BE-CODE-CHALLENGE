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
        @sum = Transaksi.find_by(tgl: '04-03-2019').qty_beli
        

        # @sum = Transaksi.select(" sum(qty_beli) as total_beli")

        # records_array = ActiveRecord::Base.connection.execute('select sum(qty_beli) from transaksis')
        # records_array.class
        # p "aaaaaaaab"
        # p @sum

        # @sum = Transaksi.sum('qty_beli')
        # @transaksi = Transaksi.sum(:qty_beli, :group =>'obat_id')
    end

    private 
    def params_trans
        params.require(:transaksi).permit(:tgl, :qty_beli, :obat_id, :penjualan_id)
    end
end
