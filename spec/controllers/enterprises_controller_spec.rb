require 'rails_helper'

RSpec.describe EnterprisesController, type: :request do

  before(:all) do
    enterprise = Enterprise.create(name: "Filo")
    enterprise.medium_sized!

    enterprise = Enterprise.create(name: "Filhotinhas")
    enterprise.startup!

    enterprise = Enterprise.create(name: "Coca-colas")
    enterprise.large!
  end

  describe "GET #index" do
    it "returns http success" do
      get enterprises_path
      expect(response).to have_http_status(:success)
    end

    it "assigns without parameters returning all registers" do
      get enterprises_path
      expect(assigns(:enterprises)).to have(3).items
    end

    it "assigns with parameter name with partial content and return 2 values" do
      get enterprises_path, params: {name: 'Fi'}
      expect(assigns(:enterprises)).to have(2).items
    end

    it "assigns with parameter name with partial content and type to return 1 value" do
      get enterprises_path, params: {name: 'Fi', type: "startup"}
      expect(assigns(:enterprises)).to have(1).items
    end

    it "test the result in json" do
      get enterprises_path, params: {name: 'Filho'}
      expected = assigns(:enterprises)
      expect(response.body).to eql(expected.to_json)
    end
  end

  describe "GET #show" do
    it "test the result in json" do
      expected = Enterprise.by_name('Coca').first
      get enterprise_path({id: expected})
      expect(response.body).to eql(expected.to_json)
    end
  end

end
