class CompaniesController < ApplicationController
  before_action :set_company

  def index
    @companies = @company.filter_by_name_and_type(params[:name], params[:type])
    render json: @companies
  end

  def show
    render json: @company.find(params[:id])
  end

  protected
  def set_company
    @company ||= Company.unscoped
  end
  
end
