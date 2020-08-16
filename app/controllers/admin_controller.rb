# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_admin!
  
  def authenticate_admin!
    authenticate_user!

    unless current_user.admin?
      redirect_to root_path, notice: 'Você não pode acessar essa área'
    end
  end
end
