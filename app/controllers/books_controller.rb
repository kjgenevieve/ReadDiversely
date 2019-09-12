class BooksController < ApplicationController
    def index
        @books = Book.alphabetical
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(
            author_id: params["author_id"],
            title: params["book"]["title"]
        )
        puts book_params
        if @book.valid?
            @book.save
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        @book.update(
            author_id: params["author_id"],
            title: params["book"]["title"]
        )

        if @book.valid?
            redirect_to book_path(@book)
        else
            render :edit
        end
    end

    def delete
    end


    private
    def book_params
        params.require(:book).permit(:title, :author_id)
    end
end
