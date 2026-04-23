require "test_helper"

class PetTest < ActiveSupport::TestCase
  test "should save valid pet" do
    # 'owners(:one)' referencia al primer dueño en test/fixtures/owners.yml
    pet = Pet.new(name: "Fido", species: "dog", date_of_birth: 2.years.ago, weight: 10.5, owner: owners(:one))
    assert pet.save
  end

  test "should not save pet with future date of birth" do
    pet = Pet.new(name: "Future", species: "cat", date_of_birth: Date.tomorrow, weight: 5, owner: owners(:one))
    assert_not pet.valid?
    assert_includes pet.errors[:date_of_birth], "can't be in the future"
  end

  test "should not save pet with invalid species" do
    pet = Pet.new(name: "Rex", species: "dragon", date_of_birth: 1.year.ago, weight: 10, owner: owners(:one))
    assert_not pet.valid?
    assert_includes pet.errors[:species], "is not included in the list"
  end
end
