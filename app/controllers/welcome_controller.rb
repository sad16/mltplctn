class WelcomeController < ApplicationController
  def index
    @multiplication = Multiplication.new
  end
end