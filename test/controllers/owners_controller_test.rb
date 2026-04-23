require "test_helper"

class OwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owners_url # Cambiado de owners_index_url
    assert_response :success
  end

  test "should get show" do
    # Usamos el fixture 'one' para tener un ID válido
    get owner_url(owners(:one)) # Cambiado de owners_show_url
    assert_response :success
  end
end
