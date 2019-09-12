class AuthorsController < ApplicationController
    def index
        @authors = Author.by_last
    end

    def show
        @author = Author.find(params[:id])
    end

    def new
        @author = Author.new
    end

    def create
        @author = Author.new(author_params)        
        if @author.valid?
            @author.save
            redirect_to author_path(@author)
        else
            render :new
        end
    end

    def edit
        @author = Author.find(params[:id])
    end

    def update
        @author = Author.find(params[:id])
        @author.update(author_params)
        
        if @author.valid?
            redirect_to author_path(@author)
        else
            render :edit
        end
    end

    def delete
    end


    private
    def author_params
        params.require(:author).permit(:last_name, :first_name, :gender, :sexual_orientation, :race, :nationality)
    end
end