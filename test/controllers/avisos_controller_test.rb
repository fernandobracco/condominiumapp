require 'test_helper'

class AvisosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get avisos_index_url
    assert_response :success
  end

  test "should get show" do
    get avisos_show_url
    assert_response :success
  end

  test "should get new" do
    get avisos_new_url
    assert_response :success
  end

  test "should get edit" do
    get avisos_edit_url
    assert_response :success
  end

  test "should get create" do
    get avisos_create_url
    assert_response :success
  end

  test "should get criar_aviso" do
    get avisos_criar_aviso_url
    assert_response :success
  end

  test "should get suatela" do
    get avisos_suatela_url
    assert_response :success
  end

  test "should get update" do
    get avisos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get avisos_destroy_url
    assert_response :success
  end

end
