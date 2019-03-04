class ObatsController < ApplicationController
    def new
        @obat = Obat.new
    end

    def index
        @obat = Obat.all
    end

    #sopir bisa kedetect disini gk sih? --> trus edit gmn?
    def create
       
            @obat = Obat.new(obat_params)
            @obat.save
            redirect_to @obat
        
    end

    def show
        @obat = Obat.find(params[:id])
    end

    def edit
        @obat = Obat.find(params[:id])
    end

    def update
        @obat = Obat.find(params[:id])
        if @obat.update(obat_params)
            redirect_to @obat
        else
            render 'edit'
        end
    end

    def destroy
        @obat = Obat.find(params[:id])
        @obat.destroy
        redirect_to @obat
    end

    private 
    def obat_params
        params.require(:obat).permit(:nama_obat, :qty, :harga, :golongan_id)
    end
 
end
 