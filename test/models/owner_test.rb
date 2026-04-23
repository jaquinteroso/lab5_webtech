require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  # Test de registro válido
  test "should save valid owner" do
    owner = Owner.new(
      first_name: "Jorge",
      last_name: "Quinteros",
      email: "jorge@uandes.cl",
      phone: "+56912345678"
    )
    assert owner.save
  end

  # Test de validación de presencia
  test "should not save owner without first_name" do
    owner = Owner.new(last_name: "Quinteros", email: "j@uandes.cl", phone: "123")
    assert_not owner.valid?
    assert_includes owner.errors[:first_name], "can't be blank"
  end

  # Test de formato de email
  test "should not save owner with invalid email format" do
    owner = Owner.new(first_name: "A", last_name: "B", email: "invalid-email", phone: "123")
    assert_not owner.valid?
    assert_includes owner.errors[:email], "is invalid"
  end
end
