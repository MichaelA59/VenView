class Api::V1::ReviewapiController < Api::V1::BaseController
  def index
    respond_with Review.order(created_at: :desc).limit(5)
  end
end
