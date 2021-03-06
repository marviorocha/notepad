# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @title = 'Welcome | Notepad'
    @note = Note.new
    @notes = Note.search(params[:search],
                         current_user.notes).order(created_at: :desc)
  end
end
