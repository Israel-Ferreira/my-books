# frozen_string_literal: true

class Admin::CategoriesController < AdminController
  before_action :set_category, only: %i[show edit update destroy]
  def index
    @categories = Category.all.page(params[:page])
  end

  def new
    @category = Category.new
  end

  def show; end

  def edit; end

  def create
    @category = Category.new(category_params)

    if @category.save!
      redirect_to admin_categories_path, notice: 'Categoria criada com sucesso'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_category_path(@category.id), notice: 'Categoria atualizada com sucesso'
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy!
      redirect_to admin_categories_path, notice: 'Categoria apagada com sucesso'
    else
      render :index
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
