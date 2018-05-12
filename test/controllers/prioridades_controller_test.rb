require 'test_helper'

class PrioridadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prioridad = prioridades(:one)
  end

  test "should get index" do
    get prioridades_url
    assert_response :success
  end

  test "should get new" do
    get new_prioridad_url
    assert_response :success
  end

  test "should create prioridad" do
    assert_difference('Prioridad.count') do
      post prioridades_url, params: { prioridad: { prioridad: @prioridad.prioridad } }
    end

    assert_redirected_to prioridad_url(Prioridad.last)
  end

  test "should show prioridad" do
    get prioridad_url(@prioridad)
    assert_response :success
  end

  test "should get edit" do
    get edit_prioridad_url(@prioridad)
    assert_response :success
  end

  test "should update prioridad" do
    patch prioridad_url(@prioridad), params: { prioridad: { prioridad: @prioridad.prioridad } }
    assert_redirected_to prioridad_url(@prioridad)
  end

  test "should destroy prioridad" do
    assert_difference('Prioridad.count', -1) do
      delete prioridad_url(@prioridad)
    end

    assert_redirected_to prioridades_url
  end
end
