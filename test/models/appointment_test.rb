require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  test "should save valid appointment with enum status" do
    app = Appointment.new(
      date: Time.current,
      reason: "Checkup",
      pet: pets(:one),
      vet: vets(:one),
      status: :scheduled # Usando el nombre del enum
    )
    assert app.save
  end
end
