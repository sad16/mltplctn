class MultiplicationsController < ApplicationController
  before_action :find_multiplication, only: [:show, :call]

  def create
    multiplication = Multiplication.new(multiplication_params)

    if multiplication.save
      render json: { 
        success: { 
          code: 200, 
          message: 'Multiplication created', 
          result: { 
            redirect_url: multiplication_path(multiplication) 
          } 
        } 
      }, status: 200
    else
      render json: { 
        error: { 
          code: 400, 
          message: 'Multiplication didn`t create',
          result: {
            errors: multiplication.errors.messages
          } 
        } 
      }, status: 400
    end
  end

  def show
    if @multiplication.nil?
      render json: { 
        error: { 
          code: 404, 
          message: 'Multiplication not found' 
        }
      }, status: 404
      return
    end
  end

  def call
    @multiplication.call if @multiplication.sum.nil?
    render json: { success: { code: 200, message: 'success' } }, status: 200
  end

  private

  def multiplication_params
    params.require(:multiplication).permit(:max_multiplicand, :max_multiplier)
  end

  def find_multiplication
    @multiplication = Multiplication.find_by(id: params[:id])
  end
end