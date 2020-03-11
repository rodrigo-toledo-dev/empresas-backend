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

  # before(:each) do
    
  # end

  describe "GET #index" do
    it "returns http success" do
      get enterprises_path(api_version: 1), headers: auth_params
      expect(response).to have_http_status(:success)
    end

    it "assigns without parameters returning all registers" do
      get enterprises_path(api_version: 1), headers: auth_params
      expect(assigns(:enterprises)).to have(3).items
    end

    it "assigns with parameter name with partial content and return 2 values" do
      get enterprises_path(api_version: 1), params: {name: 'Fi'}, headers: auth_params
      expect(assigns(:enterprises)).to have(2).items
    end

    it "assigns with parameter name with partial content and type to return 1 value" do
      get enterprises_path(api_version: 1), params: {name: 'Fi', type: 0}, headers: auth_params
      expect(assigns(:enterprises)).to have(2).items
    end

    it "test the result in json" do
      get enterprises_path(api_version: 1), params: {name: 'Filho'}, headers: auth_params
      expected = assigns(:enterprises)
      expect(response.body).to eql(expected.to_json)
    end
  end

  describe "GET #show" do
    it "test the result in json" do
      expected = Enterprise.by_name('Coca').first
      get enterprise_path({id: expected, api_version: 1}), headers: auth_params
      expect(response.body).to eql(expected.to_json)
    end
  end

  def sign_in
    @current_user = FactoryBot.create(:user)
    post user_session_path(api_version: 1), params:  { email: @current_user.email, password: '123412345' }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end

  def get_auth_params_from_login_response_headers(response)
    client = response.headers['client']
    token = response.headers['access-token']
    expiry = response.headers['expiry']
    token_type = response.headers['token-type']
    uid = response.headers['uid']

    auth_params = {
      'access-token' => token,
      'client' => client,
      'uid' => uid,
      'expiry' => expiry,
      'token_type' => token_type,
      'token-type' => token_type
    }
    auth_params
  end

  def auth_params
    sign_in
    get_auth_params_from_login_response_headers(response)
  end

end
