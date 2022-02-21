class RecommendationsController < ApplicationController
  before_action :set_recommendation, only: %i[show edit update destroy]

  def index
    @q = Recommendation.ransack(params[:q])
    @recommendations = @q.result(distinct: true).includes(:user,
                                                          :item).page(params[:page]).per(10)
  end

  def show; end

  def new
    @recommendation = Recommendation.new
  end

  def edit; end

  def create
    @recommendation = Recommendation.new(recommendation_params)

    if @recommendation.save
      message = "Recommendation was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @recommendation, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @recommendation.update(recommendation_params)
      redirect_to @recommendation,
                  notice: "Recommendation was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recommendation.destroy
    message = "Recommendation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to recommendations_url, notice: message
    end
  end

  private

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:user_id, :item_id)
  end
end
