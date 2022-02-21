class Api::V1::NegotiationsController < Api::V1::GraphitiController
  def index
    negotiations = NegotiationResource.all(params)
    respond_with(negotiations)
  end

  def show
    negotiation = NegotiationResource.find(params)
    respond_with(negotiation)
  end

  def create
    negotiation = NegotiationResource.build(params)

    if negotiation.save
      render jsonapi: negotiation, status: :created
    else
      render jsonapi_errors: negotiation
    end
  end

  def update
    negotiation = NegotiationResource.find(params)

    if negotiation.update_attributes
      render jsonapi: negotiation
    else
      render jsonapi_errors: negotiation
    end
  end

  def destroy
    negotiation = NegotiationResource.find(params)

    if negotiation.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: negotiation
    end
  end
end
