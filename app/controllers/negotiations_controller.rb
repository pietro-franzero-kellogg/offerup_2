class NegotiationsController < ApplicationController
  before_action :set_negotiation, only: %i[show edit update destroy]

  # GET /negotiations
  def index
    @q = Negotiation.ransack(params[:q])
    @negotiations = @q.result(distinct: true).includes(:buyer, :item,
                                                       :messages).page(params[:page]).per(10)
  end

  # GET /negotiations/1
  def show
    @message = Message.new
  end

  # GET /negotiations/new
  def new
    @negotiation = Negotiation.new
  end

  # GET /negotiations/1/edit
  def edit; end

  # POST /negotiations
  def create
    @negotiation = Negotiation.new(negotiation_params)

    if @negotiation.save
      message = "Negotiation was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @negotiation, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /negotiations/1
  def update
    if @negotiation.update(negotiation_params)
      redirect_to @negotiation, notice: "Negotiation was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /negotiations/1
  def destroy
    @negotiation.destroy
    message = "Negotiation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to negotiations_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_negotiation
    @negotiation = Negotiation.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def negotiation_params
    params.require(:negotiation).permit(:buyer_id, :seller_id, :item_id,
                                        :completed)
  end
end
