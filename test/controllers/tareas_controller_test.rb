require 'test_helper'

class TareasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tarea = tareas(:one)
  end

  test "should get index" do
    get tareas_url
    assert_response :success
  end

  test "should get new" do
    get new_tarea_url
    assert_response :success
  end

  test "should create tarea" do
    assert_difference('Tarea.count') do
      post tareas_url, params: { tarea: { comentario: @tarea.comentario, empleado_id: @tarea.empleado_id, estado_id: @tarea.estado_id, prioridad_id: @tarea.prioridad_id, tipo_id: @tarea.tipo_id } }
    end

    assert_redirected_to tarea_url(Tarea.last)
  end

  test "should show tarea" do
    get tarea_url(@tarea)
    assert_response :success
  end

  test "should get edit" do
    get edit_tarea_url(@tarea)
    assert_response :success
  end

  test "should update tarea" do
    patch tarea_url(@tarea), params: { tarea: { comentario: @tarea.comentario, empleado_id: @tarea.empleado_id, estado_id: @tarea.estado_id, prioridad_id: @tarea.prioridad_id, tipo_id: @tarea.tipo_id } }
    assert_redirected_to tarea_url(@tarea)
  end

  test "should destroy tarea" do
    assert_difference('Tarea.count', -1) do
      delete tarea_url(@tarea)
    end

    assert_redirected_to tareas_url
  end
end
