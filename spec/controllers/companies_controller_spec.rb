require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do

  describe "GET #index" do
    before(:all) do
      company = Company.create(name: "Filo")
      company.medium_sized!

      company = Company.create(name: "Filhotinhas")
      company.startup!

      company = Company.create(name: "Coca-colas")
      company.large!
    end
    
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns without parameters returning all registers" do
      get :index
      expect(assigns(:companies)).to have(3).items
    end

    it "assigns with parameter name with partial content and return 2 values" do
      get :index, params: {name: 'Fi'}
      expect(assigns(:companies)).to have(2).items
    end

    it "assigns with parameter name with partial content and type to return 1 value" do
      get :index, params: {name: 'Fi', type: "startup"}
      expect(assigns(:companies)).to have(1).items
    end

    it "test the result in json" do
      get :index, params: {name: 'Filho'}
      expected = assigns(:companies)
      expect(response.body).to eql(expected.to_json)
    end
    
    
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
