# frozen_string_literal: true

namespace :dev do
  task setup: :environment do
    populate_admins()
  end

  private 
  
  def populate_admins
    admins = [
      {
        full_name: 'Admin',
        email: 'admin@admin.com.br',
        admin: true,
        password: '123456',
        password_confirmation: '123456'
      }
    ]

    admins.each do |admin|
      User.create!(admin)
    end
  end
end
