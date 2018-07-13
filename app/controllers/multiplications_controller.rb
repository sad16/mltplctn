class MultiplicationsController < ApplicationController
  before_action :find_multiplication, only: :show

  def create
    multiplication = Multiplication.new(multiplication_params)

    if multiplication.save
      render json: { success: { code: 200, message: 'success' } }, status: 200
    else
      render json: { error: { code: 400, message: multiplication.errors.messages } }, status: 400
    end
  end

  def show
    render json: { error: { code: 404, message: "Multiplication not found" } }, status: 404 and return if @multiplication.nil?

    @multiplication.call
  end

  private

  def multiplication_params
    params.require(:multiplication).permit(:max_multiplicand, :max_multiplier)
  end

  def find_multiplication
    @multiplication = Multiplication.find_by(id: params[:id])
  end
end