class NegotiationsController < ApplicationController
  before_action :set_negotiation, only: %i[show edit update destroy]

  def index
    @q = Negotiation.ransack(params[:q])
    @negotiations = @q.result(distinct: true).includes(:buyer, :item,
                                                       :messages).page(params[:page]).per(10)
  end

  def show
    @message = Message.new
  end

  def new
    @negotiation = Negotiation.new
  end

  def edit; end

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

  def update
    if @negotiation.update(negotiation_params)
      redirect_to @negotiation, notice: "Negotiation was successfully updated."
    else
      render :edit
    end
  end

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

  def set_negotiation
    @negotiation = Negotiation.find(params[:id])
  end

  def negotiation_params
    params.require(:negotiation).permit(:buyer_id, :seller_id, :item_id,
                                        :completed)
  end
end
