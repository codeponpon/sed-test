class Api::V1::BackendsController < Api::V1::ApiController
  skip_before_action :doorkeeper_authorize!
  skip_before_action :prep_response
  skip_before_action :validate_api_request
  skip_before_action :find_and_authorize_resource
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  before_action :require_bot

  def show
    model = modelize.find(params[:id])
    render json: model, status: :ok
  end

  def create
    data = params[:data][model_name]
    model = modelize.new(permitted_params)
    return render json: model, status: :ok if model.save
    return_bad_request
  end

  def update
    data = params[:data][model_name]
    model = modelize.find(params[:id])
    return render json: model, status: :ok if model.update_attributes(permitted_params)
    return_bad_request
  end

  def destroy
    model = modelize.find(params[:id])
    return render json: {message: 'success'}, status: :ok if model.destroy
    return_bad_request
  end

  private
  def modelize
    eval(model_name)
  end

  def model_name
    params[:model_name].singularize.underscore.classify
  end

  def permitted_params
    params.require(:data).require(model_name).permit!
  end
end