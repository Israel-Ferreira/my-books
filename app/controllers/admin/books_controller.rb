# frozen_string_literal: true

class Admin::BooksController < AdminController
  before_action :set_book, only: %i[show destroy edit update]

  def index
    @books = Book.includes(:publisher, :author, :category)
                 .order(created_at: :desc)
                 .page(params[:page])
  end

  def show; end

  def edit
    @publishers = Publisher.all.pluck(:title, :id)
    @authors = Author.all.pluck(:author_name, :id)
    @categories = Category.all.pluck(:title,:id)
  end 

  def new 
    @book = Book.new
    @publishers = Publisher.all.pluck(:title, :id)
    @authors = Author.all.pluck(:author_name, :id)
    @categories = Category.all.pluck(:title,:id)
  end

  def create 
    @book = Book.new(book_params)
    @book.images.attach(params[:book][:images]) 
    
    if @book.save!
      redirect_to admin_books_path
    else
      render :new
    end
  end

  def update
    binding.pry
    @book.images.attach(params[:book][:images])
    if @book.update!(book_params)
      redirect_to admin_book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy! 
      redirect_to admin_books_path
    else
      render :index
    end
  end

  private 

  def set_book 
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :isbn, :launch_year, :author_id, :category_id, :publisher_id, :images)
  end
end
