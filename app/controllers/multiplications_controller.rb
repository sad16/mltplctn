class MultiplicationsController < ApplicationController
  def create
    multiplication = Multiplication.new(multiplication_params)

    if multiplication.save
      render json: { success: { code: 200, message: 'success' } }, status: 200
    else
      render json: { error: { code: 400, message: 'error' } }, status: 400
    end
  end

  private

  def multiplication_params
    params.require(:multiplication).permit(:max_multiplicand, :max_multiplier)
  end
end