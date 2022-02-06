class Api::V1::CooksController < ApplicationController
  before_action :set_cook, only: %i[ show update destroy ]

  # GET /cooks
  def index
    @cooks = Cook.all

    render json: @cooks
  end

  # GET /cooks/1
  def show
    render json: @cook
  end

  # POST /cooks
  def create
    @cook = Cook.new(cook_params)

    if @cook.save
      render json: @cook, status: :created, location: @cook
    else
      render json: @cook.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cooks/1
  def update
    if @cook.update(cook_params)
      render json: @cook
    else
      render json: @cook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cooks/1
  def destroy
    @cook.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cook
      @cook = Cook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cook_params
      params.require(:cook).permit(:title, :body)
    end
end
