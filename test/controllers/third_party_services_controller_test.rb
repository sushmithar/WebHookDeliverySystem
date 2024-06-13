require "test_helper"

class ThirdPartyServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @third_party_service = third_party_services(:one)
  end

  test "should get index" do
    get third_party_services_url, as: :json
    assert_response :success
  end

  test "should create third_party_service" do
    assert_difference("ThirdPartyService.count") do
      post third_party_services_url, params: { third_party_service: { url: @third_party_service.url } }, as: :json
    end

    assert_response :created
  end

  test "should show third_party_service" do
    get third_party_service_url(@third_party_service), as: :json
    assert_response :success
  end

  test "should update third_party_service" do
    patch third_party_service_url(@third_party_service), params: { third_party_service: { url: @third_party_service.url } }, as: :json
    assert_response :success
  end

  test "should destroy third_party_service" do
    assert_difference("ThirdPartyService.count", -1) do
      delete third_party_service_url(@third_party_service), as: :json
    end

    assert_response :no_content
  end
end
