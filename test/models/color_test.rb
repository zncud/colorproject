require 'test_helper'

class ColorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @suggeColor = SuggeColor.new(rgb:  "155,59,101,231,86,133,223,141,152,179,85,100,245,211,214")
  end

  test "should be valid" do
    assert @suggeColor.valid?
  end

  test "rgb should be present" do
    @suggeColor.rgb = "   "
    assert_not @suggeColor.valid?
  end

  test "rgb should be unique" do
    duplicate_color = @suggeColor.dup
    @suggeColor.save
    assert_not duplicate_color.valid?
  end
end
