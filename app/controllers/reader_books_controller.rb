class ReaderBooksController < ApplicationController
    def show
        @reader_books = ReaderBook.find(params[:id])
    end
    
    def new
        @reader_book = ReaderBook.new
        if !session[:id]
            puts "You must be logged in to add books to your account."
            redirect_to login_path
        else
            @reader_id = session[:id]
        end
    end

    def create
        @reader_book = ReaderBook.new(
            reader_id: session[:id],
            book_id: params["book_id"]
        )
        
        if @reader_book.valid?
            @reader_book.save
            redirect_to reader_path(session[:id])
        else
            render :new
        end
    end

    def edit
        @reader_book = ReaderBook.find(params[:id])
    end

    def update
        @reader_book = ReaderBook.find(params[:id])
        @reader_book.update(reader_book_params)
        
        if @reader_book.valid?
            redirect_to reader_path(@reader)
        else
            render :edit
        end
    end

    def delete
    end


    private
    def reader_book_params
        params.require(:reader_book).permit(:reader_id, :book_id)
    end   
end
