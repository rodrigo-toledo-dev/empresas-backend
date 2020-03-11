class EnterprisesController < ApplicationController
  before_action :set_enterprise

  def index
    @enterprises = @enterprise.filter_by_name_and_type(params[:name], params[:enterprise_types])
    render json: @enterprises
  end

  def show
    render json: @enterprise.find(params[:id])
  end

  protected
  def set_enterprise
    @enterprise ||= Enterprise.unscoped
  end
  
end
