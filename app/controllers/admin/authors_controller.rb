# frozen_string_literal: true

class Admin::AuthorsController < AdminController
  before_action :set_author, only: %i[show edit update destroy]

  def index
    @authors = Author.all.page(params[:page])
  end

  def show; end

  def new
    @author = Author.new
  end

  def edit; end

  def update
    if @author.update(author_params)
      redirect_to admin_author_path(@author.id), notice: 'Autor Atualizado com Sucesso'
    else
      render :edit
    end
  end

  def create
    @author = Author.new(author_params)

    if @author.save!
      redirect_to admin_authors_path
    else
      render :new
    end
  end

  def destroy 
    if @author.destroy!
      redirect_to admin_authors_path
    else
      flash[:error] = @author.errors.full_messages.to_sentence
      render :index
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
