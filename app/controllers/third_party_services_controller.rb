class ThirdPartyServicesController < ApplicationController
  before_action :set_third_party_service, only: %i[ show update destroy ]

  # GET /third_party_services
  def index
    @third_party_services = ThirdPartyService.all

    render json: @third_party_services
  end

  # GET /third_party_services/1
  def show
    render json: @third_party_service
  end

  # POST /third_party_services
  def create
    @third_party_service = ThirdPartyService.new(third_party_service_params)

    if @third_party_service.save
      render json: @third_party_service, status: :created, location: @third_party_service
    else
      render json: @third_party_service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /third_party_services/1
  def update
    if @third_party_service.update(third_party_service_params)
      render json: @third_party_service
    else
      render json: @third_party_service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /third_party_services/1
  def destroy
    @third_party_service.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_third_party_service
      @third_party_service = ThirdPartyService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def third_party_service_params
      params.require(:third_party_service).permit(:url)
    end
end
