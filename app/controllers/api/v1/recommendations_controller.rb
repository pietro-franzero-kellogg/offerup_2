class Api::V1::RecommendationsController < Api::V1::GraphitiController
  def index
    recommendations = RecommendationResource.all(params)
    respond_with(recommendations)
  end

  def show
    recommendation = RecommendationResource.find(params)
    respond_with(recommendation)
  end

  def create
    recommendation = RecommendationResource.build(params)

    if recommendation.save
      render jsonapi: recommendation, status: 201
    else
      render jsonapi_errors: recommendation
    end
  end

  def update
    recommendation = RecommendationResource.find(params)

    if recommendation.update_attributes
      render jsonapi: recommendation
    else
      render jsonapi_errors: recommendation
    end
  end

  def destroy
    recommendation = RecommendationResource.find(params)

    if recommendation.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: recommendation
    end
  end
end
