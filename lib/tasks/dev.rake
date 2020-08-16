# frozen_string_literal: true

namespace :dev do
  task setup: :environment do
    commands = [
      { start_msg: 'Apagando o banco de dados', end_msg: 'Banco de dados apagado com sucesso', command: 'db:drop' },
      { start_msg: 'Criando o banco de dados', end_msg: 'Banco de dados criado com sucesso', command: 'db:create' },
      { start_msg: 'Migrando as tabelas do banco de dados', end_msg: 'Banco de dados migrado com sucesso', command: 'db:migrate' },
      { start_msg: 'Populando os admins no BD', end_msg: 'Banco de dados populado com sucesso', command: 'dev:populate_admins' }
    ]

    commands.each do |task|
      show_spinner(task[:start_msg], task[:end_msg]) do
        `rails #{task[:command]}`
      end
    end
  end

  task populate_admins: :environment do
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

  private

  def show_spinner(start_msg, end_msg)
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}...")
    spinner.auto_spin

    if block_given?
      yield
      spinner.success("(#{end_msg})")
    else
      spinner.error('(ERRO: Não foi passado o bloco)')
    end
  end
end
