class GolongansController < ApplicationController
    def new
        @golongan = Golongan.new
    end

    def create
        @golongan  = Golongan.new(golongan_params)
        @golongan.save
        redirect_to @golongan
    end

    def index
        @golongan  = Golongan.all
    end

    def show
        @golongan  = Golongan.find(params[:id])
    end

    def edit
        @golongan  = Golongan.find(params[:id])
    end

    def update
        @golongan  = Golongan.find(params[:id])

        if  @golongan.update(golongan_params)
            redirect_to @golongan
        else
            render 'edit'
        end
    end

    def destroy
        @golongan =Golongan.find(params[:id])
        @golongan.destroy

        redirect_to  @golongan 
    end


    private
    def golongan_params
        params.require(:golongan).permit(:golongan_obat, :lokasi)
    end
end
