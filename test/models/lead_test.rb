require "test_helper"

class LeadTest < ActiveSupport::TestCase
  setup do
    @lead = leads(:one)
    @lead_two = leads(:two)
    @lead_four = leads(:four)
  end

  test "should be valid when all fields are present" do
    assert @lead.valid?
  end

  test "should be invalid when no fields are present" do
    assert @lead_two.invalid?
  end

  test "should be invalid when fields exceed 255 characters" do
    assert @lead_four.invalid?
  end
end
