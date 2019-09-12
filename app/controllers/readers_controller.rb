class ReadersController < ApplicationController
    before_action :require_logged_in, only: [:edit, :update]

    def index
        @readers = Reader.alphabetical
    end

    def show
        @reader = Reader.find(params[:id])
    end

    def new
        @reader = Reader.new
    end

    def create
        @reader = Reader.new(reader_params)
        if @reader.valid?
            @reader.save
            redirect_to reader_path(@reader)
        else
            render :new
        end
    end

    def edit
        @reader = Reader.find(params[:id])
    end

    def update
        @reader = Reader.find(params[:id])
        @reader.update(reader_params)

        if @reader.valid?
            redirect_to reader_path(@reader)
        else
            render :edit
        end
    end

    def delete
    end


    private
    def reader_params
        params.require(:reader).permit(:name)
    end
end
