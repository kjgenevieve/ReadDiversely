class ReadersController < ApplicationController
    def index
        @readers = Reader.alphabetical
    end

    def show
        @reader = Reader.find(params[:id])
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def delete
    end
end
