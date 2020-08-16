# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_admin!

  layout 'admin'

  def authenticate_admin!
    authenticate_user!

    redirect_to root_path, notice: 'Você não pode acessar essa área' unless current_user.admin?
  end
end
