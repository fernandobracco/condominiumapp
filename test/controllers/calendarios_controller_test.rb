require 'test_helper'

class CalendariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calendario = calendarios(:one)
  end

  test "should get index" do
    get calendarios_url
    assert_response :success
  end

  test "should get new" do
    get new_calendario_url
    assert_response :success
  end

  test "should create calendario" do
    assert_difference('Calendario.count') do
      post calendarios_url, params: { calendario: { descricao: @calendario.descricao, end_time: @calendario.end_time, name: @calendario.name, start_time: @calendario.start_time } }
    end

    assert_redirected_to calendario_url(Calendario.last)
  end

  test "should show calendario" do
    get calendario_url(@calendario)
    assert_response :success
  end

  test "should get edit" do
    get edit_calendario_url(@calendario)
    assert_response :success
  end

  test "should update calendario" do
    patch calendario_url(@calendario), params: { calendario: { descricao: @calendario.descricao, end_time: @calendario.end_time, name: @calendario.name, start_time: @calendario.start_time } }
    assert_redirected_to calendario_url(@calendario)
  end

  test "should destroy calendario" do
    assert_difference('Calendario.count', -1) do
      delete calendario_url(@calendario)
    end

    assert_redirected_to calendarios_url
  end
end
