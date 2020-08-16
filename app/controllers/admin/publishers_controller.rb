# frozen_string_literal: true

class Admin::PublishersController < AdminController
  before_action :set_publisher, only: %i[show destroy edit update]

  def index
    @publishers = Publisher.all.page(params[:page])
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save!
      redirect_to admin_publishers_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @publisher.update(publisher_params)
      redirect_to admin_publisher_path(@publisher.id)
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @publisher.destroy!
      redirect_to admin_publishers_path
    else
      render :index
    end
  end

  private

  def set_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:title, :country, :description)
  end
end
