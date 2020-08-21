class Admin::HomeController < AdminController
  def index
    @categories = Category.all.take(5)
    @books = Book.all.take(5)
    @authors = Author.all.take(5)
  end
end
