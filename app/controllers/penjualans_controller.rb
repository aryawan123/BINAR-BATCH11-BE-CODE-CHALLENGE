class PenjualansController < ApplicationController
    def new
        @penjualan = Penjualan.new
    end

    def create
        @penjualan  = Penjualan.new(penjualan_params)
        @penjualan.save
        redirect_to @penjualan
    end

    def index
        @penjualan  = Penjualan.all
    end

    def show
        @penjualan  = Penjualan.find(params[:id])
    end

    def edit
        @penjualan  = Penjualan.find(params[:id])
    end

    def update
        @penjualan  = Penjualan.find(params[:id])

        if  @penjualan.update(penjualan_params)
            redirect_to @penjualan
        else
            render 'edit'
        end
    end

    def destroy
        @penjualan =Penjualan.find(params[:id])
        @penjualan.destroy

        redirect_to  @penjualan 
    end


    private
    def penjualan_params
        params.require(:penjualan).permit(:nama_konsumen, :no_hp)
    end
end
