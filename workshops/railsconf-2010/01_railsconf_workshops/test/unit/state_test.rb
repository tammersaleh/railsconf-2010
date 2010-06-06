require 'test_helper'

class StateTest < ActiveSupport::TestCase
  context "a state" do
    setup { Factory(:state) }

    should_validate_presence_of :name
  end
end
