require 'rails_helper'

RSpec.describe CompaniesController, type: :request do

  before(:all) do
    company = Company.create(name: "Filo")
    company.medium_sized!

    company = Company.create(name: "Filhotinhas")
    company.startup!

    company = Company.create(name: "Coca-colas")
    company.large!
  end

  describe "GET #index" do
    it "returns http success" do
      get companies_path
      expect(response).to have_http_status(:success)
    end

    it "assigns without parameters returning all registers" do
      get companies_path
      expect(assigns(:companies)).to have(3).items
    end

    it "assigns with parameter name with partial content and return 2 values" do
      get companies_path, params: {name: 'Fi'}
      expect(assigns(:companies)).to have(2).items
    end

    it "assigns with parameter name with partial content and type to return 1 value" do
      get companies_path, params: {name: 'Fi', type: "startup"}
      expect(assigns(:companies)).to have(1).items
    end

    it "test the result in json" do
      get companies_path, params: {name: 'Filho'}
      expected = assigns(:companies)
      expect(response.body).to eql(expected.to_json)
    end
  end

  describe "GET #show" do
    it "test the result in json" do
      expected = Company.by_name('Coca').first
      get company_path({id: expected})
      expect(response.body).to eql(expected.to_json)
    end
  end

end
