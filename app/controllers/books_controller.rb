class BooksController < ApplicationController
    def create
        @auther = Auther.find(params[:auther_id])
        @book = @auther.books.create(book_params)
        redirect_to auther_path(@auther)
      end
    
      private
        def book_params
          params.require(:book).permit(:bookname)
        end
end
