class BooksController < ApplicationController
    def start
    end
    
    def index
      @books = Book.all.order(id: :desc)
      @book = Book.new
    end

    def create
        @books = Book.all
        @book = Book.new(book_params)
        if @book.save
          flash[:notice] = "Book was successfully created."
          redirect_to "/books/#{@book.id}"
        else 
          render action: :index
        end
    end
    
    def show
        @book = Book.find(params[:id])
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        if @book.update(book_params)
            flash[:notice2] = "Book was successfully updated."
            redirect_to "/books/#{@book.id}"
        else
            render action: :show
        end
    end
    
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to "/books"
    end
    
    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
