require 'test_helper'

class RentalUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rental_unit = rental_units(:one)
  end

  test "should get index" do
    get rental_units_url, as: :json
    assert_response :success
  end

  test "should create rental_unit" do
    assert_difference('RentalUnit.count') do
      post rental_units_url, params: { rental_unit: { address: @rental_unit.address, bathrooms: @rental_unit.bathrooms, price_cents: @rental_unit.price_cents, rooms: @rental_unit.rooms } }, as: :json
    end

    assert_response 201
  end

  test "should show rental_unit" do
    get rental_unit_url(@rental_unit), as: :json
    assert_response :success
  end

  test "should update rental_unit" do
    patch rental_unit_url(@rental_unit), params: { rental_unit: { address: @rental_unit.address, bathrooms: @rental_unit.bathrooms, price_cents: @rental_unit.price_cents, rooms: @rental_unit.rooms } }, as: :json
    assert_response 200
  end

  test "should destroy rental_unit" do
    assert_difference('RentalUnit.count', -1) do
      delete rental_unit_url(@rental_unit), as: :json
    end

    assert_response 204
  end
end
