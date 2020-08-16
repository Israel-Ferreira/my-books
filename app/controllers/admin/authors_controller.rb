# frozen_string_literal: true

class Admin::AuthorsController < AdminController
  before_action :set_author, only: %i[show edit update destroy]

  def index
    @authors = Author.all
  end

  def show; end

  def new
    @author = Author.new
  end

  def edit; end

  def update
    if @author.update(author_params)
      redirect_to admin_authors, notice: 'Autor Atualizado com Sucesso'
    else
      render :edit
    end
  end

  def create
    @author = Author.new(author_params)

    if @author.save!
      redirect_to admin_authors
    else
      render :new
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:author_name, :biography, :country)
  end
end
